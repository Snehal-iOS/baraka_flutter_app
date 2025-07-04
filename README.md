# Baraka Portfolio App
[![Flutter](https://img.shields.io/badge/Flutter-3.22.1-blue.svg)](https://flutter.dev/)
[![Dart](https://img.shields.io/badge/Dart-3.4.1-blue.svg)](https://dart.dev/)

This is a simplified Portfolio screen implementation developed for a fintech assignment. It simulates real-time price updates for user holdings and demonstrates best practices with Flutter, Bloc, Dependency Injection, Clean Architecture, and Widget Testing.

## Features
1. Fetch and display portfolio data
2. Simulate live price updates every second
3. Real-time UI refresh using Bloc
4. Language toggle support
5. Modular and testable architecture

## Architecture
1. State Management: Bloc from flutter_bloc 
2. Dependency Injection: injectable + get_it 
3. Data Layer: Repository pattern 
4. Testing: Unit & Widget testing using flutter_test

## Flutter SDK Requirements
The project requires specific Flutter SDK versions for the main branch:

- Flutter 3.22.1 • channel stable
- Upstream repository https://github.com/flutter/flutter.git
- Framework revision a14f74ff3a (1 year, 1 month ago), 2024-05-22 11:08:21 -0500
- Engine • revision f6344b75dc
- Tools • Dart 3.4.1 • DevTools 2.34.3

## Directory Structure
```bash
lib/
├── core/
│   └── di/                   # Dependency injection setup
├── features/
│   └── portfolio/
│       ├── data/             # Repository & models
│       ├── presentation/     # Bloc & UI
│       ├── models/           # Model classes
├── l10n/                     # Localization files
test/
├── features/
│   └── portfolio/
│       └── presentation/     # Widget and unit tests
```

## Testing
The PortfolioScreen is widget tested to validate:
1. Proper UI rendering from PortfolioLoaded state 
2. Presence of John Doe, AAPL, and Net Value fields
3. Run the following command :
4. ```bash
   flutter test test/features/portfolio/presentation/pages/portfolio_screen_test.dart

## Getting Started
1. Clone the repository
   ```bash
   git clone https://github.com/Snehal-iOS/baraka_flutter_app.git
2. Install dependencies
   ```bash
   flutter pub get
3. Generate injectable config
   ```bash
   flutter pub run build_runner build --delete-conflicting-outputs
4. Run the app
   ```bash
   flutter run
5. Run tests
   ```bash
   flutter test
   
## Live Price Simulation:
Every second, the app simulates price changes using a timer in PortfolioBloc, recalculating:
Last traded price, Market value & PnL & PnL %
The UI updates via emitting PortfolioLoaded state again.

## Dependency Injection
injectable_module.dart and injector.dart handle DI. 
Repositories are injected using annotations like @LazySingleton.

## Demo

![App Demo iOS](assets/iOS_demo.mov)
![App Demo Android](assets/android_demo.mov)


## Screenshots iOS

| English            | Arabic             |
|--------------------|--------------------|
| ![](assets/11.png) | ![](assets/22.png) |

## Screenshots Android

| English           | Arabic            |
|-------------------|-------------------|
| ![](assets/1.png) | ![](assets/2.png) |


   
## Author
Snehal Lokhande
Mobile Developer | Fintech Enthusiast
Dubai, UAE
isnehal28@gmail.com

---

### License

This project is intended for technical evaluation purposes only. Not for production use.
