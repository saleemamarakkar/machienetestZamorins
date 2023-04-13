part of 'grid_bloc.dart';

@freezed
class GridState with _$GridState {
  const factory GridState(
      {required List<User> SearchResultKey,
      required List<User> idleList,
      required bool isLoading,
      required bool isError}) = _GridState;
  factory GridState.initial() => const GridState(
        SearchResultKey: [],
        idleList: [],
        isLoading: false,
        isError: false,
      );
}
