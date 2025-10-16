lib/
│
├── main.dart                 # App entrypoint / bootstrap
├── service_locator.dart      # Dependency Injection setup (GetIt)
├── src/
│   ├── config/               # Routing, theming and shared config (router, routes, theme, DataState)
│   │
│   ├── data/                 # Data layer: sources + repository implementations
│   │   ├── data-source/
│   │   │   ├── local/        # Local storage (SharedPrefs, cart & favorites persistence)
│   │   │   └── remote/       # Retrofit/Dio API services (generated *.g.dart files included)
│   │   └── repositories/     # Concrete repositories (Auth, Product)
│   │
│   ├── domain/               # Business logic layer
│   │   ├── models/
│   │   │   ├── entities/     # Core domain entities (pure Dart)
│   │   │   ├── request/      # Request DTOs
│   │   │   └── response/     # Response DTOs
│   │   ├── repositories/     # Abstract repository contracts
│   │   └── usecases/         # Application use-cases (e.g., SignInUser, GetProducts)
│   │
│   ├── presentation/         # UI layer
│   │   ├── blocs/            # BLoC state management (auth, product, cart, favorite)
│   │   ├── pages/            # Screens (home, login, product detail, welcome)
│   │   │   └── components/   # Page-specific widgets (cards, bodies, etc.)
│   │   └── widgets/          # Reusable UI components
│   │
│   └── utils/                # Constants, endpoints, styles, helpers, extensions
│
└──                          
