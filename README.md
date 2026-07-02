# tick_it

Tick It is a Flutter application scaffold designed around a feature-first architecture with a focused todo experience. The codebase is intentionally organized so that the app shell, shared infrastructure, and feature-specific logic remain separate and easy to extend.

## Overview

The current implementation is intentionally minimal. The app boots from the Flutter entry point, creates a Riverpod scope, and renders a single todo screen as the initial home experience. The repository already includes the folder structure and dependencies needed for a more complete todo feature to be built on top of this foundation.

## Tech Stack

- Flutter SDK 3.12+
- Dart
- Material 3 UI
- State management: Flutter Riverpod
- Code generation: Riverpod annotations, Riverpod generator, Freezed, Build Runner
- Linting and developer tooling: Flutter Lints, Riverpod Lint
- Cross-platform support: Android, iOS, Linux, macOS, Windows, and Web

## Architecture

The project follows a layered architecture with separate responsibilities:

1. App layer
   - The root application bootstrap lives in lib/main.dart.
   - The global app shell and app-level configuration live in lib/app/app.dart.

2. Core layer
   - Shared concerns such as theming and design tokens live in lib/core/.
   - This layer is meant for reusable app-wide resources that are not tied to a single feature.

3. Feature layer
   - Feature-specific code is grouped under lib/features/<feature-name>/.
   - The current feature is todo, and it is divided into presentation, application, domain, and data layers.

This separation keeps UI, state, business rules, and data concerns independent while remaining easy for a new developer to navigate.

## App Flow and File Connections

The main runtime path is:

1. lib/main.dart
   - Starts the app with runApp.
   - Wraps the application in ProviderScope so Riverpod is available throughout the widget tree.

2. lib/app/app.dart
   - Builds the root MaterialApp.
   - Applies the shared app theme.
   - Sets the initial home screen to TodoScreen.

3. lib/core/theme/app_theme.dart
   - Defines the dark Material 3 theme used by the app.
   - It is consumed by MyApp through the MaterialApp theme configuration.

4. lib/features/todo/presentation/screens/todo_screen.dart
   - Represents the current screen displayed to the user.
   - This is the UI entry point for the todo feature and is currently a simple scaffold with placeholder content.

5. lib/features/todo/presentation/widgets/
   - Intended for reusable UI widgets that belong to the todo feature.

6. lib/features/todo/application/
   - Intended for providers, controllers, and feature-level use cases.

7. lib/features/todo/domain/
   - Intended for business entities, rules, and feature contracts.

8. lib/features/todo/data/
   - Intended for repositories, data sources, and persistence adapters.

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
```

## Folder Responsibilities

### lib/main.dart

- Flutter application entry point.
- Responsible for bootstrapping the app and installing the Riverpod provider scope.

### lib/app/app.dart

- Root app widget.
- Central place for app-level UI configuration such as theme selection and the initial screen.

### lib/core/theme/

- Shared styling and theme configuration.
- Contains the app color palette and the Material theme definition.

### lib/features/todo/presentation/

- Contains screen and widget implementations for the todo experience.
- This layer should stay focused on UI composition and user interaction.

### lib/features/todo/application/

- Contains state management and feature orchestration logic.
- This is where providers, controllers, and use-case logic should live.

### lib/features/todo/domain/

- Contains the business model and domain rules for the todo feature.
- This layer should be independent from UI and data implementation details.

### lib/features/todo/data/

- Contains repositories and data access code for the todo feature.
- This is where persistence or network integrations should be implemented.

## Current Implementation Status

The repository currently contains the architectural skeleton and the initial todo screen. The present app is a minimal scaffold, and the next step is to populate the application, domain, and data layers with real todo functionality.

## Development Conventions

- Keep feature-specific code inside the corresponding folder under lib/features/.
- Avoid placing business logic directly inside screen widgets.
- Use Riverpod providers for state and dependency flow.
- Keep app-wide configuration in lib/app and shared design concerns in lib/core.
- If code generation is introduced, keep it aligned with the existing Build Runner setup.
