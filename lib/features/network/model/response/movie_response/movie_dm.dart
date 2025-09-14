import 'package:json_annotation/json_annotation.dart';

part 'movie_dm.g.dart';

@JsonSerializable(explicitToJson: true)
class MovieDm {
  final int id;
  final String title;
  final int? year;
  final double? rating;
  final int? runtime;
  final List<String>? genres;

  @JsonKey(name: 'description_full')
  final String? descriptionFull;

  @JsonKey(name: 'description_intro')
  final String? descriptionIntro;

  @JsonKey(name: 'medium_cover_image', fromJson: _nullableString)
  final String? mediumCoverImage;

  @JsonKey(name: 'large_cover_image', fromJson: _nullableString)
  final String? largeCoverImage;

  final List<Torrent>? torrents;

  // ✅ أضفنا الـ cast
  final List<CastDm>? cast;

  MovieDm({
    required this.id,
    required this.title,
    this.year,
    this.rating,
    this.runtime,
    this.genres,
    this.descriptionFull,
    this.descriptionIntro,
    this.mediumCoverImage,
    this.largeCoverImage,
    this.torrents,
    this.cast,
  });

  factory MovieDm.fromJson(Map<String, dynamic> json) =>
      _$MovieDmFromJson(json);

  Map<String, dynamic> toJson() => _$MovieDmToJson(this);

  static String? _nullableString(dynamic value) {
    if (value is String && value.isNotEmpty) return value;
    return null;
  }
}

@JsonSerializable()
class Torrent {
  final String? url;
  final String? hash;
  final String? quality;
  final String? type;
  final int? seeds;
  final int? peers;
  final String? size;

  @JsonKey(name: 'size_bytes')
  final int? sizeBytes;

  @JsonKey(name: 'date_uploaded')
  final String? dateUploaded;

  @JsonKey(name: 'date_uploaded_unix')
  final int? dateUploadedUnix;

  @JsonKey(name: 'magnet_url')
  final String? magnetUrl;

  Torrent({
    this.url,
    this.hash,
    this.quality,
    this.type,
    this.seeds,
    this.peers,
    this.size,
    this.sizeBytes,
    this.dateUploaded,
    this.dateUploadedUnix,
    this.magnetUrl,
  });

  factory Torrent.fromJson(Map<String, dynamic> json) =>
      _$TorrentFromJson(json);

  Map<String, dynamic> toJson() => _$TorrentToJson(this);
}

@JsonSerializable()
class CastDm {
  final String? name;

  @JsonKey(name: 'character_name')
  final String? characterName;

  @JsonKey(name: 'url_small_image')
  final String? imageUrl;

  @JsonKey(name: 'imdb_code')
  final String? imdbCode;

  CastDm({this.name, this.characterName, this.imageUrl, this.imdbCode});

  factory CastDm.fromJson(Map<String, dynamic> json) => _$CastDmFromJson(json);

  Map<String, dynamic> toJson() => _$CastDmToJson(this);
}
