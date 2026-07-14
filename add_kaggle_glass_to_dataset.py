import os
import shutil
import django
import kagglehub

# Initialize Django environment
os.environ.setdefault('DSN_SETTINGS_MODULE', 'Smart_Waste_Management.settings')
os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'Smart_Waste_Management.settings')
django.setup()

from smart_waste_management_app.models import DatasetItem
from django.conf import settings

def main():
    print("Downloading dataset from Kaggle...")
    path = kagglehub.dataset_download("nandinibagga/glass-images-for-waste-segregation")
    print("Dataset downloaded to:", path)
    
    glass_dir = os.path.join(path, "glass")
    if not os.path.exists(glass_dir):
        print(f"Error: Could not find 'glass' folder in {path}")
        return
        
    # Get all image files
    images = [f for f in os.listdir(glass_dir) if f.lower().endswith(('.jpg', '.jpeg', '.png'))]
    print(f"Found {len(images)} images in the glass dataset.")
    
    # Target directory in Django media
    target_dir = os.path.join(settings.MEDIA_ROOT, 'training_dataset')
    os.makedirs(target_dir, exist_ok=True)
    
    count = 0
    for img_name in images:
        src_path = os.path.join(glass_dir, img_name)
        # Create a unique name to avoid conflicts
        dest_name = f"kaggle_glass_{img_name}"
        dest_path = os.path.join(target_dir, dest_name)
        
        # Copy file
        shutil.copy(src_path, dest_path)
        
        # Create database entry
        relative_path = f"training_dataset/{dest_name}"
        DatasetItem.objects.get_or_create(
            image=relative_path,
            label='GLASS'
        )
        count += 1
        
    print(f"Successfully imported {count} images into the Django database under label 'GLASS'.")

if __name__ == '__main__':
    main()
