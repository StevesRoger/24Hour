import 'base_entity.dart';

class User extends BaseEntity {
  String username = 'N/A';
  String token = '';
  dynamic total = 0.0;
  dynamic deposit = 0.0;
  dynamic cash = 0.0;
  dynamic registerPoint = 0.0;
  dynamic availableEarning = 0.0;
  String package = 'N/A';

  User();

  User.login(this.username, this.token);

  void walletFromMap(Map data) {
    total = data['balance'] ?? 0.0;
    deposit = data['deposit'] ?? 0.0;
    cash = data['cash_balance'] ?? 0.0;
    registerPoint = data['register_point'] ?? 0.0;
    var package = data['active_package'];
    this.package = package == null ? 'N/A' : package['name'] ?? 'N/A';
    availableEarning = package == null ? 0.0 : package['available'] ?? 0.0;
  }

  bool isValid() {
    return token != null && token.isNotEmpty;
  }
}
