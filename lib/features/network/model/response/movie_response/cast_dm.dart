import 'package:json_annotation/json_annotation.dart';

part 'cast_dm.g.dart';

@JsonSerializable()
class CastDm {
  final String? name;
  final String? character_name;
  final String? url_small_image;
  final String? imdb_code;

  CastDm({
    this.name,
    this.character_name,
    this.url_small_image,
    this.imdb_code,
  });

  factory CastDm.fromJson(Map<String, dynamic> json) => _$CastDmFromJson(json);
}
