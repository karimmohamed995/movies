import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movies/core/api_result/api_result.dart';
import 'package:movies/screens/movie_details/cubit/movie_details_states.dart';
import 'package:movies/screens/movie_details/usecase/movie_details_usecase.dart';

@injectable
class MovieDetailsCubit extends Cubit<MovieDetailsStates> {
  final MovieDetailsUsecase _movieDetailsUsecase;

  MovieDetailsCubit(this._movieDetailsUsecase)
    : super(MovieDetailsStates.initial());

  Future<void> getMovieDetails(int movieId) async {
    emit(MovieDetailsStates(movieDetailsState: LoadingApiResult()));

    final result = await _movieDetailsUsecase(movieId);

    emit(MovieDetailsStates(movieDetailsState: result));
  }
}
