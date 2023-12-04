import 'package:chat_app/repositories/auth/models/models.dart';

class UserPreferences {
  static UserModel? _userModel;

  static UserModel? get userModel => _userModel;

  static void setUserModel(UserModel userModel) {
    _userModel = userModel;
  }

  static void resetUserModel() {
    _userModel = null;
  }
}
