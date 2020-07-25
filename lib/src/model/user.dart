import 'base_entity.dart';

class User extends BaseEntity {
  String username = 'N/A';
  String password = '';
  String token = '';
  dynamic total = 0.0;
  dynamic deposit = 0.0;
  dynamic cash = 0.0;
  dynamic registerPoint = 0.0;
  dynamic availableEarning = 0.0;
  String package = 'N/A';

  User();

  User.fromUsernameToken(this.username, this.token);

  void infoFromMap(Map data) {
    total = data['balance'] ?? 0.0;
    deposit = data['deposit'] ?? 0.0;
    cash = data['cash_balance'] ?? 0.0;
    registerPoint = data['register_point'] ?? 0.0;
    var activePackage = data['active_package'];
    if (activePackage != null) {
      package = activePackage['name'] ?? 'N/A';
      availableEarning = activePackage['available'] ?? 0.0;
    }
  }

  bool isValid() {
    return token != null && token.isNotEmpty;
  }

  @override
  String toString() {
    return 'User{username: $username, token: $token}';
  }
}
