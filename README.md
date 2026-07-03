# tick_it

Tick It is a Flutter application scaffold built around a feature-first architecture with a minimal todo experience. The repository is organized to keep the app shell, shared design system, and feature code separate so a next developer can understand the code flow and extend the app efficiently.

## Overview

The app boots from `lib/main.dart`, establishes a global Riverpod provider scope, and renders a single todo home screen. The current implementation provides the structural foundation and theme support required for a more complete todo application.

## Tech Stack

- Flutter SDK 3.12+
- Dart
- Material 3 UI system
- State management: Flutter Riverpod (`flutter_riverpod`)
- Code generation support: Riverpod annotations (`riverpod_annotation`), Freezed (`freezed`, `freezed_annotation`), Build Runner (`build_runner`), Riverpod generator (`riverpod_generator`)
- Linting and static analysis: Flutter Lints (`flutter_lints`), Riverpod Lint (`riverpod_lint`)
- Cross-platform targets: Android, iOS, Linux, macOS, Windows, Web

## Architecture

The project follows a layered feature architecture that separates responsibilities:

- `lib/main.dart`: app bootstrap and provider initialization.
- `lib/app/`: root app widget and app-level configuration.
- `lib/core/`: shared resources such as theme and color definitions.
- `lib/features/<feature>/`: feature-specific implementation.

Within a feature, the conventions are:

- `presentation/`: UI screens and widgets.
- `application/`: state management, providers, controllers, and use-case orchestration.
- `domain/`: business entities, value objects, and domain rules.
- `data/`: repositories, data sources, and persistence adapters.

This structure encourages independent evolution of UI, business logic, and data access.

## App Flow and File Connections

1. `lib/main.dart`
   - Entry point for the Flutter app.
   - Creates `ProviderScope` for Riverpod.
   - Instantiates `MyApp` from `lib/app/app.dart`.

2. `lib/app/app.dart`
   - Builds the root `MaterialApp`.
   - Applies the dark theme from `lib/core/theme/app_theme.dart`.
   - Sets the home screen to `TodoScreen`.

3. `lib/core/theme/app_theme.dart`
   - Defines the shared Material 3 theme.
   - Configures color scheme, button theme, card theme, and input decoration.

4. `lib/core/theme/app_colors.dart`
   - Defines the app palette with named color constants.
   - Supports consistent styling across the app.

5. `lib/features/todo/presentation/screens/todo_screen.dart`
   - Current home screen for the todo feature.
   - Renders a `Scaffold` and includes `OverviewCard`.

6. `lib/features/todo/presentation/widgets/overview_card.dart`
   - A reusable UI component for todo progress.
   - Demonstrates how presentation widgets consume theme and styling.

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
```

## Folder Responsibilities

### `lib/main.dart`

- Flutter application entry point.
- Bootstraps global Riverpod provider scope.
- Starts the app by rendering `MyApp`.

### `lib/app/app.dart`

- Defines the root application widget.
- Configures app-wide theme settings.
- Sets the initial home widget.

### `lib/core/theme/`

- Contains shared theme and styling assets.
- Centralizes the color palette and theme data.
- Should host reusable design tokens and appearance settings.

### `lib/features/todo/presentation/`

- Contains UI code for the todo feature.
- Includes screens and reusable widgets.
- Should remain focused on visual composition and interaction.

### `lib/features/todo/application/`

- Intended for state providers, controllers, and orchestration logic.
- Should expose feature state and actions to presentation widgets.

### `lib/features/todo/domain/`

- Intended for todo feature business entities and domain rules.
- Should remain independent of UI and persistence details.

### `lib/features/todo/data/`

- Intended for data access, repositories, and storage adapters.
- Should host persistence, networking, or mock implementations.

## Current Implementation Status

- App bootstrap exists in `lib/main.dart`.
- Root app widget is implemented in `lib/app/app.dart`.
- Shared dark theme and colors are available in `lib/core/theme/`.
- Todo screen and a feature widget are implemented in `lib/features/todo/presentation/`.
- `application/`, `domain/`, and `data/` folders exist as ready extension points.

## Notes for New Developers

- Keep feature-specific code inside `lib/features/<feature>/`.
- Keep app configuration inside `lib/app/` and shared styles in `lib/core/`.
- Avoid placing business logic directly inside UI widgets.
- Use Riverpod providers for state and dependency management.
- The current repository is a scaffold designed for future feature expansion.
