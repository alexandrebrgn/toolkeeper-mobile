
class User {
  final int id;
  final String firstName;
  final String lastName;
  final String email;

  User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
  });

  factory User.fromJSON(Map<String, dynamic> mappedJson) {
    return User(
      id: mappedJson['id'],
      firstName: mappedJson['firstName'] ?? '',
      lastName: mappedJson['lastName'] ?? '',
      email: mappedJson['email'] ?? '',
    );
  }
}