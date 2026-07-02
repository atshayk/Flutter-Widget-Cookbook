# Flutter Widget Cookbook

A comprehensive Flutter application demonstrating various widgets and architectural patterns including Riverpod state management, API integration, and Material Design components. 
Built with Dart.

## Features

- **State Management**: Riverpod for clean and scalable state management
- **API Integration**: Dio HTTP client for REST API communication
- **Authentication Flow**: Login screen with form validation
- **Widget Demonstrations**: Comprehensive examples of Flutter widgets organized by category
- **Clean Architecture**: Separation of concerns with repository pattern
- **Responsive UI**: Material Design components with custom theming

## Project Structure

```
lib/
├── main.dart                  # Entry point with Riverpod setup
├── app_theme.dart             # Custom theme and styling
├── providers.dart             # Riverpod providers configuration
├── data/
│   └── api/
│       └── api_service.dart   # API service layer
├── repository/
│   ├── post_repository.dart
│   └── post_repository_impl.dart
├── models/
│   └── post_model.dart        # Data model for API responses
├── ui/
│   ├── login/
│   │   ├── login_screen.dart
│   │   └── login_notifier.dart
│   ├── home/
│   │   ├── home_screen.dart
│   │   └── home_notifier.dart
│   └── postview/
│       ├── post_screen.dart
│       └── post_notifier.dart
└── widgets/
    ├── layout_widgets_screen.dart
    ├── button_input_widgets_screen.dart
    ├── info_widgets_screen.dart
    ├── material_widgets_screen.dart
    └── async_widgets_screen.dart
```

## Widget Categories

1. **Layout Widgets**
   - Container, Row, Column, Stack, Wrap
   - Alignment, Padding, and positioning techniques

2. **Buttons & Inputs**
   - ElevatedButton, TextButton, IconButton
   - TextFields with validation and custom styling

3. **Information Display**
   - Cards, Badges, Chips
   - Progress indicators and lists

4. **Material Components**
   - Dialogs, Bottom sheets, SnackBars
   - Expansion tiles and list tiles

5. **Async & Network Widgets**
   - FutureBuilder and StreamBuilder
   - API integration with loading states

## Architecture

This project follows a clean MVVM architecture pattern:
- **UI Layer**: Flutter widgets with Riverpod for state management
- **Repository Layer**: Abstracts data sources
- **Data Layer**: API service implementation with Dio
- **Dependency Injection**: Riverpod providers for service locator pattern

## API Integration

The app integrates with [JSONPlaceholder](https://jsonplaceholder.typicode.com/) to demonstrate:
- REST API calls using Dio
- Error handling and loading states
- Data modeling and serialization

## Theming

Custom theme implementation with:
- Google Fonts (Poppins)
- Consistent color palette
- Centralized component styling

## Getting Started

### Prerequisites

1. Flutter and Dart SDK (Latest recommended)
2. VS Code recommended (or any code editor/IDE of your choice)
3. Android Studio Virtual Device Manager for running it on Android virtual machine (optional)

### Steps
1. Clone the repository
```bash
 git clone https://github.com/atshayk/Flutter-Widget-Cookbook.git
```
2. Run `flutter pub get`
3. Run `flutter pub run build_runner build` (if using code generation)
4. Start the application with `flutter run`

Note: This app works on Windows, macOS, Linux, iOS and Android.

## Screens

- **Login Screen**: Authentication simulation with form validation
- **Home Screen**: Dashboard with navigation to widget categories
- **Widget Screens**: Dedicated screens for each widget category
- **Post Screen**: Live API data display

## Dependencies

- `flutter_riverpod`: State management
- `dio`: HTTP client
- `google_fonts`: Custom font integration

---
*Developed by @atshayk*
