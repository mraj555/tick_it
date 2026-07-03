# tick_it

Tick It is a Flutter sample app built with a feature-first architecture, reusable theme tokens, and a single todo feature. It is designed so new developers can quickly understand app bootstrap, shared resources, and where to place future feature work.

## Tech stack

- Flutter SDK 3.12+ with Dart 3
- Material 3 design system
- State management: `flutter_riverpod`
- Code generation support: `riverpod_annotation`, `freezed_annotation`, `freezed`, `riverpod_generator`, `build_runner`
- Linting: `flutter_lints`, `riverpod_lint`
- Cross-platform targets: Android, iOS, Linux, macOS, Windows, Web
- Icons: `cupertino_icons`

## Architecture overview

The project uses a feature-based layered architecture with clear separation between app entry, shared resources, and feature implementations.

Top-level structure:

- `lib/main.dart` — app entry point and global Riverpod bootstrap
- `lib/app/` — root app widget and application configuration
- `lib/core/` — shared theme, color tokens, and app-wide resources
- `lib/features/<feature>/` — feature-specific implementation

Feature module conventions:

- `presentation/` — UI screens, widgets, and presentation logic
- `application/` — state providers, controllers, use cases, and orchestration
- `domain/` — business entities, models, and domain rules
- `data/` — repositories, data sources, adapters, and persistence

This structure keeps presentation code separate from business logic and persistence, which helps maintainability and scalability.

## App startup flow

1. `lib/main.dart`
   - Application entry point.
   - Wraps `MyApp` in `ProviderScope` so Riverpod providers can be used anywhere.
   - Calls `runApp()`.

2. `lib/app/app.dart`
   - Root application widget (`MyApp`).
   - Builds `MaterialApp` with dark theme and disables the debug banner.
   - Sets `TodoScreen` as the home screen.

3. `lib/core/theme/app_theme.dart`
   - Defines shared `ThemeData` for the app.
   - Customizes color scheme, card theme, button styles, and input decoration.

4. `lib/core/theme/app_colors.dart`
   - Defines all app color constants.
   - Provides shared semantic colors for consistent theming.

5. `lib/features/todo/presentation/screens/todo_screen.dart`
   - Constructs the main todo screen layout.
   - Uses `OverviewCard`, a list of `TodoTile` widgets, and a floating action button.

6. `lib/features/todo/presentation/widgets/overview_card.dart`
   - Displays todo progress information.
   - Uses theme colors and typography from `Theme.of(context)`.

7. `lib/features/todo/presentation/widgets/todo_tile.dart`
   - Displays a task row with checkbox, title, and action icons.
   - Uses card styling and theme typography.

8. `lib/features/todo/presentation/widgets/todo_add_dialog.dart`
   - Dialog for adding a new todo title.
   - Contains input validation and action buttons.

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
      data/
      domain/
      presentation/
        screens/
          todo_screen.dart
        widgets/
          overview_card.dart
          todo_add_dialog.dart
          todo_tile.dart
```

## Key file responsibilities

### `lib/main.dart`

- Application entry point.
- Provides `ProviderScope` for Riverpod.
- Starts the widget tree with `MyApp`.

### `lib/app/app.dart`

- Root Flutter widget.
- Configures `MaterialApp` and theme selection.
- Sets home route to `TodoScreen`.

### `lib/core/theme/app_theme.dart`

- Central theme definition for the app.
- Uses Material 3 and customizes cards, buttons, and input styles.

### `lib/core/theme/app_colors.dart`

- Shared app color palette.
- Defines semantic color constants used across the app.

### `lib/features/todo/presentation/screens/todo_screen.dart`

- Builds the main todo feature screen.
- Composes the overview card, todo list, and add dialog trigger.

### `lib/features/todo/presentation/widgets/overview_card.dart`

- Reusable progress card.
- Displays title, subtitle, and completion badge.

### `lib/features/todo/presentation/widgets/todo_tile.dart`

- Reusable todo list item.
- Shows a checkbox, label, and edit/delete action icons.

### `lib/features/todo/presentation/widgets/todo_add_dialog.dart`

- Dialog UI for adding a new todo.
- Handles text input and validation.

## Current implementation details

- The app boots from `main.dart`, then configures the root app in `app.dart`.
- The shared theme lives in `lib/core/theme/`.
- The todo feature UI is implemented in `lib/features/todo/presentation/`.
- The todo list is currently rendered with static placeholder items.
- `application/`, `domain/`, and `data/` are scaffold folders for future state and persistence layers.

## How files connect

- `main.dart` → `app.dart` → `TodoScreen`
- `app.dart` applies `AppTheme.themeData` from `lib/core/theme/app_theme.dart`
- `TodoScreen` composes `OverviewCard`, `TodoTile`, and `TodoAddDialog`
- Presentation widgets use theme values from `Theme.of(context)` and share colors from `AppColors`
- Feature folders `application/`, `domain/`, and `data/` are reserved for future Riverpod state, domain models, and data adapters

## Extension guidance

- Add new features under `lib/features/<feature>/` using the same folder conventions.
- Keep shared styling and tokens in `lib/core/`.
- Keep app startup and routing logic in `lib/main.dart` and `lib/app/app.dart`.
- Place UI-only code in `presentation/` and avoid business logic inside widgets.
- Use `application/` for Riverpod providers, state controllers, and feature orchestration.
- Use `domain/` for entities, value objects, and business rules.
- Use `data/` for repositories, storage adapters, and remote integrations.
