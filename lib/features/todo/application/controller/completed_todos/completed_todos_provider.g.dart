// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'completed_todos_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(onCompletedTodosCount)
final onCompletedTodosCountProvider = OnCompletedTodosCountProvider._();

final class OnCompletedTodosCountProvider
    extends $FunctionalProvider<int, int, int>
    with $Provider<int> {
  OnCompletedTodosCountProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'onCompletedTodosCountProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$onCompletedTodosCountHash();

  @$internal
  @override
  $ProviderElement<int> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  int create(Ref ref) {
    return onCompletedTodosCount(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(int value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<int>(value),
    );
  }
}

String _$onCompletedTodosCountHash() =>
    r'abeacfedd037fec47b0a5a69ead71656a7f20bc0';
