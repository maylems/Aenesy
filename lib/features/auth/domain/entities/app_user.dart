class AppUser {
  const AppUser({
    required this.id,
    required this.name,
    required this.email,
  });

  final String id;
  final String name;
  final String email;

  /// Temporary stand-in used while the email register/login forms are
  /// bypassed — remove once real auth is wired back in.
  factory AppUser.guest() => const AppUser(
        id: 'guest',
        name: 'James Watt',
        email: 'james.watt@example.com',
      );
}
