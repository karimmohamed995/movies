import 'package:json_annotation/json_annotation.dart';

part 'movie_details_response.g.dart';

@JsonSerializable()
class MovieDetailsResponse {
  final String? status;
  final String? status_message;
  final MovieDetailsData? data;

  MovieDetailsResponse({this.status, this.status_message, this.data});

  factory MovieDetailsResponse.fromJson(Map<String, dynamic> json) =>
      _$MovieDetailsResponseFromJson(json);
}

@JsonSerializable()
class MovieDetailsData {
  final MovieDetailsDm? movie;

  MovieDetailsData({this.movie});

  factory MovieDetailsData.fromJson(Map<String, dynamic> json) =>
      _$MovieDetailsDataFromJson(json);
}

@JsonSerializable()
class MovieDetailsDm {
  final int? id;
  final String? title;
  final int? year;
  final double? rating;
  final int? runtime;
  final String? description_intro;
  final String? description_full;
  final String? medium_cover_image;
  final String? background_image;
  final String? medium_screenshot_image1;
  final String? medium_screenshot_image2;
  final String? medium_screenshot_image3;
  final String? large_screenshot_image1;
  final String? large_screenshot_image2;
  final String? large_screenshot_image3;
  // 🔹 أضف الـ genres
  final List<String>? genres;

  MovieDetailsDm({
    this.id,
    this.title,
    this.year,
    this.rating,
    this.runtime,
    this.genres,
    this.description_intro,
    this.description_full,
    this.medium_cover_image,
    this.background_image,
    this.medium_screenshot_image1,
    this.medium_screenshot_image2,
    this.medium_screenshot_image3,
    this.large_screenshot_image1,
    this.large_screenshot_image2,
    this.large_screenshot_image3,
  });

  factory MovieDetailsDm.fromJson(Map<String, dynamic> json) =>
      _$MovieDetailsDmFromJson(json);
}
