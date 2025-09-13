// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_details_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieDetailsResponse _$MovieDetailsResponseFromJson(
  Map<String, dynamic> json,
) => MovieDetailsResponse(
  status: json['status'] as String?,
  status_message: json['status_message'] as String?,
  data: json['data'] == null
      ? null
      : MovieDetailsData.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$MovieDetailsResponseToJson(
  MovieDetailsResponse instance,
) => <String, dynamic>{
  'status': instance.status,
  'status_message': instance.status_message,
  'data': instance.data,
};

MovieDetailsData _$MovieDetailsDataFromJson(Map<String, dynamic> json) =>
    MovieDetailsData(
      movie: json['movie'] == null
          ? null
          : MovieDetailsDm.fromJson(json['movie'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MovieDetailsDataToJson(MovieDetailsData instance) =>
    <String, dynamic>{'movie': instance.movie};

MovieDetailsDm _$MovieDetailsDmFromJson(Map<String, dynamic> json) =>
    MovieDetailsDm(
      id: (json['id'] as num?)?.toInt(),
      title: json['title'] as String?,
      year: (json['year'] as num?)?.toInt(),
      rating: (json['rating'] as num?)?.toDouble(),
      runtime: (json['runtime'] as num?)?.toInt(),
      genres: (json['genres'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      description_intro: json['description_intro'] as String?,
      description_full: json['description_full'] as String?,
      medium_cover_image: json['medium_cover_image'] as String?,
      background_image: json['background_image'] as String?,
      medium_screenshot_image1: json['medium_screenshot_image1'] as String?,
      medium_screenshot_image2: json['medium_screenshot_image2'] as String?,
      medium_screenshot_image3: json['medium_screenshot_image3'] as String?,
      large_screenshot_image1: json['large_screenshot_image1'] as String?,
      large_screenshot_image2: json['large_screenshot_image2'] as String?,
      large_screenshot_image3: json['large_screenshot_image3'] as String?,
    );

Map<String, dynamic> _$MovieDetailsDmToJson(MovieDetailsDm instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'year': instance.year,
      'rating': instance.rating,
      'runtime': instance.runtime,
      'description_intro': instance.description_intro,
      'description_full': instance.description_full,
      'medium_cover_image': instance.medium_cover_image,
      'background_image': instance.background_image,
      'medium_screenshot_image1': instance.medium_screenshot_image1,
      'medium_screenshot_image2': instance.medium_screenshot_image2,
      'medium_screenshot_image3': instance.medium_screenshot_image3,
      'large_screenshot_image1': instance.large_screenshot_image1,
      'large_screenshot_image2': instance.large_screenshot_image2,
      'large_screenshot_image3': instance.large_screenshot_image3,
      'genres': instance.genres,
    };
