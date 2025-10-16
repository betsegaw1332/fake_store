<pre> lib/
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
</pre>

🧩 **Packages Used**

**get_it** – Used for dependency injection, making it easy to manage and access app-wide services and objects without tight coupling.

**retrofit + dio** – Used together for network communication.

**Dio** handles HTTP requests, responses, and interceptors.

**Retrofit** provides a type-safe, declarative API interface on top of Dio for cleaner networking code.

**flutter_bloc** – Used for state management, implementing the BLoC (Business Logic Component) pattern to separate business logic from presentation for better scalability and testability.

**go_router** – Used for navigation and routing, providing a declarative and URL-based approach to handle app navigation with deep linking support.

**shared_preferences** – Used for local data storage, allowing the app to save small pieces of persistent data such as user preferences, tokens, or settings.

**skeletonizer** – Used to display skeleton loading placeholders, enhancing user experience during data loading states.

**google_fonts** – Used to customize typography by easily applying Google Fonts throughout the app for consistent and visually appealing text styles.
