// ignore_for_file: overridden_fields

import 'fresh.dart';

final class AuthToken extends OAuth2Token {
  /// The access token as a string.
  @override
  final String accessToken;

  /// The type of token, the default is “bearer”
  @override
  final String tokenType = 'Bearer';

  /// Token which can be used to obtain another access token.
  @override
  final String? refreshToken;

  const AuthToken({
    required this.accessToken,
    this.refreshToken,
  }) : super(
          accessToken: accessToken,
          refreshToken: refreshToken,
        );

  factory AuthToken.fromJson(Map<String, dynamic> json) {
    return AuthToken(accessToken: json['token']);
  }

  AuthToken copyWith({
    String? accessToken,
    String? refreshToken,
  }) {
    return AuthToken(
      accessToken: accessToken ?? this.accessToken,
      refreshToken: refreshToken ?? this.refreshToken,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{'token': accessToken};
  }

  @override
  String toString() {
    return 'AuthToken${toJson()}';
  }
}
