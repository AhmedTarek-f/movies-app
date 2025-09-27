class SignupRequestEntity {
  final String? userId;
  final String fullName;
  final String email;
  final String password;
  final String phoneNumber;
  final int selectedImage;

  const SignupRequestEntity({
    this.userId,
    required this.fullName,
    required this.email,
    required this.password,
    required this.phoneNumber,
    required this.selectedImage,
  });
}
