import '../../domain/entities/app_user.dart';
import '../../domain/repositories/auth_repository.dart';

class AuthException implements Exception {
  AuthException(this.message);
  final String message;

  @override
  String toString() => message;
}

/// In-memory stand-in for a real auth backend. Keeps registered accounts for
/// the lifetime of the app so both the "email already in use" (register) and
/// "no account found" (login) paths are testable end to end before a real
/// service is wired in.
class FakeAuthRepository implements AuthRepository {
  final _accounts = <String, String>{}; // email -> name

  @override
  Future<AppUser> register({
    required String name,
    required String email,
    required String password,
  }) async {
    await Future.delayed(const Duration(milliseconds: 900));

    final normalizedEmail = email.trim().toLowerCase();
    if (_accounts.containsKey(normalizedEmail)) {
      throw AuthException('An account with this email already exists.');
    }
    _accounts[normalizedEmail] = name.trim();

    return AppUser(
      id: DateTime.now().microsecondsSinceEpoch.toString(),
      name: name.trim(),
      email: normalizedEmail,
    );
  }

  @override
  Future<AppUser> login({
    required String email,
    required String password,
  }) async {
    await Future.delayed(const Duration(milliseconds: 900));

    final normalizedEmail = email.trim().toLowerCase();
    final name = _accounts[normalizedEmail];
    if (name == null) {
      throw AuthException('No account found with this email.');
    }

    return AppUser(
      id: DateTime.now().microsecondsSinceEpoch.toString(),
      name: name,
      email: normalizedEmail,
    );
  }
}
