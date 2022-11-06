# Run Flutter Code Offline 
https://unpkg.com/browse/canvaskit-wasm@0.35.0/bin/ '-- Download canvaskit files from here
flutter run -d chrome --web-renderer=canvaskit --dart-define=FLUTTER_WEB_CANVASKIT_URL=http://localhost/custom-canvaskit-build/ 
flutter run -d chrome --web-renderer=canvaskit --dart-define=FLUTTER_WEB_CANVASKIT_URL=/ --profile --dart-define=FLUTTER_WEB_DEBUG_SHOW_SEMANTICS=true 
flutter run -d chrome --web-renderer=html '-- To run in HTML format we don't need canvaskit files

# myfirstflutter
Trying to create matri.

## Getting Started

Trying my hands in flutter.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

