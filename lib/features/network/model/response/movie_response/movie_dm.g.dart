// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_dm.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieDm _$MovieDmFromJson(Map<String, dynamic> json) => MovieDm(
  id: (json['id'] as num).toInt(),
  title: json['title'] as String,
  year: (json['year'] as num?)?.toInt(),
  rating: (json['rating'] as num?)?.toDouble(),
  runtime: (json['runtime'] as num?)?.toInt(),
  genres: (json['genres'] as List<dynamic>?)?.map((e) => e as String).toList(),
  descriptionFull: json['description_full'] as String?,
  descriptionIntro: json['description_intro'] as String?,
  mediumCoverImage: MovieDm._nullableString(json['medium_cover_image']),
  largeCoverImage: MovieDm._nullableString(json['large_cover_image']),
  torrents: (json['torrents'] as List<dynamic>?)
      ?.map((e) => Torrent.fromJson(e as Map<String, dynamic>))
      .toList(),
  cast: (json['cast'] as List<dynamic>?)
      ?.map((e) => CastDm.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$MovieDmToJson(MovieDm instance) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'year': instance.year,
  'rating': instance.rating,
  'runtime': instance.runtime,
  'genres': instance.genres,
  'description_full': instance.descriptionFull,
  'description_intro': instance.descriptionIntro,
  'medium_cover_image': instance.mediumCoverImage,
  'large_cover_image': instance.largeCoverImage,
  'torrents': instance.torrents?.map((e) => e.toJson()).toList(),
  'cast': instance.cast?.map((e) => e.toJson()).toList(),
};

Torrent _$TorrentFromJson(Map<String, dynamic> json) => Torrent(
  url: json['url'] as String?,
  hash: json['hash'] as String?,
  quality: json['quality'] as String?,
  type: json['type'] as String?,
  seeds: (json['seeds'] as num?)?.toInt(),
  peers: (json['peers'] as num?)?.toInt(),
  size: json['size'] as String?,
  sizeBytes: (json['size_bytes'] as num?)?.toInt(),
  dateUploaded: json['date_uploaded'] as String?,
  dateUploadedUnix: (json['date_uploaded_unix'] as num?)?.toInt(),
  magnetUrl: json['magnet_url'] as String?,
);

Map<String, dynamic> _$TorrentToJson(Torrent instance) => <String, dynamic>{
  'url': instance.url,
  'hash': instance.hash,
  'quality': instance.quality,
  'type': instance.type,
  'seeds': instance.seeds,
  'peers': instance.peers,
  'size': instance.size,
  'size_bytes': instance.sizeBytes,
  'date_uploaded': instance.dateUploaded,
  'date_uploaded_unix': instance.dateUploadedUnix,
  'magnet_url': instance.magnetUrl,
};

CastDm _$CastDmFromJson(Map<String, dynamic> json) => CastDm(
  name: json['name'] as String?,
  characterName: json['character_name'] as String?,
  imageUrl: json['url_small_image'] as String?,
  imdbCode: json['imdb_code'] as String?,
);

Map<String, dynamic> _$CastDmToJson(CastDm instance) => <String, dynamic>{
  'name': instance.name,
  'character_name': instance.characterName,
  'url_small_image': instance.imageUrl,
  'imdb_code': instance.imdbCode,
};
