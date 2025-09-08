// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieResponse _$MovieResponseFromJson(Map<String, dynamic> json) =>
    MovieResponse(
      data: MovieData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MovieResponseToJson(MovieResponse instance) =>
    <String, dynamic>{'data': instance.data.toJson()};

MovieData _$MovieDataFromJson(Map<String, dynamic> json) => MovieData(
  movieCount: (json['movie_count'] as num).toInt(),
  limit: (json['limit'] as num).toInt(),
  pageNumber: (json['page_number'] as num).toInt(),
  movies: (json['movies'] as List<dynamic>)
      .map((e) => MovieDm.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$MovieDataToJson(MovieData instance) => <String, dynamic>{
  'movie_count': instance.movieCount,
  'limit': instance.limit,
  'page_number': instance.pageNumber,
  'movies': instance.movies.map((e) => e.toJson()).toList(),
};
