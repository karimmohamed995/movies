class MovieEntity {
  final int id;
  final String title;
  final int year;
  final double rating;
  final int runtime;
  final String? mediumCoverImage;
  final String? largeCoverImage; // 👈 ضفناها
  final List<String>? genres;

  MovieEntity({
    required this.id,
    required this.title,
    required this.year,
    required this.rating,
    required this.runtime,
    this.mediumCoverImage,
    this.largeCoverImage, // 👈 ضفناها
    this.genres,
  });

  factory MovieEntity.fromJson(Map<String, dynamic> json) {
    print("RAW GENRES for ${json['title']}: ${json['genres']}");

    return MovieEntity(
      id: json['id'],
      title: json['title'],
      year: json['year'],
      rating: (json['rating'] as num).toDouble(),
      runtime: json['runtime'],
      mediumCoverImage: json['medium_cover_image'],
      largeCoverImage: json['large_cover_image'], // 👈 ضفناها هنا
      genres: (json['genres'] as List?)?.map((e) => e.toString()).toList(),
    );
  }
}
