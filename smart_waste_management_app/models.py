from django.db import models
from django.contrib.auth.models import User


class UserProfile(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE)
    phone = models.CharField(max_length=15, blank=True, null=True)
    address = models.TextField(blank=True, null=True)
    profile_photo = models.ImageField(upload_to='citizen_profiles/', blank=True, null=True)

    def __str__(self):
        return f"{self.user.username}'s Profile"

class Complaint(models.Model):
    CATEGORY_CHOICES = (
        ('PLASTIC', 'PLASTIC'),
        ('PAPER', 'PAPER'),
        ('BIODEGRADABLE', 'BIODEGRADABLE'),
        ('METAL', 'METAL'),
        ('GLASS', 'GLASS'),
        ('ELECTRONIC WASTE', 'ELECTRONIC WASTE'),
        ('CARDBOARD', 'CARDBOARD'),
    )

    DUSTBIN_CHOICES = (
        ('Full', 'Full'),
        ('Medium', 'Medium'),
        ('Empty', 'Empty'),
    )

    PRIORITY_CHOICES = (
        ('Low', 'Low'),
        ('Medium', 'Medium'),
        ('High', 'High'),
        ('Critical', 'Critical'),
    )

    STATUS_CHOICES = (
        ('Pending', 'Pending'),
        ('Accepted', 'Accepted'),
        ('On The Way', 'On The Way'),
        ('Reached Location', 'Reached Location'),
        ('Cleaning Started', 'Cleaning Started'),
        ('Cleaning Completed', 'Cleaning Completed'),
        ('Resolved', 'Resolved'),
        ('Rejected', 'Rejected'),
    )

    user = models.ForeignKey(User, on_delete=models.CASCADE, related_name='filed_complaints')
    assigned_to = models.ForeignKey(User, on_delete=models.SET_NULL, blank=True, null=True, related_name='assigned_tasks')
    image = models.ImageField(upload_to='complaints/')
    before_image = models.ImageField(upload_to='complaints/before/', blank=True, null=True)
    after_image = models.ImageField(upload_to='complaints/after/', blank=True, null=True)
    latitude = models.FloatField()
    longitude = models.FloatField()
    category = models.CharField(max_length=20, choices=CATEGORY_CHOICES, blank=True, null=True)
    dustbin_level = models.CharField(max_length=10, choices=DUSTBIN_CHOICES, blank=True, null=True)
    priority = models.CharField(max_length=10, choices=PRIORITY_CHOICES, blank=True, null=True)
    status = models.CharField(max_length=20, choices=STATUS_CHOICES, default='Pending')
    is_duplicate = models.BooleanField(default=False)
    created_at = models.DateTimeField(auto_now_add=True)
    description = models.TextField(blank=True, null=True)

    def __str__(self):
        return f"Complaint {self.id} - {self.user.username}"

class StaffProfile(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE, related_name='staff_profile')
    employee_id = models.CharField(max_length=20, unique=True)
    phone = models.CharField(max_length=15, blank=True, null=True)
    assigned_area = models.CharField(max_length=100, blank=True, null=True)
    designation = models.CharField(max_length=50, blank=True, null=True)
    profile_photo = models.ImageField(upload_to='staff_profiles/', blank=True, null=True)

    def __str__(self):
        return f"{self.user.username} - {self.employee_id}"

class Notification(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE, related_name='notifications')
    title = models.CharField(max_length=100)
    message = models.TextField()
    is_read = models.BooleanField(default=False)
    created_at = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return f"Notification for {self.user.username}: {self.title}"

class CustomCategory(models.Model):
    name = models.CharField(max_length=50, unique=True)
    created_at = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return self.name

class DatasetItem(models.Model):
    image = models.ImageField(upload_to='training_dataset/', max_length=255)
    label = models.CharField(max_length=50)
    created_at = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return f"{self.label} - {self.id}"
