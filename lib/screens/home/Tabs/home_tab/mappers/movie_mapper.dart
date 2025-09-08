import 'package:injectable/injectable.dart';
import 'package:movies/features/network/model/response/movie_response/movie_dm.dart';
import 'package:movies/screens/home/Tabs/home_tab/data/movie_entity.dart';
// import 'package:movies/utils/app_assets.dart'; // لو عندك شعار افتراضي

@injectable
// class MovieMapper {
//   MovieEntity fromDataModel(MovieDm movie) {
//     return MovieEntity(
//       id: movie.id,
//       title: movie.title,
//       year: movie.year,
//       rating: movie.rating,
//       runtime: movie.runtime,
//       mediumCoverImage: movie.mediumCoverImage?.isNotEmpty == true
//           ? movie.mediumCoverImage!
//           : AppAssets.logo, // هنا حطينا fallback للصورة
//     );
//   }
//   List<MovieEntity> fromDataModels(List<MovieDm> movies) {
//     return movies.map(fromDataModel).toList();
//   }
// }
class MovieMapper {
  MovieEntity fromDataModel(MovieDm movie) {
    return MovieEntity(
      id: movie.id,
      title: movie.title,
      year: movie.year,
      rating: movie.rating,
      runtime: movie.runtime,
      mediumCoverImage:
          movie.mediumCoverImage ?? "", // لو null خليها empty string
      genres: movie.genres,
    );
  }

  List<MovieEntity> fromDataModels(List<MovieDm> movies) {
    return movies.map(fromDataModel).toList();
  }
}
