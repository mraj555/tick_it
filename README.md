# tick_it

Tick It is a small Flutter sample app that demonstrates a feature-first architecture, reusable theme tokens, and a clean separation between app bootstrap, shared resources, and feature implementation.

## Tech stack

- Flutter SDK 3.12+ with Dart 3
- Material 3 design system
- State management: `flutter_riverpod`
- Code generation support: `riverpod_annotation`, `freezed_annotation`, `freezed`, `riverpod_generator`, `build_runner`
- Linting: `flutter_lints`, `riverpod_lint`
- Cross-platform support: Android, iOS, Linux, macOS, Windows, Web
- Icons: `cupertino_icons`

## Architecture

This project uses a layered, feature-oriented architecture.

Top-level layout:

- `lib/main.dart` — app entry point and Riverpod root scope
- `lib/app/` — app root widget and global configuration
- `lib/core/` — shared design tokens and app-wide resources
- `lib/features/<feature>/` — feature-specific implementation modules

Feature modules are organized by responsibility:

- `presentation/` — UI widgets, screens, dialogs, and presentation logic
- `application/` — feature state, providers, controllers, use cases, and orchestration
- `domain/` — entities, models, and business rules
- `data/` — repositories, data sources, and persistence adapters

This structure helps developers add new features without mixing presentation code with domain or data concerns.

## App startup flow

1. `lib/main.dart`
   - Calls `runApp()` and creates `ProviderScope` for Riverpod.
   - Ensures providers are available throughout the widget tree.

2. `lib/app/app.dart`
   - Defines `MyApp`, the root `MaterialApp` widget.
   - Configures dark theme mode and disables the debug banner.
   - Sets `TodoScreen` as the home screen.

3. `lib/core/theme/app_theme.dart`
   - Provides `AppTheme.themeData` for the application.
   - Configures Material 3 theme settings, color scheme, input decoration, cards, and buttons.

4. `lib/core/theme/app_colors.dart`
   - Defines shared color constants such as `cod_gray`, `outrageous_orange`, and `emerald`.
   - Used by app theme and widgets to keep the palette consistent.

5. `lib/features/todo/presentation/screens/todo_screen.dart`
   - Builds the main feature screen with an overview card and todo list.
   - Opens `TodoAddDialog` when the floating action button is pressed.

6. `lib/features/todo/presentation/widgets/overview_card.dart`
   - Displays progress information and completion status.
   - Uses theme values from the current `BuildContext`.

7. `lib/features/todo/presentation/widgets/todo_tile.dart`
   - Shows a todo item row with a checkbox, label, and action icons.
   - Uses themed text and card styling.

8. `lib/features/todo/presentation/widgets/todo_add_dialog.dart`
   - Presents a dialog for entering a new todo title.
   - Validates input and closes the dialog on cancel.

## Project structure

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
        todos_state.dart
        todos_state.freezed.dart
      data/
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
```

## Folder and file responsibilities

### `lib/main.dart`

- App entry point.
- Provides `ProviderScope` for all Riverpod providers.
- Starts the Flutter app with `MyApp`.

### `lib/app/app.dart`

- Root application widget.
- Configures theme and home screen.
- Keeps app-level configuration separate from feature implementation.

### `lib/core/theme/app_theme.dart`

- Central `ThemeData` definition for the app.
- Uses shared `AppColors` values.
- Controls global appearance for cards, buttons, input fields, and backgrounds.

### `lib/core/theme/app_colors.dart`

- Central source of truth for app colors.
- Provides semantic naming to avoid hard-coded colors in widgets.

### `lib/features/todo/presentation/screens/todo_screen.dart`

- Main todo screen layout.
- Combines `OverviewCard`, a list of `TodoTile` widgets, and the add button.

### `lib/features/todo/presentation/widgets/overview_card.dart`

- Progress card displayed at the top of the todo screen.
- Uses theme styling and color scheme values.

### `lib/features/todo/presentation/widgets/todo_tile.dart`

- Single todo row widget.
- Displays a checkbox, task title, and action buttons.

### `lib/features/todo/presentation/widgets/todo_add_dialog.dart`

- Custom dialog for adding a new todo.
- Uses `TextField`, action buttons, and validation.

### `lib/features/todo/domain/todo.dart`

- Domain model for a todo item.
- Defines the shape of todo data used by the feature.

### `lib/features/todo/application/todos_state.dart`

- Candidate state container for todo feature state.
- Demonstrates `freezed` data classes supporting future state management.

## Current implementation notes

- The app uses a dark Material 3 theme across the entire UI.
- `TodoScreen` currently renders a fixed list of placeholder `TodoTile` items.
- `TodoAddDialog` validates inputs but does not yet persist new todos.
- The `application`, `domain`, and `data` folders are scaffolded for the full feature lifecycle.
- `lib/features/todo/data/` is currently empty, making it the natural place for future repository or storage adapters.

## How files connect

- `main.dart` creates the root `ProviderScope` and runs `MyApp`.
- `app.dart` uses `AppTheme.themeData` and sets `TodoScreen` as the home widget.
- `TodoScreen` imports and composes `OverviewCard`, `TodoTile`, and `TodoAddDialog`.
- `OverviewCard`, `TodoTile`, and `TodoAddDialog` derive colors and text styles from the current theme.
- `AppColors` provides shared color constants used by `AppTheme` and can be referenced by feature widgets.

## Developer guidance

- Add new feature modules under `lib/features/<feature>/`.
- Keep reusable design tokens and theme logic in `lib/core/`.
- Place UI-only widgets in `presentation/` and avoid embedding business logic there.
- Add Riverpod providers, state controllers, and orchestration to `application/`.
- Define entities and value objects in `domain/`.
- Add repositories, local storage, or network adapters in `data/`.
- Keep `lib/app/` focused on app-level bootstrapping and routing.
