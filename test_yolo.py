import os
from ultralytics import YOLO

model = YOLO('models/best.pt')
image_path = os.path.join('media', 'complaints', 'a325b6f0e6f0ddcec54d0c2726f209e.jpg')
print("Predicting on:", image_path)
results = model(image_path)
res = results[0]
if hasattr(res, 'probs') and res.probs is not None:
    print("Top1:", res.names[res.probs.top1], "Conf:", float(res.probs.top1conf))
    for i, p in enumerate(res.probs.data.tolist()):
        print(f"  {res.names[i]}: {p:.4f}")
