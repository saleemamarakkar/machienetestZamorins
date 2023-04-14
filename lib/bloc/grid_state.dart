part of 'grid_bloc.dart';

@freezed
class GridState with _$GridState {
  const factory GridState(
      {required List<Profileimage> SearchResultKey,
      required List<User> idleList,
      required bool isLoading,
      required bool isError}) = _GridState;
  factory GridState.initial() => GridState(
        SearchResultKey: [],
        idleList: [],
        isLoading: false,
        isError: false,
      );
}
