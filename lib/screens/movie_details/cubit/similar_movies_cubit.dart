import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movies/core/api_result/api_result.dart';
import 'package:movies/screens/movie_details/cubit/similar_movies_states.dart';
import 'package:movies/screens/movie_details/usecase/load_similar_movies_usecase.dart';

@injectable
class SimilarMoviesCubit extends Cubit<SimilarMoviesStates> {
  final LoadSimilarMoviesUsecase _loadSimilarMoviesUsecase;

  SimilarMoviesCubit(this._loadSimilarMoviesUsecase)
    : super(SimilarMoviesStates.initial());

  Future<void> getMovieSuggestions(int movieId) async {
    // Loading
    emit(SimilarMoviesStates(similarMoviesState: LoadingApiResult()));

    // Call usecase
    var result = await _loadSimilarMoviesUsecase(movieId);

    // Emit result (Success / Error)
    emit(SimilarMoviesStates(similarMoviesState: result));
  }
}
