import 'package:equatable/equatable.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
//ignore: must_be_immutable
class TorrentEntity extends Equatable {
  @Id()
  int id = 0;

  final String? url;
  final String? quality;
  final String? type;
  final String? size;

  TorrentEntity({this.url, this.quality, this.type, this.size});

  @override
  List<Object?> get props => [url, quality, type, size];
}
