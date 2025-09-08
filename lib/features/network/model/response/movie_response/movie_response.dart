import 'package:json_annotation/json_annotation.dart';
import 'package:movies/features/network/model/response/movie_response/movie_dm.dart';

part 'movie_response.g.dart';

@JsonSerializable(explicitToJson: true)
class MovieResponse {
  final MovieData data;

  MovieResponse({required this.data});

  factory MovieResponse.fromJson(Map<String, dynamic> json) =>
      _$MovieResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MovieResponseToJson(this);
}

@JsonSerializable(explicitToJson: true)
class MovieData {
  @JsonKey(name: 'movie_count')
  final int movieCount;
  final int limit;
  @JsonKey(name: 'page_number')
  final int pageNumber;
  final List<MovieDm> movies;

  MovieData({
    required this.movieCount,
    required this.limit,
    required this.pageNumber,
    required this.movies,
  });

  factory MovieData.fromJson(Map<String, dynamic> json) =>
      _$MovieDataFromJson(json);

  Map<String, dynamic> toJson() => _$MovieDataToJson(this);
}
