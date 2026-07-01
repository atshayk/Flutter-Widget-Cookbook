import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginState {
  final bool isLoading;
  final String username;
  final String password;

  LoginState({
    this.isLoading = false,
    this.username = '',
    this.password = '',
  });

  LoginState copyWith({bool? isLoading, String? username, String? password}) {
    return LoginState(
      isLoading: isLoading ?? this.isLoading,
      username: username ?? this.username,
      password: password ?? this.password,
    );
  }
}

class LoginNotifier extends AutoDisposeNotifier<LoginState> {
  @override
  LoginState build() => LoginState();
  
  void updateUsername(String value) => state = state.copyWith(username: value);
  void updatePassword(String value) => state = state.copyWith(password: value);

  Future<bool> login() async {
    if (state.username.isEmpty || state.password.isEmpty) {
      return false;
    }

    state = state.copyWith(isLoading: true);

    await Future.delayed(const Duration(seconds: 2));

    state = state.copyWith(isLoading: false);
    return true;
  }
}

final loginProvider = NotifierProvider.autoDispose<LoginNotifier, LoginState>(() {
  return LoginNotifier();
});
