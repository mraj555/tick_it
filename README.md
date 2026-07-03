# TickIt

Tick It is a Flutter sample app that demonstrates a feature-first architecture, a reusable design system, and clean separation between UI, state logic, and domain behavior.

## Tech stack

- Flutter SDK 3.12+ with Dart 3
- Material 3 design system
- State management: `flutter_riverpod`
- Code generation: `riverpod_annotation`, `freezed_annotation`, `freezed`, `riverpod_generator`, `build_runner`
- Linting: `flutter_lints`, `riverpod_lint`
- Cross-platform targets: Android, iOS, Linux, macOS, Windows, Web
- Icons: `cupertino_icons`

## Architecture

The app uses a feature-first, layered architecture:

- `lib/main.dart`: app bootstrap and provider root
- `lib/app/`: app shell, theme binding, and overall app configuration
- `lib/core/`: shared design tokens and reusable resources
- `lib/features/<feature>/`: isolated feature modules

Each feature is split into layers:

- `presentation/`: widgets, screens, dialogs, and UI composition
- `application/`: state controllers, providers, and behavior orchestration
- `domain/`: immutable entities and business models
- `data/`: persistence, repositories, and external data access (future-ready)

This structure keeps UI code independent from business logic and makes features easier to extend, test, and maintain.

## Logical flow

1. `lib/main.dart` launches the app with `ProviderScope`.
2. `lib/app/app.dart` builds `MaterialApp` and applies dark theme.
3. `lib/core/theme/` defines the shared color system and theme data.
4. `lib/features/todo/presentation/` renders the todo screen and widgets.
5. `lib/features/todo/application/` owns todo state and controller logic.
6. `lib/features/todo/domain/` defines the immutable `Todo` model.

## Visual architecture map

```text
lib/
  main.dart
  app/
    app.dart
  core/
    theme/
      app_colors.dart
      app_theme.dart
  features/
    todo/
      application/
        controller/
          todos_controller.dart
          todos_controller.g.dart
        state/
          todos_state.dart
          todos_state.freezed.dart
      domain/
        todo.dart
        todo.freezed.dart
      presentation/
        screens/
          todo_screen.dart
        widgets/
          overview_card.dart
          todo_add_dialog.dart
          todo_tile.dart
      data/
        (future persistence/repository code)
```

## Directory responsibilities

### `lib/main.dart`

- App entry point.
- Wraps `MyApp` with `ProviderScope` for Riverpod.
- Keeps bootstrap code minimal.

### `lib/app/app.dart`

- Defines the top-level `MaterialApp` shell.
- Applies `AppTheme.themeData` and `ThemeMode.dark`.
- Sets `TodoScreen` as the home screen.

### `lib/core/theme/app_theme.dart`

- Centralizes theme configuration.
- Configures Material 3, scaffold background, card style, button style, and input decoration.

### `lib/core/theme/app_colors.dart`

- Defines shared color tokens used throughout the app.
- Provides a single source of truth for brand, surface, text, and accent colors.

### `lib/features/todo/presentation/screens/todo_screen.dart`

- Main feature screen.
- Composes the overview card, todo list, and floating add button.
- Opens `TodoAddDialog` when the user taps the FAB.

### `lib/features/todo/presentation/widgets/overview_card.dart`

- Renders the progress summary card.
- Uses theme typography and color values.

### `lib/features/todo/presentation/widgets/todo_tile.dart`

- Renders a single todo row with checkbox, title, edit, and delete icons.
- Currently displays placeholder text and static controls.

### `lib/features/todo/presentation/widgets/todo_add_dialog.dart`

- Shows a dialog for adding a new todo.
- Validates that the title is not empty before dismissing.
- UI is ready for binding to live state.

### `lib/features/todo/domain/todo.dart`

- Defines the `Todo` entity.
- Uses `freezed` for immutability and equality.

### `lib/features/todo/application/state/todos_state.dart`

- Defines the todo state model.
- Stores a list of `Todo` objects, a loading flag, and an optional error message.
- Includes an `initial()` factory for default state.

### `lib/features/todo/application/controller/todos_controller.dart`

- Implements a Riverpod `Notifier` for todo state changes.
- Provides `onAddTodo` and helper methods for update/delete/toggle behavior.
- Updates state immutably through `TodosState.copyWith()`.

### Generated files

- `todos_controller.g.dart` and `*.freezed.dart` are generated code.
- Do not edit generated files directly.

## Feature connection graph

- `main.dart` → `app.dart` → `TodoScreen`
- `app.dart` → `AppTheme` → `AppColors`
- `TodoScreen` → `OverviewCard`, `TodoTile`, `TodoAddDialog`
- `TodosController` → `TodosState` → `Todo`
- `TodoAddDialog` and `TodoTile` are currently presentation-only; they are ready to connect to the controller.

## Current implementation status

- App shell, theme, and todo screen structure are implemented.
- `TodoScreen` renders a static list of 10 placeholder `TodoTile` widgets.
- `TodoAddDialog` validates the title but does not yet add a todo to the list.
- `TodosController` contains state mutation logic, but the screen does not consume it yet.
- `lib/features/todo/data/` is present for future persistence or repository integration.

## Developer guidance

- Add a new feature under `lib/features/<feature>/` and preserve the same layer separation.
- Keep shared design tokens inside `lib/core/`.
- Use `application/` for state orchestration and side effects.
- Use `domain/` for immutable business models only.
- Implement persistence and external data access in `data/` to keep features modular.
- Keep `presentation/` simple and composable, avoiding direct business rules.

## Recommended next tasks

- Wire `TodoScreen` to `TodosController` using the generated provider.
- Replace hard-coded list rendering with live state from `TodosState`.
- Implement `TodoAddDialog` to dispatch `onAddTodo` and close the dialog.
- Add `onToggleTodo`, `onDeleteTodo`, and `onUpdateTodo` flows to UI widgets.
- Add persistence in `lib/features/todo/data/` for storage or repository integration.
