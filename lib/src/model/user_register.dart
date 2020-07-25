class UserRegister {
  String lastName;
  String firstName;
  String sex;
  String country;
  String email;
  String phone;
  String password;
  String confirmPassword;
  String refferalId;

  UserRegister();

  bool isMatchConfirmPassword(String confirmPassword) {
    return password == confirmPassword;
  }

  Map toMap() {
    return {
      'first_name': firstName,
      'last_name': lastName,
      'sex': sex,
      'phone': phone,
      'email': email,
      'country_code': country,
      'password': password,
      'confirm_password': confirmPassword,
      'ref_id': refferalId
    };
  }
}
