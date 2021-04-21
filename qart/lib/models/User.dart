class User {
  final String firstName;
  final String lastName;
  final String email;
  final String imgUrl;
  final String mobile;
  final String gender;

  const User(
      {required this.firstName,
      required this.lastName,
      required this.email,
      required this.imgUrl,
      required this.mobile,
      required this.gender});

  String get getUserName => "$firstName $lastName";
  String get getUserFirstNameInitial => "${firstName[0]}";
}
