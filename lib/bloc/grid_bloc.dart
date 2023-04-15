import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meta/meta.dart';
import 'package:pastebin/Models/UserSearchModel.dart';
import 'package:pastebin/Models/profileimage/profile_image.dart';
import 'package:pastebin/Models/profileimage/profileimage.dart';
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
      //  SearchResultKey: [],
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
          imageLoad: [],
          searchList: [],
          isLoading: false,
          isError: true,
        );
      }, (r) {
        return GridState(
          imageLoad: r,
          searchList: state.searchList,
          isLoading: false,
          isError: false,
        );
      });
      emit(_state);
      // TODO: implement event handler
    });
    on<SearchMovie>((event, emit) async {
      emit(GridState(
          imageLoad: [],
          searchList: state.searchList,
          isLoading: false,
          isError: false));
      //String serachResult="";

      final serachResult =
          await imageRepo.getSearchResult(searchKey: event.searchKey);

      print("@@@@@@@ inside bloc of search with key $serachResult");

      final _state = serachResult.fold((l) {
        return GridState(
            imageLoad: [], searchList: [], isLoading: false, isError: true);
      }, (r) {
        return GridState(
            imageLoad: [], searchList: r, isLoading: false, isError: false);
      });
      emit(_state);
    });
  }
}
