class LoginResponseDto {
  String authToken;
  String refreshToken;

  LoginResponseDto({
    required this.authToken,
    required this.refreshToken,
  });

  factory LoginResponseDto.fromJson(Map<String, dynamic> json) =>
      LoginResponseDto(
        authToken: json["authToken"],
        refreshToken: json["refreshToken"],
      );
  Map<String, dynamic> toJson() => {
        "authToken": authToken,
        "refreshToken": refreshToken,
      };
}
