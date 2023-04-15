part of 'grid_bloc.dart';

@freezed
class GridState with _$GridState {
  const factory GridState(
      {required List<Profileimage> imageLoad,
      required List<User> searchList,
      required bool isLoading,
      required bool isError}) = _GridState;
  factory GridState.initial() => GridState(
        imageLoad: [],
        searchList: [],
        isLoading: false,
        isError: false,
      );
}
