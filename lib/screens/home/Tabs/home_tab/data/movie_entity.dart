import 'package:movies/screens/home/Tabs/home_tab/data/cast_entitty.dart';

class MovieEntity {
  final int id;
  final String title;
  final int year;
  final double rating;
  final int? runtime;
  final String? mediumCoverImage;
  final String? largeCoverImage;
  final List<String>? genres;
  final String? summary;
  final List<String>? screenshots;

  // 👇 ضفنا cast هنا
  final List<CastEntity>? cast;

  MovieEntity({
    required this.id,
    required this.title,
    required this.year,
    required this.rating,
    this.runtime,
    this.mediumCoverImage,
    this.largeCoverImage,
    this.genres,
    this.summary,
    this.screenshots,
    this.cast,
  });

  factory MovieEntity.fromJson(Map<String, dynamic> json) {
    print("RAW GENRES for ${json['title']}: ${json['genres']}");

    return MovieEntity(
      id: json['id'] ?? 0,
      title: json['title'] ?? "",
      year: json['year'] ?? 0,
      rating: (json['rating'] is num)
          ? (json['rating'] as num).toDouble()
          : 0.0,
      runtime: json['runtime'],
      mediumCoverImage: json['medium_cover_image'],
      largeCoverImage: json['large_cover_image'],
      genres: (json['genres'] as List?)?.map((e) => e.toString()).toList(),
      summary: json['summary'],
      screenshots: (json['screenshots'] as List?)
          ?.map((e) => e.toString())
          .toList(),
      cast: (json['cast'] as List?)
          ?.map(
            (e) => CastEntity(
              name: e['name'] ?? "",
              characterName: e['character_name'] ?? "",
              urlSmallImage: e['url_small_image'],
            ),
          )
          .toList(),
    );
  }
}
