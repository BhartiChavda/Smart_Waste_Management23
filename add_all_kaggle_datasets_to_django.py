import os
import shutil
import random
import django
import kagglehub

# Initialize Django environment
os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'Smart_Waste_Management.settings')
django.setup()

from smart_waste_management_app.models import DatasetItem
from django.conf import settings

def import_glass():
    print("Importing GLASS images...")
    path = kagglehub.dataset_download("nandinibagga/glass-images-for-waste-segregation")
    src_dir = os.path.join(path, "glass")
    images = [f for f in os.listdir(src_dir) if f.lower().endswith(('.jpg', '.jpeg', '.png'))]
    random.shuffle(images)
    
    target_dir = os.path.join(settings.MEDIA_ROOT, 'training_dataset')
    os.makedirs(target_dir, exist_ok=True)
    
    count = 0
    for img_name in images[:100]:
        src_path = os.path.join(src_dir, img_name)
        dest_name = f"kaggle_glass_{img_name}"
        dest_path = os.path.join(target_dir, dest_name)
        shutil.copy(src_path, dest_path)
        
        DatasetItem.objects.get_or_create(
            image=f"training_dataset/{dest_name}",
            label='GLASS'
        )
        count += 1
    print(f"Imported {count} GLASS images.")

def import_cardboard():
    print("Importing CARDBOARD images...")
    path = kagglehub.dataset_download("nandinibagga/cardboard-images-data-for-waste-segregation")
    src_dir = os.path.join(path, "cardboard")
    images = [f for f in os.listdir(src_dir) if f.lower().endswith(('.jpg', '.jpeg', '.png'))]
    random.shuffle(images)
    
    target_dir = os.path.join(settings.MEDIA_ROOT, 'training_dataset')
    os.makedirs(target_dir, exist_ok=True)
    
    count = 0
    for img_name in images[:100]:
        src_path = os.path.join(src_dir, img_name)
        dest_name = f"kaggle_cardboard_{img_name}"
        dest_path = os.path.join(target_dir, dest_name)
        shutil.copy(src_path, dest_path)
        
        DatasetItem.objects.get_or_create(
            image=f"training_dataset/{dest_name}",
            label='CARDBOARD'
        )
        count += 1
    print(f"Imported {count} CARDBOARD images.")

def import_ewaste():
    print("Importing ELECTRONIC WASTE images...")
    path = kagglehub.dataset_download("akshat103/e-waste-image-dataset")
    src_base = os.path.join(path, "modified-dataset", "train")
    
    all_images = []
    if os.path.exists(src_base):
        for sub in os.listdir(src_base):
            sub_dir = os.path.join(src_base, sub)
            if os.path.isdir(sub_dir):
                for img in os.listdir(sub_dir):
                    if img.lower().endswith(('.jpg', '.jpeg', '.png')):
                        all_images.append((sub, img, os.path.join(sub_dir, img)))
                        
    random.shuffle(all_images)
    
    target_dir = os.path.join(settings.MEDIA_ROOT, 'training_dataset')
    os.makedirs(target_dir, exist_ok=True)
    
    count = 0
    for sub, img_name, src_path in all_images[:100]:
        dest_name = f"kaggle_ewaste_{sub.replace(' ', '_')}_{img_name}"
        dest_path = os.path.join(target_dir, dest_name)
        shutil.copy(src_path, dest_path)
        
        DatasetItem.objects.get_or_create(
            image=f"training_dataset/{dest_name}",
            label='ELECTRONIC WASTE'
        )
        count += 1
    print(f"Imported {count} ELECTRONIC WASTE images.")

def import_plastic():
    print("Importing PLASTIC images...")
    path = kagglehub.dataset_download("yadavmohit04/plastic-multiclass-dataset")
    src_dir = os.path.join(path, "train", "images")
    
    images = [f for f in os.listdir(src_dir) if f.lower().endswith(('.jpg', '.jpeg', '.png'))]
    random.shuffle(images)
    
    target_dir = os.path.join(settings.MEDIA_ROOT, 'training_dataset')
    os.makedirs(target_dir, exist_ok=True)
    
    count = 0
    for img_name in images[:100]:
        src_path = os.path.join(src_dir, img_name)
        dest_name = f"kaggle_plastic_{img_name}"
        dest_path = os.path.join(target_dir, dest_name)
        shutil.copy(src_path, dest_path)
        
        DatasetItem.objects.get_or_create(
            image=f"training_dataset/{dest_name}",
            label='PLASTIC'
        )
        count += 1
    print(f"Imported {count} PLASTIC images.")

def main():
    # Clean old ones first to prevent bloating
    print("Cleaning existing DatasetItems to start fresh...")
    DatasetItem.objects.all().delete()
    
    import_glass()
    import_cardboard()
    import_ewaste()
    import_plastic()
    print("All datasets successfully imported!")

if __name__ == '__main__':
    main()
