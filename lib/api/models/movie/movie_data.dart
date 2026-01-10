import 'package:json_annotation/json_annotation.dart';
import 'package:movies_app/api/models/movie/movie_model.dart';

part 'movie_data.g.dart';

@JsonSerializable()
class MovieData {
  @JsonKey(name: "movie_count")
  final int? movieCount;
  @JsonKey(name: "limit")
  final int? limit;
  @JsonKey(name: "page_number")
  final int? pageNumber;
  @JsonKey(name: "movies")
  final List<MovieModel>? movies;

  MovieData({this.movieCount, this.limit, this.pageNumber, this.movies});

  factory MovieData.fromJson(Map<String, dynamic> json) {
    return _$MovieDataFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$MovieDataToJson(this);
  }
}
