# Sunrise Cafe

Sunrise Cafe is a Flutter application showcasing a simple cafe menu and ordering system. This project demonstrates the use of Flutter for building a cross-platform mobile application with a focus on UI design and state management.

## Table of Contents

1. [Features](#features)
2. [Getting Started](#getting-started)
3. [Project Structure](#project-structure)
4. [Dependencies](#dependencies)
5. [Configuration](#configuration)
6. [Building and Running](#building-and-running)
7. [Testing](#testing)
8. [Contributing](#contributing)
9. [License](#license)

## Features

- Display a list of food items with images, names, and prices
- Responsive design for various screen sizes
- State management using Riverpod
- Local data persistence using SharedPreferences
- Cross-platform support (iOS, Android, Web)

## Getting Started

To get started with the Sunrise Cafe project, follow these steps:

1. Ensure you have Flutter installed on your machine. If not, follow the [official Flutter installation guide](https://flutter.dev/docs/get-started/install).
2. Clone this repository:
   ```
   git clone https://github.com/yourusername/sunrise_cafe.git
   ```
3. Navigate to the project directory:
   ```
   cd sunrise_cafe
   ```
4. Install dependencies:
   ```
   flutter pub get
   ```
5. Run the app:
   ```
   flutter run
   ```

## Project Structure

The project follows a standard Flutter application structure:

- `lib/`: Contains the main Dart code for the application
- `assets/`: Stores static assets like images and JSON files
- `test/`: Contains unit and widget tests
- `android/`, `ios/`, `web/`, `linux/`, `macos/`, `windows/`: Platform-specific code and configurations

Key files:

- `lib/main.dart`: The entry point of the application, setting up the ProviderScope and defining the main app structure.

## Dependencies

The project uses several external packages to enhance functionality. See `pubspec.yaml` for the full list.

## Configuration

### Android

The minimum SDK version and target SDK version are configured in the `android/app/build.gradle` file.

### iOS

iOS-specific configurations can be found in the `ios/Runner/Info.plist` file.

## Building and Running

To build and run the application for different platforms:

- iOS: `flutter run -d ios`
- Android: `flutter run -d android`
- Web: `flutter run -d chrome`

For production builds:

- iOS: `flutter build ios`
- Android: `flutter build apk` or `flutter build appbundle`
- Web: `flutter build web`

## Testing

To run the tests for the application:

```
flutter test
```

For more detailed testing information, including widget tests and integration tests, refer to the `test/` directory in the project.

## Contributing

Contributions to the Sunrise Cafe project are welcome. Please follow these steps:

1. Fork the repository
2. Create a new branch: `git checkout -b feature-branch-name`
3. Make your changes and commit them: `git commit -m 'Add some feature'`
4. Push to the branch: `git push origin feature-branch-name`
5. Submit a pull request

Please ensure your code adheres to the project's coding standards and includes appropriate tests.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.
