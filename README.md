# Tharad Tech

<div align="center">
  <img src="https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white" alt="Flutter"/>
  <img src="https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white" alt="Dart"/>
  <img src="https://img.shields.io/badge/Material%20Design-757575?style=for-the-badge&logo=material-design&logoColor=white" alt="Material Design"/>
  <img src="https://img.shields.io/badge/BLoC-000000?style=for-the-badge&logo=flutter&logoColor=white" alt="BLoC"/>
  <img src="https://img.shields.io/badge/Retrofit-48B983?style=for-the-badge&logo=retrofit&logoColor=white" alt="Retrofit"/>
</div>

<br/>

A sophisticated, production-ready Flutter application showcasing enterprise-level architecture patterns, comprehensive authentication systems, and modern mobile development practices. Built with clean architecture principles, BLoC state management, and elegant Arabic-first UI/UX design.

---

## 📱 Application Overview

**Tharad Tech** is a full-featured mobile application that demonstrates professional Flutter development with:

- 🏗️ **Clean Architecture** - Scalable, maintainable, and testable codebase
- 🔐 **Secure Authentication** - Complete auth flow with JWT token management
- 🎨 **Adaptive Theming** - Light/Dark mode with smooth transitions
- 🌍 **Internationalization** - Full Arabic/English localization support
- 💾 **Data Persistence** - Multi-layered caching with Hive and SharedPreferences
- 🔄 **State Management** - Robust BLoC pattern with Freezed for immutability
- 🎭 **Beautiful UI** - Custom animations, shimmer effects, and Material Design 3

---

<table>
  <tr>
    <td><img src="https://github.com/user-attachments/assets/096e4f4e-a112-41c7-a8dc-a8c43254025a" alt="Tharad Tech"/></td>
  </tr>
</table>

---

## 🚀 Quick Start Guide

### Prerequisites

Before you begin, ensure you have the following installed:

- **Flutter SDK**: `3.8.1` or higher
- **Dart SDK**: `3.8.1` or higher
- **IDE**: Android Studio / VS Code with Flutter plugins
- **Device**: Android device/emulator (API 21+) or iOS device/simulator (iOS 12.0+)

### Installation Steps

1. **Clone the Repository**

   ```bash
   git clone https://github.com/theahmedhany/tharad_tech.git
   cd tharad_tech
   ```

2. **Install Dependencies**

   ```bash
   flutter pub get
   ```

3. **Generate Required Files**

   Run build_runner to generate code for Freezed, JSON serialization, and Retrofit:

   ```bash
   dart run build_runner build --delete-conflicting-outputs
   ```

4. **Run the Application**

   ```bash
   flutter run
   ```

   For specific device:

   ```bash
   flutter run -d <device-id>
   ```

5. **Build for Production**

   **Android (APK):**

   ```bash
   flutter build apk --release
   ```

   **Android (App Bundle):**

   ```bash
   flutter build appbundle --release
   ```

   **iOS:**

   ```bash
   flutter build ios --release
   ```

---

## 🎯 Key Features

### 🔐 Authentication & Security

- **User Registration** - Complete signup flow with form validation

  - Username, email, password fields
  - Profile image upload support
  - Real-time input validation with regex patterns
  - Multi-part form data submission

- **Email Verification (OTP)** - Secure verification system

  - 6-digit OTP code input with custom Pinput widget
  - OTP resend functionality with countdown timer
  - Server-side verification with API integration

- **User Login** - Secure authentication

  - Email and password authentication
  - JWT token management with secure storage
  - Persistent sessions with auto-login capability
  - Remember me functionality

- **Token Management** - Secure credential handling
  - Flutter Secure Storage for sensitive data
  - Automatic token injection in API requests
  - Token refresh mechanism
  - Secure logout with credential cleanup

### 🏠 Home & Dashboard

- **User Dashboard** - Personalized home screen

  - Welcome header with user profile information
  - Quick action cards for common tasks
  - Gradient-based header design
  - Real-time user data updates

- **Profile Management** - Complete user profile system

  - Display user information (name, email, avatar)
  - Profile image with cached network loading
  - Edit profile functionality
  - Shimmer loading effects during data fetch

- **Theme Management** - Comprehensive theming system
  - Light mode with vibrant colors
  - Dark mode with OLED-friendly palette
  - System theme synchronization
  - Persistent theme preference storage
  - Custom theme switcher bottom sheet
  - Smooth theme transition animations

### ✏️ Profile Editing

- **Edit Profile Screen** - Comprehensive profile updates

  - Update username and email
  - Change profile picture with image picker
  - Custom dashed border for image selection
  - Image source selection (Camera/Gallery)
  - Form validation and error handling
  - Success/error feedback with snackbars

- **Image Management** - Advanced image handling
  - Multi-source image picker (camera/gallery)
  - Image compression and optimization
  - Cropping and editing capabilities
  - Cached network image loading
  - Fallback placeholder images

### 🎨 UI/UX Excellence

- **Material Design 3** - Modern design language

  - Custom color schemes for light/dark themes
  - Consistent typography with Tajawal Arabic font
  - Elevation and shadow effects
  - Smooth transitions and animations

- **Responsive Design** - Adaptive layouts

  - ScreenUtil for pixel-perfect UI across devices
  - Flexible layouts with proper spacing
  - Orientation-aware design
  - Support for various screen sizes

- **Loading States** - Professional feedback

  - Custom Lottie animations for loading
  - Shimmer effects for skeleton screens
  - Progress indicators for async operations
  - Pull-to-refresh functionality

- **Error Handling** - User-friendly error management

  - Custom alert dialogs with localized messages
  - Snackbar notifications for quick feedback
  - Network error handling with retry options
  - Form validation with inline error messages

- **Animations** - Smooth and delightful
  - Animate Do for page transitions
  - Lottie animations for loading states
  - Custom hero animations
  - Gesture-based interactions

### 💾 Data Management

- **Multi-Layer Caching** - Efficient data persistence

  - **Hive Database** - Local NoSQL storage

    - Type-safe data models with HiveObject
    - User details caching for offline access
    - Fast read/write operations

  - **SharedPreferences** - Key-value storage

    - Theme preferences
    - User settings
    - App configuration

  - **Flutter Secure Storage** - Encrypted storage
    - JWT tokens
    - Sensitive user credentials
    - Secure key-value pairs

- **Offline Support** - Seamless offline experience
  - Cached user data for instant loading
  - Graceful degradation without network
  - Network-aware UI updates
  - Auto-sync when connection restored

### 🔌 API Integration

- **RESTful API** - Full backend integration

  - Retrofit for type-safe HTTP client
  - Dio for advanced HTTP features
  - Automatic JSON serialization/deserialization
  - Request/response interceptors
  - Pretty logging for debugging

- **Network Features**
  - Automatic retry logic
  - Connection timeout handling
  - Error response parsing
  - Token-based authentication
  - Multi-part form data support

---

## 🏗️ Architecture & Project Structure

### Clean Architecture Principles

The application follows **Clean Architecture** with clear separation of concerns:

```
lib/
├── core/                           # Core functionality & shared resources
│   ├── di/                         # Dependency Injection (GetIt)
│   │   └── dependency_injection.dart
│   ├── helpers/                    # Utility functions
│   │   ├── app_logger.dart        # Logging utility
│   │   ├── app_regex.dart         # Validation patterns
│   │   ├── extensions.dart        # Dart extensions
│   │   ├── shared_pref_helper.dart # Storage wrapper
│   │   └── spacing.dart           # UI spacing helpers
│   ├── networking/                 # API & Network layer
│   │   ├── api_constants.dart     # API endpoints
│   │   ├── api_error_handler.dart # Error management
│   │   ├── api_error_model.dart   # Error models
│   │   ├── api_network_exceptions.dart
│   │   ├── api_result.dart        # Result wrapper
│   │   ├── api_services.dart      # Retrofit services
│   │   └── dio_factory.dart       # Dio configuration
│   ├── routing/                    # Navigation
│   │   ├── app_router.dart        # Route generation
│   │   └── routes.dart            # Route constants
│   ├── theme/                      # Theming system
│   │   ├── app_colors/            # Color palettes
│   │   │   ├── custom_app_colors.dart
│   │   │   ├── dark_app_colors.dart
│   │   │   └── light_app_colors.dart
│   │   ├── app_texts/             # Typography
│   │   │   ├── app_fonts.dart
│   │   │   ├── app_text_styles.dart
│   │   │   └── font_weight_helper.dart
│   │   ├── theme_data/            # Theme configurations
│   │   │   ├── dark_them_data.dart
│   │   │   └── light_theme_data.dart
│   │   └── theme_manager/         # Theme state
│   │       ├── theme_cubit.dart
│   │       └── theme_extensions.dart
│   ├── utils/                      # Constants & utilities
│   │   ├── constants.dart
│   │   └── image_picker_utils.dart
│   └── widgets/                    # Reusable widgets
│       ├── app_text_form_field.dart
│       ├── custom_alert_dialog.dart
│       ├── custom_app_button.dart
│       ├── custom_loading.dart
│       ├── dashed_border_painter.dart
│       ├── profile_image_picker.dart
│       └── show_custom_snack_bar.dart
│
├── features/                       # Feature modules (Clean Architecture)
│   ├── login/                      # Login feature
│   │   ├── data/
│   │   │   ├── models/            # Data models
│   │   │   │   ├── login_request_body.dart
│   │   │   │   └── login_response.dart
│   │   │   └── repos/             # Repository implementations
│   │   │       └── login_repo.dart
│   │   └── presentation/
│   │       ├── logic/             # BLoC/Cubit
│   │       │   ├── login_cubit.dart
│   │       │   └── login_state.dart
│   │       ├── screens/           # UI screens
│   │       │   └── login_screen.dart
│   │       └── widgets/           # Feature widgets
│   │           ├── login_bloc_listener.dart
│   │           ├── login_footer.dart
│   │           ├── login_form.dart
│   │           └── login_header.dart
│   │
│   ├── register/                   # Registration feature
│   │   ├── data/
│   │   │   ├── models/
│   │   │   │   └── register_response.dart
│   │   │   └── repos/
│   │   │       └── register_repo.dart
│   │   └── presentation/
│   │       ├── logic/
│   │       │   ├── register_cubit.dart
│   │       │   └── register_state.dart
│   │       ├── screens/
│   │       │   └── register_screen.dart
│   │       └── widgets/
│   │           ├── register_bloc_listener.dart
│   │           ├── register_footer.dart
│   │           ├── register_form.dart
│   │           └── register_header.dart
│   │
│   ├── verify_email/               # OTP verification feature
│   │   ├── data/
│   │   │   ├── models/
│   │   │   │   └── otp_response.dart
│   │   │   └── repos/
│   │   │       └── otp_repo.dart
│   │   └── presentation/
│   │       ├── logic/
│   │       │   ├── otp_cubit.dart
│   │       │   └── otp_state.dart
│   │       ├── screens/
│   │       │   └── otp_screen.dart
│   │       └── widgets/
│   │           ├── custom_otp_verify_form.dart
│   │           ├── otp_bloc_listener.dart
│   │           └── otp_header.dart
│   │
│   ├── home/                       # Home/Dashboard feature
│   │   ├── data/
│   │   │   ├── cache/             # Local caching
│   │   │   │   └── hive_service.dart
│   │   │   ├── models/
│   │   │   │   └── user_details_model.dart
│   │   │   └── repos/
│   │   │       ├── logout_repo.dart
│   │   │       └── user_details_repo.dart
│   │   └── presentation/
│   │       ├── logic/
│   │       │   ├── logout/
│   │       │   │   ├── logout_cubit.dart
│   │       │   │   └── logout_state.dart
│   │       │   └── user_details/
│   │       │       ├── user_details_cubit.dart
│   │       │       └── user_details_state.dart
│   │       ├── screens/
│   │       │   └── home_screen.dart
│   │       └── widgets/
│   │           ├── home_action_card.dart
│   │           ├── home_header_section.dart
│   │           ├── home_header_section_shimmer.dart
│   │           ├── home_logout_button.dart
│   │           ├── home_quick_actions.dart
│   │           ├── logout_bloc_listener.dart
│   │           ├── logout_dialog.dart
│   │           └── theme_bottom_sheet.dart
│   │
│   └── edit_profile/               # Profile editing feature
│       ├── data/
│       │   ├── models/
│       │   │   └── edit_profile_response.dart
│       │   └── repos/
│       │       └── edit_profile_repo.dart
│       └── presentation/
│           ├── logic/
│           │   ├── edit_profile_cubit.dart
│           │   └── edit_profile_state.dart
│           ├── screens/
│           │   └── edit_profile_screen.dart
│           └── widgets/
│               ├── edit_profile_bloc_listener.dart
│               └── edit_profile_form.dart
│
├── generated/                      # Auto-generated files
│   ├── intl/                       # Localization files
│   └── l10n.dart                  # Localization class
│
├── main.dart                       # Application entry point
└── my_app.dart                     # App widget configuration
```

### Architecture Layers

#### 1. **Presentation Layer**

- **Screens**: UI components and page layouts
- **Widgets**: Reusable UI elements
- **Logic (BLoC/Cubit)**: State management and business logic
- **BLoC Listeners**: Side effects handling (navigation, dialogs, etc.)

#### 3. **Data Layer**

- **Models**: Data transfer objects (DTOs)
- **Repositories**: Data source abstraction
- **API Services**: Network calls with Retrofit
- **Cache Services**: Local data persistence

#### 4. **Core Layer**

- Dependency injection
- Common utilities and helpers
- Shared widgets and components
- Theme and styling
- Navigation and routing

---

## 🔌 API Integration

### Base URL

```
https://flutter.tharadtech.com/api/
```

### API Endpoints

#### Authentication Endpoints

| Method   | Endpoint         | Description                            | Auth Required |
| -------- | ---------------- | -------------------------------------- | ------------- |
| `POST`   | `/auth/register` | Register new user with profile image   | ❌            |
| `POST`   | `/auth/login`    | Authenticate user and get JWT token    | ❌            |
| `GET`    | `/otp`           | Verify OTP code for email verification | ❌            |
| `DELETE` | `/auth/logout`   | Logout and invalidate token            | ✅            |

#### User Management Endpoints

| Method | Endpoint           | Description                              | Auth Required |
| ------ | ------------------ | ---------------------------------------- | ------------- |
| `GET`  | `/profile-details` | Get authenticated user details           | ✅            |
| `POST` | `/Update-Profile`  | Update user profile (name, email, image) | ✅            |

---

## 📦 Dependencies & Packages

### Core Dependencies

#### State Management & Architecture

```yaml
flutter_bloc: ^9.1.0 # BLoC pattern for state management
get_it: ^7.7.0 # Service locator for dependency injection
freezed_annotation: ^2.4.1 # Code generation for immutable classes
```

#### Networking & API

```yaml
dio: ^5.7.0 # Powerful HTTP client
retrofit: ^4.1.0 # Type-safe REST client
pretty_dio_logger: ^1.4.0 # HTTP request/response logging
json_annotation: ^4.9.0 # JSON serialization annotations
```

#### Data Persistence

```yaml
hive: ^2.2.3 # Fast NoSQL database
hive_flutter: ^1.1.0 # Hive Flutter integration
shared_preferences: ^2.3.2 # Simple key-value storage
flutter_secure_storage: ^9.2.2 # Encrypted secure storage
```

#### UI & Animations

```yaml
flutter_screenutil: ^5.9.3 # Responsive design utility
animate_do: ^4.2.0 # Pre-built animations
lottie: ^3.3.1 # Lottie animation player
shimmer: ^3.0.0 # Shimmer loading effect
cached_network_image: ^3.3.1 # Image caching
```

#### Internationalization

```yaml
flutter_localization: ^0.3.2 # Localization support
intl: ^0.20.2 # Internationalization utilities
```

#### Form & Input

```yaml
pinput: ^5.0.0 # OTP input field
image_picker: ^1.1.2 # Image selection from camera/gallery
```

#### Development Tools

```yaml
device_preview: ^1.2.0 # Preview app on multiple devices
logger: ^2.3.0 # Advanced logging
```

### Dev Dependencies

```yaml
flutter_test:
  sdk: flutter # Flutter testing framework
flutter_lints: ^5.0.0 # Dart linting rules
build_runner: ^2.4.12 # Code generation runner
freezed: ^2.4.7 # Freezed code generator
json_serializable: ^6.8.0 # JSON serialization generator
retrofit_generator: ^7.0.8 # Retrofit code generator
hive_generator: ^2.0.1 # Hive adapter generator
```

### Splash Screen Configuration

```yaml
flutter_native_splash: ^2.4.7     # Native splash screen

flutter_native_splash:
  color: "#F4F7F6"                # Background color
  image: assets/images/splash_screen.png
  android_12:
    image: assets/images/splash_screen.png
    color: "#F4F7F6"
```

---

## 🎨 Theming System

### Custom Theme Architecture

The app features a sophisticated theming system with:

#### Color Palettes

**Light Theme Colors:**

- Primary: `#4A90E2` (Blue)
- Background: `#F4F7F6` (Light Gray)
- Surface: `#FFFFFF` (White)
- Text: `#1A1A1A` (Dark Gray)
- Accent: Gradient blues and purples

**Dark Theme Colors:**

- Primary: `#64B5F6` (Light Blue)
- Background: `#121212` (True Black)
- Surface: `#1E1E1E` (Dark Surface)
- Text: `#E0E0E0` (Light Gray)
- Accent: Gradient purples and blues

#### Typography

**Custom Font:** Tajawal (Arabic-optimized)

- Extra Light (200)
- Light (300)
- Regular (400)
- Medium (500)
- Bold (700)
- Extra Bold (800)
- Black (900)

**Text Styles:**

- Headlines: 20sp - 32sp (Bold)
- Body: 14sp - 16sp (Regular/Medium)
- Captions: 12sp (Light)
- Buttons: 16sp (Medium/Bold)

#### Theme Manager

```dart
// Access custom colors
context.customAppColors.primary600
context.customAppColors.background
context.customAppColors.primaryGradient

// Change theme
context.read<ThemeCubit>().updateTheme(ThemeMode.dark)

// Get current theme
final currentTheme = context.read<ThemeCubit>().state
```

---

## 📱 Demo & Downloads

### Demo Video

https://github.com/user-attachments/assets/0229338a-b9e4-4d17-9906-54127af9dadb

> A comprehensive walkthrough showcasing all app features including authentication, profile management, theme switching, and community browsing.

### APK Download

**[⬇ Download APK](https://drive.google.com/file/d/1ZACpa58od-acPc3DTPipiB-eoaxKQ9jS/view?usp=drive_link)**

> Direct download link for Android APK file to test the application on Android devices.

---

## **Connect & Collaborate**

Ready to discuss mobile development projects or freelancing opportunities? Let's connect!

<div align="left">
  <a href="mailto:a7medhanyshokry@gmail.com" target="_blank">
    <img src="https://skillicons.dev/icons?i=gmail&theme=light" width="52" height="40" alt="gmail logo"/>
  </a>
  <a href="https://www.linkedin.com/in/theahmedhany/" target="_blank">
    <img src="https://skillicons.dev/icons?i=linkedin&theme=dark" width="52" height="40" alt="linkedin logo"/>
  </a>
  <a href="https://x.com/theahmedhany" target="_blank">
    <img src="https://skillicons.dev/icons?i=twitter&theme=dark" width="52" height="40" alt="twitter logo"/>
  </a>
</div>

---
