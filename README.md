# Flutter Clean Architecture Boilerplate

This project demonstrates a Clean Architecture implementation in Flutter using the BLoC pattern for state management. The project structure follows the principles of Clean Architecture, making it scalable, maintainable, and testable.

## Project Structure

```
lib/
├── core/                           # Core functionality and utilities
│   ├── error/                      # Error handling
│   ├── network/                    # Network related code
│   └── usecases/                   # Base use case class
│
├── features/                       # Feature modules
│   └── counter/                    # Counter feature
│       ├── data/                   # Data layer
│       │   ├── datasources/        # Data sources (local/remote)
│       │   ├── models/             # Data models
│       │   └── repositories/       # Repository implementations
│       │
│       ├── domain/                 # Domain layer
│       │   ├── entities/           # Business objects
│       │   ├── repositories/       # Repository interfaces
│       │   └── usecases/          # Use cases
│       │
│       └── presentation/          # Presentation layer
│           ├── bloc/              # BLoC pattern implementation
│           ├── pages/             # UI pages
│           └── widgets/           # Reusable widgets
│
└── main.dart                      # Application entry point
```

## Clean Architecture Layers

### 1. Domain Layer (Innermost)
The domain layer contains the business logic and is independent of any other layer.

- **Entities**: Core business objects (e.g., `Counter`)
- **Repository Interfaces**: Contracts for data operations
- **Use Cases**: Business logic implementation

Example:
```dart
// Domain Layer - Entities
class Counter extends Equatable {
  final int value;
  const Counter({required this.value});
}

// Domain Layer - Repository Interface
abstract class CounterRepository {
  Future<Either<Failure, Counter>> getCounter();
  Future<Either<Failure, Counter>> incrementCounter(int currentValue);
}
```

### 2. Data Layer (Middle)
The data layer implements the domain layer interfaces and handles data operations.

- **Models**: Data structure implementations
- **Data Sources**: Actual data operations (local/remote)
- **Repository Implementations**: Coordination of data operations

Example:
```dart
// Data Layer - Models
class CounterModel extends Counter {
  const CounterModel({required int value}) : super(value: value);
  factory CounterModel.fromJson(Map<String, dynamic> json) => ...
}

// Data Layer - Repository Implementation
class CounterRepositoryImpl implements CounterRepository {
  final CounterLocalDataSource localDataSource;
  // Implementation of repository methods
}
```

### 3. Presentation Layer (Outermost)
The presentation layer handles the UI and user interactions.

- **Events**: User actions
- **States**: UI states
- **BLoC**: Business logic for UI
- **UI**: User interface components

Example:
```dart
// Presentation Layer - BLoC
class CounterBloc extends Bloc<CounterEvent, CounterState> {
  final GetCounter getCounter;
  // Event handling and state management
}

// Presentation Layer - UI
class CounterPage extends StatelessWidget {
  // UI implementation using BLoC
}
```

## Key Features

1. **Separation of Concerns**: Each layer has a specific responsibility
2. **Dependency Rule**: Dependencies point inward
3. **Testability**: Each layer can be tested independently
4. **Maintainability**: Clear structure makes the code easy to maintain
5. **Scalability**: Easy to add new features following the same pattern

## Getting Started

1. Clone the repository
2. Install dependencies:
   ```bash
   flutter pub get
   ```
3. Run the app:
   ```bash
   flutter run
   ```

## Dependencies

- **flutter_bloc**: State management
- **dartz**: Functional programming
- **equatable**: Value equality
- **get_it**: Dependency injection
- **shared_preferences**: Local storage

## Adding New Features

To add a new feature:

1. Create a new directory under `features/`
2. Follow the layer structure:
   - `domain/`: Business logic
   - `data/`: Data handling
   - `presentation/`: UI and state management
3. Implement each layer following the existing patterns

## Best Practices

1. Keep the domain layer pure and independent
2. Use dependency injection for better testability
3. Handle errors appropriately at each layer
4. Follow the single responsibility principle
5. Write tests for each layer

## Contributing

Feel free to contribute to this boilerplate by:
1. Forking the repository
2. Creating a feature branch
3. Submitting a pull request

## License

This project is licensed under the MIT License - see the LICENSE file for details.
