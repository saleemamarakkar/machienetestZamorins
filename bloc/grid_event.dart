part of 'grid_bloc.dart';

@freezed
class GridEvent with _$GridEvent {
  const factory GridEvent.initialized() = Initialized;
  const factory GridEvent.searchMovie({
    required String movieQuery,
  }) = SearchMovie;
}
