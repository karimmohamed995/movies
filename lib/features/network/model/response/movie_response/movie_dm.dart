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
  final String? summary;

  @JsonKey(name: 'medium_cover_image', fromJson: _nullableString)
  final String? mediumCoverImage;

  @JsonKey(name: 'large_cover_image', fromJson: _nullableString)
  final String? largeCoverImage;

  final List<Torrent>? torrents;

  MovieDm({
    required this.id,
    required this.title,
    required this.year,
    required this.rating,
    required this.runtime,
    this.genres,
    this.summary,
    this.mediumCoverImage,
    this.largeCoverImage,
    this.torrents,
  });

  factory MovieDm.fromJson(Map<String, dynamic> json) =>
      _$MovieDmFromJson(json);

  Map<String, dynamic> toJson() => _$MovieDmToJson(this);

  // helper function لتجنب null أو أي قيمة مش String
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
