// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todos_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(TodosController)
final todosControllerProvider = TodosControllerProvider._();

final class TodosControllerProvider
    extends $NotifierProvider<TodosController, TodosState> {
  TodosControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'todosControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$todosControllerHash();

  @$internal
  @override
  TodosController create() => TodosController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(TodosState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<TodosState>(value),
    );
  }
}

String _$todosControllerHash() => r'6895a613b70bdd260e70d43ea19f6b06e637ff40';

abstract class _$TodosController extends $Notifier<TodosState> {
  TodosState build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<TodosState, TodosState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<TodosState, TodosState>,
              TodosState,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
