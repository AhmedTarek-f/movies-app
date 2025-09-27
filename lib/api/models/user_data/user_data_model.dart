import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:movies_app/domain/entities/user_data/user_data_entity.dart';

class UserDataModel {
  String? userId;
  String? fullName;
  String? email;
  String? phoneNumber;
  int? selectedImage;
  List<String>? watchListIds;
  List<String>? historyListIds;

  UserDataModel({
    this.userId,
    this.fullName,
    this.email,
    this.phoneNumber,
    this.selectedImage,
    this.watchListIds,
    this.historyListIds,
  });

  static UserDataModel empty() => UserDataModel(
    userId: "",
    fullName: "",
    email: "",
    phoneNumber: "",
    selectedImage: 0,
    watchListIds: [],
    historyListIds: [],
  );

  Map<String, dynamic> toFireStore() {
    return {
      "UserId": userId,
      "FullName": fullName,
      "Email": email,
      "PhoneNumber": phoneNumber,
      "SelectedImage": selectedImage,
      "WatchListIds": watchListIds ?? [],
      "HistoryListIds": historyListIds ?? [],
    };
  }

  factory UserDataModel.fromFireStore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
  ) {
    final data = snapshot.data();
    if (data != null) {
      return UserDataModel(
        userId: data["UserId"],
        fullName: data["FullName"],
        email: data["Email"],
        phoneNumber: data["PhoneNumber"],
        selectedImage: data["SelectedImage"],
        watchListIds: List<String>.from(data["WatchListIds"] ?? []),
        historyListIds: List<String>.from(data["HistoryListIds"] ?? []),
      );
    } else {
      return empty();
    }
  }

  UserDataEntity toUserDataEntity() {
    return UserDataEntity(
      userId: userId ?? "",
      fullName: fullName ?? "",
      email: email ?? "",
      phoneNumber: phoneNumber ?? "",
      selectedImage: selectedImage ?? 0,
      watchListIds: watchListIds ?? [],
      historyListIds: historyListIds ?? [],
    );
  }
}
