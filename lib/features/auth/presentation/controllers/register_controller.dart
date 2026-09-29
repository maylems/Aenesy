import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/repositories/fake_auth_repository.dart';
import '../../domain/entities/app_user.dart';
import '../../domain/repositories/auth_repository.dart';

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return FakeAuthRepository();
});

final registerControllerProvider =
    AsyncNotifierProvider<RegisterController, AppUser?>(
  RegisterController.new,
);

class RegisterController extends AsyncNotifier<AppUser?> {
  @override
  AppUser? build() => null;

  Future<void> register({
    required String name,
    required String email,
    required String password,
  }) async {
    state = const AsyncLoading();
    final repository = ref.read(authRepositoryProvider);
    state = await AsyncValue.guard(
      () => repository.register(name: name, email: email, password: password),
    );
  }

  void reset() => state = const AsyncData(null);
}
