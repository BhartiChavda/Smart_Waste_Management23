from django import forms
from django.contrib.auth.models import User
from .models import Complaint, UserProfile, StaffProfile

class UserRegistrationForm(forms.ModelForm):
    password = forms.CharField(widget=forms.PasswordInput(attrs={'class': 'form-control form-control-lg', 'placeholder': 'Password'}))
    confirm_password = forms.CharField(widget=forms.PasswordInput(attrs={'class': 'form-control form-control-lg', 'placeholder': 'Confirm Password'}))

    class Meta:
        model = User
        fields = ['username', 'email']
        widgets = {
            'username': forms.TextInput(attrs={'class': 'form-control form-control-lg', 'placeholder': 'Full Name / Username'}),
            'email': forms.EmailInput(attrs={'class': 'form-control form-control-lg', 'placeholder': 'Email Address'}),
        }

    def clean(self):
        cleaned_data = super().clean()
        password = cleaned_data.get('password')
        confirm_password = cleaned_data.get('confirm_password')

        if password and confirm_password and password != confirm_password:
            self.add_error('confirm_password', "Passwords do not match.")
            
class ComplaintForm(forms.ModelForm):
    class Meta:
        model = Complaint
        fields = ['image', 'category', 'latitude', 'longitude', 'description']
        widgets = {
            'image': forms.FileInput(attrs={'class': 'form-control', 'required': 'required', 'accept': 'image/*'}),
            'category': forms.Select(attrs={'class': 'form-select', 'required': 'required'}),
            'latitude': forms.HiddenInput(),
            'longitude': forms.HiddenInput(),
            'description': forms.Textarea(attrs={'class': 'form-control', 'rows': 3, 'placeholder': 'Optional description of the complaint...'}),
        }

class UserProfileForm(forms.ModelForm):
    class Meta:
        model = UserProfile
        fields = ['phone', 'address', 'profile_photo']
        widgets = {
            'phone': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Phone Number'}),
            'address': forms.Textarea(attrs={'class': 'form-control', 'rows': 2, 'placeholder': 'Address'}),
            'profile_photo': forms.FileInput(attrs={'class': 'form-control', 'accept': 'image/*'}),
        }

class StaffProfileForm(forms.ModelForm):
    class Meta:
        model = StaffProfile
        fields = ['phone', 'assigned_area', 'designation', 'profile_photo']
        widgets = {
            'phone': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Phone Number'}),
            'assigned_area': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Assigned Area'}),
            'designation': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Designation'}),
            'profile_photo': forms.FileInput(attrs={'class': 'form-control', 'accept': 'image/*'}),
        }
