import 'item_select.dart';

class UserRegister {
  String lastName;
  String firstName;
  String sex;
  ItemSelect country;
  String email;
  String phone;
  String password;
  String confirmPassword;
  String refferalId;

  UserRegister();

  bool isMatchConfirmPassword() {
    return password == confirmPassword;
  }

  String userName() => firstName + lastName;

  Map toMap() {
    return {
      'first_name': firstName,
      'last_name': lastName,
      'sex': sex,
      'phone': country.value + " " + phone.substring(0, 1),
      'email': email,
      'country_code': country.label,
      'password': password,
      'confirm_password': confirmPassword,
      'ref_id': refferalId
    };
  }
}
