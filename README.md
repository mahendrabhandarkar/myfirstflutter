# Run Flutter Code Offline 
https://unpkg.com/browse/canvaskit-wasm@0.35.0/bin/ '-- Download canvaskit files from here
flutter run -d chrome --web-renderer=canvaskit --dart-define=FLUTTER_WEB_CANVASKIT_URL=http://localhost/custom-canvaskit-build/ '-- Files pasted in external URL custom-canvaskit-build folder
flutter run -d chrome --web-renderer=canvaskit --dart-define=FLUTTER_WEB_CANVASKIT_URL=/ --profile --dart-define=FLUTTER_WEB_DEBUG_SHOW_SEMANTICS=true '-- When files pasted inside web folder
flutter run -d chrome --web-renderer=html '-- To run in HTML format we don't need canvaskit files

# myfirstflutter
Trying to create matri.

## Getting Started

Trying my hands in flutter.

## command to create web / apk build
flutter build apk --split-per-abi --obfuscate --split-debug-info=/build
flutter build web --web-renderer html --release --base-href /webportal/

## coding
https://github.com/rostomides/T2T - Clone of a marriage matching website
https://github.com/razarehan/tamil_matrimony_clone/tree/master/src/app
https://www.youtube.com/watch?v=ELFORM9fmss -- Flutter Clean Code Architecture Full Course for Beginners <br />
https://github.com/imshibaji/flutter_clean_architecture - https://www.youtube.com/watch?v=hHOf98bZ2p4 <br />

https://github.com/18BCS4527/Matrimony-Application-/tree/master --- Matrimonial Application Code <br />

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

