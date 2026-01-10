import 'package:equatable/equatable.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
// ignore: must_be_immutable
class UserDataEntity extends Equatable {
  @Id()
  int id = 0;

  String? userId;
  String? fullName;
  String? email;
  String? phoneNumber;
  int? selectedImage;
  List<String>? watchListIds;
  List<String>? historyListIds;

  UserDataEntity({
    this.userId,
    this.fullName,
    this.email,
    this.phoneNumber,
    this.selectedImage,
    this.watchListIds,
    this.historyListIds,
  });

  @override
  List<Object?> get props => [
    userId,
    fullName,
    email,
    phoneNumber,
    selectedImage,
    watchListIds,
    historyListIds,
  ];
}
