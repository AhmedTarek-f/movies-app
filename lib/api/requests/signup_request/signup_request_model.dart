class SignupRequestModel {
  final String userId;
  final String fullName;
  final String email;
  final String password;
  final String phoneNumber;
  final int selectedImage;
  final List<String> watchListIds;
  final List<String> historyListIds;

  const SignupRequestModel({
    required this.userId,
    required this.fullName,
    required this.email,
    required this.password,
    required this.phoneNumber,
    required this.selectedImage,
    this.watchListIds = const [],
    this.historyListIds = const [],
  });
}
