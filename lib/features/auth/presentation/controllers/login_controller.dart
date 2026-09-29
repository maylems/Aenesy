import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entities/app_user.dart';
import 'register_controller.dart' show authRepositoryProvider;

final loginControllerProvider =
    AsyncNotifierProvider<LoginController, AppUser?>(LoginController.new);

class LoginController extends AsyncNotifier<AppUser?> {
  @override
  AppUser? build() => null;

  Future<void> login({required String email, required String password}) async {
    state = const AsyncLoading();
    final repository = ref.read(authRepositoryProvider);
    state = await AsyncValue.guard(
      () => repository.login(email: email, password: password),
    );
  }
}
