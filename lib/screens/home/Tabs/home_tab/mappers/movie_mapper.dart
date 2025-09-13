import 'package:injectable/injectable.dart';
import 'package:movies/features/network/model/response/movie_response/movie_dm.dart';
import 'package:movies/screens/home/Tabs/home_tab/data/movie_entity.dart';

@injectable
class MovieMapper {
  MovieEntity fromDataModel(MovieDm movie) {
    return MovieEntity(
      id: movie.id,
      title: movie.title,
      year: movie.year ?? 0,
      rating: movie.rating ?? 0,
      runtime: movie.runtime,
      mediumCoverImage: movie.mediumCoverImage ?? "",
      genres: movie.genres,
      summary: "", // 👈 suggestions API مفيهوش summary
    );
  }

  List<MovieEntity> fromDataModels(List<MovieDm> movies) {
    return movies.map(fromDataModel).toList();
  }
}
