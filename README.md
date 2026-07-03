# TickIt

TickIt is a Flutter todo sample app with a feature-first architecture, a reusable theme system, and clear separation between UI, state logic, and domain models.

## Tech stack

- Flutter SDK 3.12+ with Dart 3
- Material 3 design system
- State management: `flutter_riverpod`
- Code generation: `riverpod_annotation`, `freezed_annotation`, `freezed`, `riverpod_generator`, `build_runner`
- Linting: `flutter_lints`, `riverpod_lint`
- Cross-platform targets: Android, iOS, Linux, macOS, Windows, Web
- Icons: `cupertino_icons`

## Project architecture

The app follows a layered, feature-first architecture that keeps features isolated and minimizes cross-cutting dependencies.

- `lib/main.dart`: application bootstrap and Riverpod root
- `lib/app/`: app shell, theme setup, and top-level navigation
- `lib/core/`: shared design tokens, theme values, and reusable resources
- `lib/features/<feature>/`: self-contained feature modules

Each feature module is organized into:

- `presentation/`: UI widgets, screens, dialogs, and presentation-only composition
- `application/`: state controllers, providers, computed state, and behavior orchestration
- `domain/`: immutable business entities and value models
- `data/`: persistence and repository adapters (future-ready)

This layout keeps UI code independent from business rules, enables easier feature growth, and supports testable state management.

## File structure overview

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
          completed_todos/
            completed_todos_provider.dart
            completed_todos_provider.g.dart
          todos/
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
        (placeholder for persistence and repository code)
```

## Detailed module responsibilities

### `lib/main.dart`

- App entry point.
- Wraps `MyApp` in `ProviderScope` for Riverpod state management.
- Keeps initialization minimal.

### `lib/app/app.dart`

- Builds the top-level `MaterialApp`.
- Applies dark theme via `AppTheme.themeData`.
- Sets `TodoScreen` as the home page.
- Separates app-level configuration from feature code.

### `lib/core/theme/app_colors.dart`

- Defines app-wide color tokens.
- Provides named design tokens for primary, background, surface, success, text, and border colors.
- Centralizes the visual palette.

### `lib/core/theme/app_theme.dart`

- Creates the shared `ThemeData`.
- Configures Material 3, input decoration, button styles, and card styling.
- Uses `AppColors` tokens so UI styling remains consistent.

### `lib/features/todo/domain/todo.dart`

- Defines the `Todo` entity shape.
- Uses `freezed` for immutability and equality semantics.
- Keeps the domain model separate from UI state.

### `lib/features/todo/application/state/todos_state.dart`

- Defines `TodosState`.
- Stores a list of `Todo`, a loading flag, and an optional error message.
- Provides `TodosState.initial()` for clean provider initialization.

### `lib/features/todo/application/controller/todos/todos_controller.dart`

- Implements a Riverpod `Notifier` provider.
- Holds todo state and exposes mutation methods.
- Adds todos with `onAddTodo(String title)`.
- Contains helper logic for toggling, updating, and deleting todos.
- Updates state immutably with `copyWith()`.

### `lib/features/todo/application/controller/completed_todos/completed_todos_provider.dart`

- Computes completed todo count from `todosControllerProvider`.
- Uses provider selection to read only the todos list.
- Keeps derived state outside the UI layer.

### `lib/features/todo/presentation/screens/todo_screen.dart`

- Main screen for the todo feature.
- Watches `todosControllerProvider` and `onCompletedTodosCountProvider`.
- Renders loading, empty, error, or todo list states.
- Composes `OverviewCard`, `TodoTile`, and `TodoAddDialog`.
- Displays a floating action button to add a new todo.

### `lib/features/todo/presentation/widgets/overview_card.dart`

- Summary card showing completed and total todos.
- Uses theme styling and primary color accents.
- Displays progress information in a lightweight card.

### `lib/features/todo/presentation/widgets/todo_add_dialog.dart`

- Dialog for new todo creation.
- Includes text field input and validation.
- Validates title input and shows a snackbar for empty titles.
- Currently can close the dialog but does not yet dispatch add logic.

### `lib/features/todo/presentation/widgets/todo_tile.dart`

- Todo item card UI.
- Includes a checkbox, title text, edit button, and delete button.
- Currently placeholder-only; wired UI callbacks should be added next.

### `lib/features/todo/data/`

- Placeholder folder for persistence and repository adapters.
- Use this layer for local storage, remote backend, or data source abstractions.
- Keeps external dependencies isolated from application and presentation layers.

## Architecture maps and flows

### High-level architecture map

```text
main.dart
  └─ MyApp (lib/app/app.dart)
        ├─ AppTheme (lib/core/theme/app_theme.dart)
        └─ TodoScreen (lib/features/todo/presentation/screens/todo_screen.dart)
              ├─ OverviewCard
              ├─ TodoTile
              └─ TodoAddDialog

Todo feature
  ├─ domain/todo.dart
  ├─ application/state/todos_state.dart
  ├─ application/controller/todos/todos_controller.dart
  └─ application/controller/completed_todos/completed_todos_provider.dart
```

### Data and state flow chart

```text
User taps FAB -> TodoAddDialog opens
         ↓
User enters title -> validation -> dispatch onAddTodo
         ↓
TodosController builds Todo object -> state update
         ↓
TodosState changes -> TodoScreen rebuilds
         ↓
Completed todos provider recalculates count
         ↓
OverviewCard and todo list UI refresh
```

### File connection graph

- `main.dart` → launches `MyApp`
- `app.dart` → applies theme and home screen
- `AppTheme` → uses `AppColors`
- `TodoScreen` → consumes `todosControllerProvider`
- `TodoScreen` → renders presentation widgets
- `TodosController` → updates `TodosState`
- `completed_todos_provider` → derives completed count from state
- `Todo` entity → used by domain and state layers

## Mindmap summary

- TickIt
  - Core
    - app_colors.dart
    - app_theme.dart
  - App
    - app.dart
  - Features
    - todo
      - presentation
        - todo_screen.dart
        - overview_card.dart
        - todo_tile.dart
        - todo_add_dialog.dart
      - application
        - todos_controller.dart
        - completed_todos_provider.dart
        - todos_state.dart
      - domain
        - todo.dart
      - data
        - (persistence placeholder)

## Current implementation status

- ✅ App shell and theme are implemented
- ✅ Todo screen renders dynamic state and derived completed count
- ⚠️ `TodoTile` is currently a static placeholder UI
- ⚠️ `TodoAddDialog` validates input but does not yet call controller logic
- ⚠️ Inline controller helpers need refactoring for reuse and public callbacks
- ⚠️ Persistence is not yet implemented in `lib/features/todo/data/`

## Developer guidance

- Add new features under `lib/features/<feature>/` using the same layered structure.
- Keep presentation widgets simple and avoid placing business logic in UI.
- Use `application/` for state changes, side effects, and provider composition.
- Keep domain models immutable and plain.
- Reserve `data/` for storage adapters and repository abstractions.
- Treat generated files (`*.g.dart`, `*.freezed.dart`) as non-editable outputs.

## Recommended next tasks

- Wire `TodoAddDialog` to `TodosController` to actually add new todos.
- Update `TodoTile` so each row reflects a real `Todo` object and triggers toggle/edit/delete callbacks.
- Refactor controller helper methods to be top-level methods on `TodosController` instead of nested inside `onAddTodo`.
- Add persistence support in `lib/features/todo/data/` with a repository interface.
- Introduce feature tests for `TodosController` and presentation widget behavior.
