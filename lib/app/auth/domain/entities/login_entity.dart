class LoginEntity {
  final bool status;
  final String message;
  final String accessToken;
  final dynamic oData; // Can be nullable or hold any type

  LoginEntity({
    required this.status,
    required this.message,
    required this.accessToken,
    this.oData,
  });
}
