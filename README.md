# hand_held_device

Made in [Flutter](https://flutter.dev/)

As of now only working on Android.

### This Flutter App is based on the MVC architecture:

```
lib/
├── models/
│   └── hive_models/  # Hive model classes
├── views/
├── controllers/
├── repositories/
│   ├── local/
│   │   └── hive/    # Hive database operations
│   └── remote/
├── services/
├── widgets/
└── utils/
```

- **models/**: Contains the data classes that represent the business logic.
  - **hive_models/**: Specific subfolder for Hive model classes.
- **views/**: Holds the UI code, which can be further organized into subfolders for different screens or components.
- **controllers/**: Includes the controllers that connect the models and views, handling the flow of data and business logic.
- **repositories/**: Manages the data layer, with subfolders for local and remote data sources.
  - **local/**: For local persistence, including a subfolder for Hive operations.
  - **remote/**: For remote server calls (e.g., REST API calls).
- **services/**: Provides services like API integration, authentication, etc.
- **widgets/**: Contains reusable UI components.
- **utils/**: Includes utility/helper functions and constants.

This structure helps maintain a clean separation of concerns and makes it easier to manage the data flow within your Flutter application. It's also scalable, allowing for the addition of more components as your application grows. Remember to adjust the structure as needed for your specific project requirements and team preferences.

- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Run and Build an app using CLI

- Run an android apk:

1. Use the Run and Debug function in VS Code (Ctrl+Shift+D) and choose a dev flavor
2. Go to root project dir and open up the command line and type

```Dart
flutter run --flavor prod -t lib/main_prod.dart

flutter run -d chrome --flavor dev -t lib/main_dev.dart
```

- Build an android apk:
  Use the following CLI command

  ```Dart
  flutter build apk --flavor prod -t lib/main_prod.dart

 flutter build apk --flavor prod -t lib/main_prod.dart --analyze-size --target-platform  android-arm

  flutter build web -t lib/main_dev.dart
  ```

- For other type of apps:
  `flutter build [platform] --flavor prod -t lib/main_prod.dart`
  For more details, use the flutter's official documentation [here](https://docs.flutter.dev/deployment/ios#create-a-build-archive-and-upload-to-app-store-connect)


