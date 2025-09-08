import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movies/core/api_result/api_result.dart';
import 'package:movies/screens/home/Tabs/home_tab/cubit/home_tab_states.dart';
import 'package:movies/screens/home/Tabs/home_tab/domain/usecase/load_movies_usecase.dart';

@injectable
class HomeTabCubit extends Cubit<HomeTabStates> {
  final LoadMoviesUsecase _loadMoviesUsecase;
  HomeTabCubit(this._loadMoviesUsecase) : super(HomeTabStates.initial());

  getMovies() async {
    emit(HomeTabStates(moviesState: LoadingApiResult()));
    var result = await _loadMoviesUsecase();
    emit(HomeTabStates(moviesState: result));
  }
}
