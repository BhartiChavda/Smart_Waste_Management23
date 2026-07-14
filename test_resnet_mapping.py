import torch
import torchvision.models as models
import torchvision.transforms as transforms
from PIL import Image
import urllib.request
import os

# Load ImageNet class names
url = "https://raw.githubusercontent.com/pytorch/hub/master/imagenet_classes.txt"
imagenet_classes = urllib.request.urlopen(url).read().decode('utf-8').splitlines()

# Load ResNet18
try:
    weights = models.ResNet18_Weights.DEFAULT
    resnet = models.resnet18(weights=weights)
except AttributeError:
    resnet = models.resnet18(pretrained=True)
resnet.eval()

preprocess = transforms.Compose([
    transforms.Resize(256),
    transforms.CenterCrop(224),
    transforms.ToTensor(),
    transforms.Normalize(
        mean=[0.485, 0.456, 0.406],
        std=[0.229, 0.224, 0.225]
    ),
])

def map_imagenet_to_waste(imagenet_class):
    cls = imagenet_class.lower()
    
    # Check for Electronic Waste
    for word in ['computer', 'laptop', 'phone', 'keyboard', 'mouse', 'screen', 'monitor', 'television', 'cable', 'wire', 'battery', 'device', 'appliance', 'modem', 'ipod']:
        if word in cls:
            return 'ELECTRONIC WASTE'
            
    # Check for Glass
    for word in ['bottle', 'glass', 'jar', 'decanter', 'goblet', 'vase', 'shatter', 'shards', 'lens', 'tumbler', 'beaker']:
        if word in cls:
            return 'GLASS'
            
    # Check for Plastic
    for word in ['plastic', 'bag', 'balloon', 'tub', 'wrapper', 'packaging', 'packet']:
        if word in cls:
            return 'PLASTIC'
            
    # Check for Cardboard
    for word in ['cardboard', 'carton', 'box']:
        if word in cls:
            return 'CARDBOARD'
            
    # Check for Paper
    for word in ['paper', 'envelope', 'book', 'magazine', 'newspaper', 'notebook']:
        if word in cls:
            return 'PAPER'
            
    # Check for Metal
    for word in ['can', 'tin', 'metal', 'brass', 'iron', 'steel', 'aluminum', 'nail', 'screw', 'chain', 'lock']:
        if word in cls:
            return 'METAL'
            
    # Check for Biodegradable
    for word in ['fruit', 'vegetable', 'banana', 'apple', 'orange', 'lemon', 'bread', 'food', 'meat', 'salad', 'flower', 'leaf', 'plant', 'tree', 'wood', 'stinkhorn', 'mushroom', 'cabbage', 'broccoli']:
        if word in cls:
            return 'BIODEGRADABLE'
            
    return None

img_dir = os.path.join('media', 'complaints')
for f in os.listdir(img_dir):
    if f.lower().endswith('.jpg'):
        path = os.path.join(img_dir, f)
        img = Image.open(path).convert('RGB')
        tensor = preprocess(img).unsqueeze(0)
        
        with torch.no_grad():
            output = resnet(tensor)
            
        probabilities = torch.nn.functional.softmax(output[0], dim=0)
        top5_prob, top5_catid = torch.topk(probabilities, 5)
        
        mapped_class = None
        for i in range(5):
            cat_name = imagenet_classes[top5_catid[i]]
            mapped = map_imagenet_to_waste(cat_name)
            if mapped:
                mapped_class = mapped
                break
                
        if not mapped_class:
            mapped_class = 'ELECTRONIC WASTE' # fallback
            
        print(f"Image: {f} -> Predicted: {mapped_class}")
