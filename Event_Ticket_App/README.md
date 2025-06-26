Event Booking App with Riverpod and REST API
Overview
A Flutter-based mobile application for booking event tickets, searching events, viewing past bookings, managing user profiles, and handling authentication (login, logout, registration). The app uses a REST API for all backend operations, follows the MEDD (Model-Entity-Domain-Data) architecture, and leverages Riverpod for state management. Firebase Authentication is used for user login/registration, while all other functionalities (events, bookings, profiles) are handled via a REST API.
Features

Authentication: User registration, login, and logout using Api.
Event Booking: Browse and book tickets for events via API.
Event Search: Search for events by name or details using API queries.
Past Bookings: View history of booked tickets fetched from API.
User Profile: View and update user profile information via API.
Riverpod State Management: Manage app state (authentication, events, bookings) using Riverpod providers.
REST API Integration: Communicate with a backend server for all data operations.

Requirements

Flutter SDK: >=3.10.0
Dart: >=3.0.0 <4.0.0
Firebase account for authentication
REST API backend (e.g., Node.js, Django) with endpoints for events, bookings, and profiles
IDE (e.g., VS Code, Android Studio)
Android/iOS emulator or physical device

Setup Instructions

Clone the Repository
git clone <repository-url>
cd event-booking-app


Install Dependencies
flutter pub get

Configure API

Set up your REST API backend with the following endpoints:
POST /auth/register: Register a new user.
POST /auth/login: Login and return a token.
GET /events: Fetch list of events.
GET /events/search?q={query}: Search events by query.
POST /bookings: Create a new booking.
GET /bookings: Fetch user's past bookings.
GET /profile: Fetch user profile.
PUT /profile: Update user profile.


Update lib/core/constants/api_constants.dart with your API base URL.


Run the App
flutter run



Project Structure (MEDD Architecture with Riverpod)

Model: Data models (e.g., Event, Booking, UserProfile) for API responses.
Entity: Core business entities for events, bookings, and profiles.
Domain: Business logic and use cases for interacting with the API.
Data: Repositories and data sources for API calls using http.


Dependencies
Add these to your pubspec.yaml:
dependencies:
flutter:
sdk: flutter
cupertino_icons: ^1.0.8
# State Management
flutter_riverpod: ^2.4.9

# Networking
dio: ^5.4.0

# Local Storage
shared_preferences: ^2.2.2
flutter_secure_storage: ^9.0.0

# Code Generation
freezed_annotation: ^2.4.1
json_annotation: ^4.9.0

# Navigation
go_router: ^12.1.3

# UI & Utils
qr_flutter: ^4.1.0
cached_network_image: ^3.3.0
intl: ^0.19.0
flutter_svg: ^2.0.9

Usage

Login/Register: Authenticate using Firebase Authentication, with tokens stored for API requests.
Search Events: Use the search screen to query events via the API.
Book Tickets: Select an event and book tickets, sent to the API.
View Bookings: Fetch and display past bookings from the API.
Profile: View and update profile details via API.
Logout: Sign out and clear local state.

API Integration
The app assumes a REST API with the following endpoints (update as per your backend):

Auth: /auth/register, /auth/login
Events: /events, /events/search?q={query}
Bookings: /bookings (POST for creating, GET for listing)
Profile: /profile (GET for fetching, PUT for updating)



Notes

Ensure API endpoints are secure (e.g., use HTTPS, token-based authentication).
Implement error handling for network failures and API errors.
Test on both Android and iOS for platform compatibility.
