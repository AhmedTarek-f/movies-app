import 'package:equatable/equatable.dart';
import 'package:movies_app/domain/entities/movie/torrent_entity.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
//ignore: must_be_immutable
class MovieEntity extends Equatable {
  @Id()
  int id = 0;

  final int? movieId;
  final String? title;
  final String? mediumCoverImage;
  final String? backgroundImage;
  final int? year;
  final double? rating;
  final List<String>? genres;
  final String? summary;
  final ToMany<TorrentEntity> torrents = ToMany<TorrentEntity>();

  MovieEntity({
    this.movieId,
    this.title,
    this.mediumCoverImage,
    this.backgroundImage,
    this.year,
    this.rating,
    this.genres,
    this.summary,
  });

  @override
  List<Object?> get props => [
    movieId,
    title,
    mediumCoverImage,
    backgroundImage,
    year,
    rating,
    genres,
    summary,
  ];
}
