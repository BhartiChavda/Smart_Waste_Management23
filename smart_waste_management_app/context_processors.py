from smart_waste_management_app.models import Complaint, Notification

def staff_badge_counts(request):
    if request.user.is_authenticated and request.user.is_staff:
        # Count all complaints that are assigned
        assigned_count = Complaint.objects.filter(status='Assigned').count()
        # Count unread notifications for the current logged-in user
        unread_notifs = Notification.objects.filter(user=request.user, is_read=False).count()
        
        return {
            'staff_assigned_count': assigned_count,
            'staff_unread_notifications_count': unread_notifs,
        }
    return {}
