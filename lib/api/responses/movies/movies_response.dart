import 'package:json_annotation/json_annotation.dart';
import 'package:movies_app/api/models/movie/movie_data.dart';

part 'movies_response.g.dart';

@JsonSerializable()
class MoviesResponse {
  @JsonKey(name: "status")
  final String? status;
  @JsonKey(name: "status_message")
  final String? statusMessage;
  @JsonKey(name: "data")
  final MovieData? data;

  MoviesResponse({this.status, this.statusMessage, this.data});

  factory MoviesResponse.fromJson(Map<String, dynamic> json) {
    return _$MoviesResponseFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$MoviesResponseToJson(this);
  }
}
