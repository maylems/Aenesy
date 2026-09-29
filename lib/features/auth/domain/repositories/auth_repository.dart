import '../entities/app_user.dart';

/// Abstraction the presentation layer depends on. The current implementation
/// ([FakeAuthRepository]) is local/in-memory; swap it for a real backend
/// (Firebase, a custom API, ...) later without touching the UI layer.
abstract class AuthRepository {
  Future<AppUser> register({
    required String name,
    required String email,
    required String password,
  });

  Future<AppUser> login({
    required String email,
    required String password,
  });
}
