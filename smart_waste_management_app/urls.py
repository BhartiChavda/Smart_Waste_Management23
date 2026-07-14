from django.urls import path
from . import views

urlpatterns = [
    path('', views.home_page, name='home'),
    path('about/', views.about_page, name='about'),
    path('features/', views.features_page, name='features'),
    path('contact/', views.contact_page, name='contact'),
    path('register/', views.register_view, name='register'),
    path('login/', views.login_view, name='login'),
    path('aslogin/', views.as_login_view, name='as_login'),
    path('otp-verify/', views.otp_verify_view, name='otp_verify'),
    path('resend-otp/', views.resend_otp_view, name='resend_otp'),
    path('forgot-password/', views.forgot_password_view, name='forgot_password'),
    path('forgot-password-verify/', views.forgot_password_verify_view, name='forgot_password_verify'),
    path('reset-password/', views.reset_password_view, name='reset_password'),
    path('logout/', views.logout_view, name='logout'),
    
    # Citizen
    path('dashboard/', views.dashboard, name='dashboard'),
    path('complaint/new/', views.create_complaint, name='create_complaint'),
    path('complaint/history/', views.complaint_history, name='complaint_history'),
    path('impact-score/', views.impact_score_view, name='impact_score'),
    path('profile/', views.profile_view, name='profile'),
    path('profile/send-otp/', views.send_profile_otp, name='send_profile_otp'),
    path('profile/verify-otp/', views.verify_profile_otp, name='verify_profile_otp'),
    path('profile/change-password/', views.change_profile_password, name='change_profile_password'),
    path('api/detect-waste/', views.detect_waste, name='detect_waste'),
    
    # Admin
    path('admin_dashboard/', views.admin_dashboard, name='admin_dashboard'),
    path('admin_dashboard/complaints/', views.manage_complaints, name='manage_complaints'),
    path('api/chart-data/', views.chart_data, name='chart_data'),
    path('api/heatmap-data/', views.heatmap_data, name='heatmap_data'),
    
    # Staff
    path('staff_dashboard/', views.staff_dashboard, name='staff_dashboard'),
    path('staff_dashboard/tasks/', views.staff_tasks, name='staff_tasks'),
    path('staff_dashboard/history/', views.staff_history, name='staff_history'),
    path('staff_dashboard/notifications/', views.staff_notifications, name='staff_notifications'),
    path('staff_dashboard/notifications/<int:notif_id>/', views.staff_notification_click, name='staff_notification_click'),
    path('staff_dashboard/complaint/<int:complaint_id>/', views.staff_complaint_detail, name='staff_complaint_detail'),
    path('staff_dashboard/profile/', views.staff_profile_view, name='staff_profile'),
    path('staff_dashboard/settings/', views.staff_settings_view, name='staff_settings'),
    
    # Admin Previews
    path('admin_dashboard/preview/citizen/', views.preview_citizen, name='preview_citizen'),
    path('admin_dashboard/preview/staff/', views.preview_staff, name='preview_staff'),

    # Admin Management Pages
    path('admin_dashboard/users/', views.manage_users_view, name='manage_users'),
    path('admin_dashboard/staff/', views.manage_staff_view, name='manage_staff'),
    path('admin_dashboard/ai-engine/', views.ai_engine_view, name='ai_engine'),
    path('admin_dashboard/reports/', views.reports_view, name='reports'),
    path('admin_dashboard/settings/', views.settings_view, name='admin_settings'),
]
