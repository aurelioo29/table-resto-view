class AuthResponse {
  final int? id;
  final String? firstName;
  final String? lastName;
  final String? email;
  final bool? isActive;
  final bool? isWaitress;
  final String? token;

  AuthResponse(
      {required this.id,
      required this.firstName,
      required this.lastName,
      required this.email,
      required this.isActive,
      required this.isWaitress,
      required this.token});

  factory AuthResponse.fromJson(Map<String, dynamic> json) {
    return AuthResponse(
        id: json['id'],
        firstName: json['firstName'],
        lastName: json['lastName'],
        email: json['email'],
        isActive: json['isActive'],
        isWaitress: json['isWaitress'],
        token: json['token']);
  }
}
