import os
import shutil
import random
import django
from ultralytics import YOLO

# Initialize Django environment
os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'Smart_Waste_Management.settings')
django.setup()

from django.conf import settings

def main():
    print("Setting up YOLO classification dataset directory...")
    dataset_dir = os.path.join(settings.BASE_DIR, 'media', 'yolo_classification_dataset')
    
    # Clean previous dataset if any
    if os.path.exists(dataset_dir):
        shutil.rmtree(dataset_dir)
        
    classes = ['BIODEGRADABLE', 'CARDBOARD', 'ELECTRONIC WASTE', 'GLASS', 'METAL', 'PAPER', 'PLASTIC']
    
    # Create train and val directories for each class
    for split in ['train', 'val']:
        for cls in classes:
            os.makedirs(os.path.join(dataset_dir, split, cls), exist_ok=True)
            
    import kagglehub
    
    # 1. Populate GLASS class from the downloaded Kaggle dataset
    print("Preparing GLASS images...")
    glass_path = kagglehub.dataset_download("nandinibagga/glass-images-for-waste-segregation")
    glass_src_dir = os.path.join(glass_path, "glass")
    glass_images = [f for f in os.listdir(glass_src_dir) if f.lower().endswith(('.jpg', '.jpeg', '.png'))]
    
    # Shuffle and split 80% train, 20% val
    random.seed(42)
    random.shuffle(glass_images)
    split_idx = int(len(glass_images) * 0.8)
    for img in glass_images[:split_idx]:
        shutil.copy(os.path.join(glass_src_dir, img), os.path.join(dataset_dir, 'train', 'GLASS', img))
    for img in glass_images[split_idx:]:
        shutil.copy(os.path.join(glass_src_dir, img), os.path.join(dataset_dir, 'val', 'GLASS', img))
        
    # 2. Populate CARDBOARD class from the downloaded Kaggle dataset
    print("Preparing CARDBOARD images...")
    cardboard_path = kagglehub.dataset_download("nandinibagga/cardboard-images-data-for-waste-segregation")
    cardboard_src_dir = os.path.join(cardboard_path, "cardboard")
    cardboard_images = [f for f in os.listdir(cardboard_src_dir) if f.lower().endswith(('.jpg', '.jpeg', '.png'))]
    random.shuffle(cardboard_images)
    split_idx = int(len(cardboard_images) * 0.8)
    for img in cardboard_images[:split_idx]:
        shutil.copy(os.path.join(cardboard_src_dir, img), os.path.join(dataset_dir, 'train', 'CARDBOARD', img))
    for img in cardboard_images[split_idx:]:
        shutil.copy(os.path.join(cardboard_src_dir, img), os.path.join(dataset_dir, 'val', 'CARDBOARD', img))

    # 3. Populate ELECTRONIC WASTE class from E-Waste dataset (combining all subclasses)
    print("Preparing ELECTRONIC WASTE images...")
    ewaste_path = kagglehub.dataset_download("akshat103/e-waste-image-dataset")
    ewaste_src_base = os.path.join(ewaste_path, "modified-dataset")
    
    # We will copy from train/ and val/ divisions in e-waste dataset
    for split in ['train', 'val']:
        target_split = 'train' if split == 'train' else 'val'
        split_dir = os.path.join(ewaste_src_base, split)
        if os.path.exists(split_dir):
            for sub_cat in os.listdir(split_dir):
                sub_cat_dir = os.path.join(split_dir, sub_cat)
                if os.path.isdir(sub_cat_dir):
                    for img in os.listdir(sub_cat_dir):
                        if img.lower().endswith(('.jpg', '.jpeg', '.png')):
                            src_img_path = os.path.join(sub_cat_dir, img)
                            # unique name to prevent collisions
                            dest_name = f"{sub_cat.replace(' ', '_')}_{img}"
                            dest_img_path = os.path.join(dataset_dir, target_split, 'ELECTRONIC WASTE', dest_name)
                            shutil.copy(src_img_path, dest_img_path)

    # 4. Populate PLASTIC class from Plastic Multiclass dataset
    print("Preparing PLASTIC images...")
    plastic_path = kagglehub.dataset_download("yadavmohit04/plastic-multiclass-dataset")
    
    # Roboflow dataset format: train/images and valid/images
    for split in ['train', 'valid']:
        target_split = 'train' if split == 'train' else 'val'
        split_img_dir = os.path.join(plastic_path, split, 'images')
        if os.path.exists(split_img_dir):
            # Limit the number of copied images so training is fast
            img_list = [f for f in os.listdir(split_img_dir) if f.lower().endswith(('.jpg', '.jpeg', '.png'))]
            random.shuffle(img_list)
            # Copy at most 300 train images and 60 val images
            limit = 300 if split == 'train' else 60
            for img in img_list[:limit]:
                src_img_path = os.path.join(split_img_dir, img)
                dest_img_path = os.path.join(dataset_dir, target_split, 'PLASTIC', img)
                shutil.copy(src_img_path, dest_img_path)

    # 5. Populate BIODEGRADABLE, METAL, and PAPER classes from viswaprakash1990/garbage-detection
    print("Preparing BIODEGRADABLE, METAL, and PAPER images from garbage-detection dataset...")
    garbage_det_path = kagglehub.dataset_download("viswaprakash1990/garbage-detection")
    garbage_base_dir = os.path.join(garbage_det_path, "GARBAGE CLASSIFICATION")
    
    detection_classes = ['BIODEGRADABLE', 'CARDBOARD', 'GLASS', 'METAL', 'PAPER', 'PLASTIC']
    target_classes = ['BIODEGRADABLE', 'METAL', 'PAPER']
    
    from PIL import Image
    for split in ['train', 'valid']:
        target_split = 'train' if split == 'train' else 'val'
        split_dir = os.path.join(garbage_base_dir, split)
        if not os.path.exists(split_dir):
            continue
            
        images_dir = os.path.join(split_dir, 'images')
        labels_dir = os.path.join(split_dir, 'labels')
        if not os.path.exists(images_dir) or not os.path.exists(labels_dir):
            continue
            
        counts = {cls: 0 for cls in target_classes}
        max_limit = 300 if split == 'train' else 60
        
        img_files = os.listdir(images_dir)
        random.shuffle(img_files)
        
        for img_name in img_files:
            if not img_name.lower().endswith(('.jpg', '.jpeg', '.png')):
                continue
                
            if all(counts[cls] >= max_limit for cls in target_classes):
                break
                
            base_name, _ = os.path.splitext(img_name)
            label_name = f"{base_name}.txt"
            label_path = os.path.join(labels_dir, label_name)
            
            if os.path.exists(label_path):
                img_path = os.path.join(images_dir, img_name)
                try:
                    with open(label_path, 'r') as lf:
                        lines = lf.readlines()
                    
                    if not lines:
                        continue
                        
                    img = Image.open(img_path)
                    W, H = img.size
                    
                    for idx, line in enumerate(lines):
                        parts = line.strip().split()
                        if len(parts) >= 5:
                            cls_id = int(parts[0])
                            if cls_id < len(detection_classes):
                                cls_name = detection_classes[cls_id]
                                if cls_name in target_classes and counts[cls_name] < max_limit:
                                    x_c, y_c, w, h = float(parts[1]), float(parts[2]), float(parts[3]), float(parts[4])
                                    x1 = max(0, int((x_c - w/2) * W))
                                    y1 = max(0, int((y_c - h/2) * H))
                                    x2 = min(W, int((x_c + w/2) * W))
                                    y2 = min(H, int((y_c + h/2) * H))
                                    
                                    if x2 > x1 and y2 > y1:
                                        crop_img = img.crop((x1, y1, x2, y2))
                                        dest_filename = f"crop_{base_name}_{idx}.jpg"
                                        crop_img.convert('RGB').save(os.path.join(dataset_dir, target_split, cls_name, dest_filename))
                                        counts[cls_name] += 1
                except Exception as e:
                    print(f"Error cropping {img_name}: {e}")
                    
    print("Dataset setup completed successfully!")
    print("Loading pretrained YOLOv8-cls model...")
    model = YOLO('yolov8n-cls.pt')
    
    print("Starting training (3 epochs, quick run for demonstration)...")
    results = model.train(
        data=dataset_dir,
        epochs=3,
        imgsz=64,
        device='cpu'
    )
    
    print("Training completed successfully!")
    
    # Copy best weights to models/best.pt
    best_weights_path = os.path.join(results.save_dir, 'weights', 'best.pt')
    target_weights_path = os.path.join(settings.BASE_DIR, 'models', 'best.pt')
    
    if os.path.exists(best_weights_path):
        os.makedirs(os.path.dirname(target_weights_path), exist_ok=True)
        shutil.copy(best_weights_path, target_weights_path)
        print(f"Successfully copied trained weights to {target_weights_path}!")
    else:
        print("Error: Could not locate trained weights file.")

if __name__ == '__main__':
    main()
