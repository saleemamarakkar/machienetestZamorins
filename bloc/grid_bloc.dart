import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meta/meta.dart';
import 'package:pastebin/infrastructure/image_repo.dart';
import 'package:injectable/injectable.dart';
import '../Models/profileimage/user.dart';

part 'grid_event.dart';
part 'grid_state.dart';
part 'grid_bloc.freezed.dart';

@injectable
class GridBloc extends Bloc<GridEvent, GridState> {
  final ImageRepo imageRepo;

  GridBloc(this.imageRepo) : super(GridState.initial()) {
    on<Initialized>((event, emit) async {
      // emit(GridState(
      //   SearchResultKey: [],
      //   idleList: state.idleList,
      //   isLoading: false,
      //   isError: false,
      // ));
      //get trending ,movies
      final result = await imageRepo.getDownloadsImage();

      print("result inside bloc");
      print(result);
      final _state = result.fold((l) {
        return GridState(
          SearchResultKey: [],
          idleList: [],
          isLoading: false,
          isError: true,
        );
      }, (r) {
        return GridState(
          SearchResultKey: r,
          idleList: state.idleList,
          isLoading: false,
          isError: false,
        );
      });
      emit(_state);
      // TODO: implement event handler
    });
  }
}
