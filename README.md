# Smart Waste Management System

A production-ready Django application designed to optimize waste management through an intuitive citizen portal and an advanced administrative dashboard. It utilizes artificial intelligence concepts (mocked for demonstration) to categorize waste, predict dustbin fill levels, assign priority, and detect duplicates.

## Features

*   **Authentication System:** Secure registration, login, and profile management for citizens and admins.
*   **Citizen Panel:** 
    *   Dashboard with statistics.
    *   Upload complaints with images and automatic GPS location tagging using Leaflet maps.
    *   View complaint history with real-time status.
*   **AI Integration (Mocked):** 
    *   Garbage type detection (Plastic, Paper, Organic, Metal, Glass, E-Waste).
    *   Dustbin level prediction (Full, Medium, Empty).
    *   Priority assignment (Low, Medium, High, Critical) based on dustbin levels.
    *   Duplicate complaint detection to prevent redundant requests.
*   **Admin Dashboard:** 
    *   Comprehensive overview of total, pending, resolved, and critical complaints.
    *   Interactive charts (Chart.js) detailing waste category distributions.
    *   Geographical heatmap of all complaints using Leaflet.heat.
    *   Manage and update complaint statuses.
*   **Notifications:** Email notifications sent upon successful submission of a complaint.

## Technology Stack

*   **Backend:** Python, Django
*   **Database:** SQLite (default)
*   **Frontend:** HTML5, Bootstrap 5, Custom CSS
*   **Maps & Charts:** Leaflet.js, OpenStreetMap, Chart.js

## Installation

1.  **Clone the repository:**
    ```bash
    git clone <repository-url>
    cd Smart_Waste_Management
    ```

2.  **Create a virtual environment:**
    ```bash
    python -m venv venv
    venv\Scripts\activate  # On Windows
    source venv/bin/activate # On macOS/Linux
    ```

3.  **Install dependencies:**
    ```bash
    pip install -r requirements.txt
    ```

4.  **Run Migrations:**
    ```bash
    python manage.py makemigrations
    python manage.py migrate
    ```

5.  **Create a Superuser (Admin):**
    ```bash
    python manage.py createsuperuser
    ```

6.  **Run the Server:**
    ```bash
    python manage.py runserver
    ```

## Usage

*   Navigate to `http://127.0.0.1:8000/` to access the application.
*   Register as a new user or log in.
*   Admins can log in using their superuser credentials to access the admin dashboard.

## Project Structure
*   `Smart_Waste_Management/`: Main project settings and configurations.
*   `smart_waste_management_app/`: Core application containing models, views, and forms.
*   `templates/`: HTML templates categorized into `auth`, `citizen`, and `admin_panel`.
*   `static/`: Static assets (CSS, JS).
*   `media/`: User-uploaded images for complaints.
