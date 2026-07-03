import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tick_it/features/todo/domain/todo.dart';

part 'todos_state.freezed.dart';

@freezed
abstract class TodosState with _$TodosState {
  const factory TodosState({
    required List<Todo> todos,
    required bool isLoading,
    String? errorMessage,
  }) = _TodosState;

  factory TodosState.initial() {
    return const TodosState(todos: [], isLoading: false);
  }
}
