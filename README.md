# Baraka Portfolio App

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
4.    ```bash
    flutter test test/features/portfolio/presentation/pages/portfolio_screen_test.dart


## Getting Started
1. Clone the repository
   ```bash
   git clone
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

   
   
## Author
Snehal Lokhande