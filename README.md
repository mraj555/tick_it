# tick_it

tick_it is a Flutter application scaffolded around a feature-first architecture with a single todo experience. The project is structured so that the app shell, shared infrastructure, and feature-specific logic stay separated, making it easier for the next developer to extend the product without mixing responsibilities.

## Overview

The current implementation is intentionally minimal. The app boots from the Flutter entry point, creates a Riverpod scope, and renders a single todo screen as the initial home experience.

## Tech Stack

- Flutter SDK 3.12+
- Dart
- Material Design
- State management: Flutter Riverpod
- Code generation: Riverpod annotations, Riverpod generator, Freezed, Build Runner
- Linting and developer tooling: Flutter Lints, Riverpod Lint

## Architecture

The application follows a layered and feature-oriented structure:

1. App layer
   - The root application bootstrap lives in lib/main.dart.
   - The global app configuration and navigation shell live in lib/app/app.dart.

2. Feature layer
   - Feature-specific code is grouped under lib/features/<feature-name>/.
   - The current feature is todo, which is split into presentation, application, domain, and data folders.

3. Core layer
   - Shared concerns such as theming live under lib/core/.
   - This layer should hold reusable utilities, constants, and shared UI configuration that are not specific to one feature.

This structure keeps the UI, business logic, and data concerns separate, while still being easy to navigate for a new contributor.

## How the Current App Flow Connects

The main connection path is:

- lib/main.dart initializes the app with ProviderScope.
- lib/app/app.dart creates the MaterialApp and sets the home screen.
- lib/features/todo/presentation/screens/todo_screen.dart renders the current screen.

At the moment, the app is a scaffold with a placeholder todo screen that displays the text "No Todos yet."

## Project Structure

```text
lib/
  main.dart                  # Flutter entry point and app bootstrap
  app/
    app.dart                 # Root app widget, theme setup, and home screen wiring
  core/
    theme/                   # Shared theme resources and styling concerns
  features/
    todo/
      presentation/
        screens/
          todo_screen.dart   # Current todo screen
        widgets/            # Reusable UI widgets for the todo experience
      application/          # Providers, controllers, or use cases
      domain/               # Domain models and business rules
      data/                 # Repositories and data sources
```

### Key Files and Their Purpose

- lib/main.dart
  - The application entry point.
  - Responsible for launching the app inside a Riverpod provider scope.

- lib/app/app.dart
  - Defines the root MaterialApp.
  - Central place for app-level configuration such as theme mode and the initial home widget.

- lib/features/todo/presentation/screens/todo_screen.dart
  - The currently visible screen in the app.
  - This is the place where UI composition happens for the todo experience.

- lib/features/todo/presentation/widgets/
  - Intended for reusable widgets that belong to the todo feature.

- lib/features/todo/application/
  - Intended for state management, providers, and use-case orchestration.

- lib/features/todo/domain/
  - Intended for business entities, value objects, and domain contracts.

- lib/features/todo/data/
  - Intended for repository implementations, API clients, local storage adapters, and data mapping.

- lib/core/theme/
  - Intended for shared theming values, colors, typography, and theme configuration.

## Development Notes

- Keep feature-specific UI and state inside the appropriate feature folder.
- Avoid placing business logic directly inside screens.
- Use Riverpod providers for state and dependency injection.
- If new generated code is introduced, keep it aligned with the existing Build Runner and code-generation setup.
- Keep the app shell in lib/app focused on app-wide configuration rather than feature implementation.

## Current Status

The repository currently contains the architecture and folder structure needed for growth, but the todo feature is still in its initial scaffold stage. The next step is to populate the application, domain, and data layers with real todo functionality.
