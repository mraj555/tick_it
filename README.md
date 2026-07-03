# tick_it

Tick It is a Flutter scaffold that demonstrates a feature-first app structure with a reusable theme system and a single todo feature. The repository is organized to separate app bootstrap, shared styling, and feature implementation so next developers can find code responsibilities quickly.

## Tech Stack

- Flutter SDK 3.12+
- Dart 3
- Material 3 UI
- State management: `flutter_riverpod`
- Code generation: `riverpod_annotation`, `freezed_annotation`, `freezed`, `riverpod_generator`, `build_runner`
- Linting: `flutter_lints`, `riverpod_lint`
- Cross-platform targets: Android, iOS, Linux, macOS, Windows, Web
- Icons: `cupertino_icons`

## Architecture

The project uses a layered feature architecture:

- `lib/main.dart`: boots the app and provides the global Riverpod scope.
- `lib/app/`: root application widget and app-level configuration.
- `lib/core/`: shared theme and design tokens.
- `lib/features/<feature>/`: feature-specific implementation.

Feature folder conventions:

- `presentation/`: UI screens, widgets, and composition.
- `application/`: state providers, controllers, and feature orchestration.
- `domain/`: business entities and domain logic.
- `data/`: repositories, data sources, and storage adapters.

This structure keeps UI separate from business logic and data, making the app easier to extend and maintain.

## App Startup Flow

1. `lib/main.dart`
   - Entry point for the application.
   - Wraps the app in `ProviderScope`.
   - Calls `runApp(MyApp())`.

2. `lib/app/app.dart`
   - Defines `MyApp`.
   - Configures `MaterialApp` with dark theme and disables the debug banner.
   - Uses `TodoScreen` as the home screen.

3. `lib/core/theme/app_theme.dart`
   - Creates the shared `ThemeData`.
   - Sets color scheme, card theme, input decoration theme, and button styles.

4. `lib/core/theme/app_colors.dart`
   - Defines shared color constants used by the theme and widgets.

5. `lib/features/todo/presentation/screens/todo_screen.dart`
   - Builds the app’s main todo screen.
   - Includes `OverviewCard` and a vertical list of `TodoTile` widgets.

6. `lib/features/todo/presentation/widgets/overview_card.dart`
   - Reusable card that displays todo progress and a primary action badge.

7. `lib/features/todo/presentation/widgets/todo_tile.dart`
   - Reusable row item for a todo task with checkbox, label, and action icons.

## Project Structure

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
      data/
      domain/
      presentation/
        screens/
          todo_screen.dart
        widgets/
          overview_card.dart
          todo_tile.dart
```

## Folder Responsibilities

### `lib/main.dart`

- App entry point.
- Provides global Riverpod scope.
- Starts the widget tree with `MyApp`.

### `lib/app/app.dart`

- Root Flutter widget.
- Configures app-wide theme and home route.
- Central location for app-level configuration.

### `lib/core/theme/app_theme.dart`

- Central theme definition for the app.
- Defines Material 3 appearance, input fields, cards, and buttons.

### `lib/core/theme/app_colors.dart`

- Shared color palette.
- Central source for app color tokens.

### `lib/features/todo/presentation/`

- Contains UI code for the todo feature.
- Screens and reusable presentation widgets are here.

### `lib/features/todo/application/`

- Intended for state providers and feature logic.
- Best location for Riverpod providers, controllers, and actions.

### `lib/features/todo/domain/`

- Intended for business entities and domain rules.
- Keeps domain knowledge independent of UI and persistence.

### `lib/features/todo/data/`

- Intended for repositories and data sources.
- Best place for persistence or remote data adapters.

## Current Implementation Status

- `lib/main.dart` bootstraps the app.
- `lib/app/app.dart` houses the root `MaterialApp`.
- Shared theming lives in `lib/core/theme/`.
- The todo feature UI lives in `lib/features/todo/presentation/`.
- `application/`, `domain/`, and `data/` are scaffolded for future feature completion.

## Notes for New Developers

- Keep feature UI inside `lib/features/<feature>/presentation/`.
- Keep shared app resources in `lib/core/`.
- Keep app startup and route configuration in `lib/main.dart` and `lib/app/app.dart`.
- Prefer Riverpod providers for state and dependency management.
- Follow the feature folder conventions when adding new functionality.
