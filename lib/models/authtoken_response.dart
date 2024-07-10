class AuthTokenResponse {
  String token;
  String status;

  AuthTokenResponse(this.token, this.status);

  factory AuthTokenResponse.fromJson(Map<String, dynamic> json) {
    return AuthTokenResponse(
      json['token'],
      json['status'],
    );
  }

  Map<String, dynamic> toJson() => {
        'token': token,
        'status': status,
      };
}