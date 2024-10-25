import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

import '../models/auth_token.dart';
import '../models/fresh.dart';

final class AuthStorage extends TokenStorage<AuthToken> {
  final _controller = StreamController<void>.broadcast();

  Stream<void> get logoutStream {
    return _controller.stream;
  }

  // _authTokenKey:----------------------------------------------------------------------

  static const _authTokenKey = '_authTokenKey';
  late StreamController<AuthToken?> _tokenController;

  AuthStorage() {
    _tokenController = StreamController<AuthToken?>.broadcast();
  }

  Stream<AuthToken?> get stream => _tokenController.stream;

  AuthToken? get _authToken {
    if (GetStorage().read(_authTokenKey) != null) {
      final authToken = AuthToken.fromJson(GetStorage().read(_authTokenKey));
      return authToken;
    } else {
      return null;
    }
  }

  set _authToken(AuthToken? value) {
    GetStorage().write(_authTokenKey, value?.toJson());
    _tokenController.add(value);
  }

  @override
  Future<void> delete() async {
    GetStorage().remove(_authTokenKey);
    _tokenController.add(null);
  }

  @override
  Future<AuthToken?> read() {
    return Future.value(_authToken);
  }

  @override
  Future<void> write(AuthToken token) async {
    _authToken = token;
  }

  dispose() {
    _tokenController.close();
  }

  StreamSubscription<void> listenForLogout(VoidCallback callback) {
    return logoutStream.listen((_) {
      callback();
    });
  }

  performLogout() {
    _controller.add(());
  }
}
