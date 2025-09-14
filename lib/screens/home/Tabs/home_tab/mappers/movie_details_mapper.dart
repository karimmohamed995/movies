import 'package:injectable/injectable.dart';
import 'package:movies/features/network/model/response/movie_details_response/movie_details_response.dart';
import 'package:movies/screens/home/Tabs/home_tab/data/cast_entitty.dart';
import 'package:movies/screens/home/Tabs/home_tab/data/movie_entity.dart';

@injectable
class MovieDetailsMapper {
  MovieEntity fromDetailsModel(MovieDetailsDm movie) {
    // جمع الـ screenshots من الحقول المتاحة في الـ API
    final screenshots = [
      movie.medium_screenshot_image1,
      movie.medium_screenshot_image2,
      movie.medium_screenshot_image3,
    ].whereType<String>().toList();

    // تحويل الـ cast
    final castList = (movie.cast ?? [])
        .map(
          (c) => CastEntity(
            name: c.name ?? "",
            characterName: c.characterName ?? "",
            urlSmallImage: c.imageUrl,
          ),
        )
        .toList();

    return MovieEntity(
      id: movie.id ?? 0,
      title: movie.title ?? "",
      year: movie.year ?? 0,
      rating: movie.rating ?? 0,
      runtime: movie.runtime ?? 0,
      mediumCoverImage: movie.medium_cover_image ?? "",
      // largeCoverImage: movie.large_cover_image ?? "",
      genres: movie.genres ?? [],
      summary: (movie.description_full?.isNotEmpty ?? false)
          ? movie.description_full!
          : (movie.description_intro ?? ""),
      screenshots: screenshots,
      cast: castList, // 👈 ضفناها هنا
    );
  }
}
