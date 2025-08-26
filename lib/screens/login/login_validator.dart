class LoginValidator
{
  static bool isValidEmail(String email) {
    final regex = RegExp(r'^[a-z][a-z0-9]*@gmail\.com$');
    return regex.hasMatch(email);
  }

  static bool isValidPassword(String password) {
    if (password.length < 8) return false;
    final regex = RegExp(r'^(?=.*[a-zA-Z])(?=.*\d)(?=.*[@#$%^&+=!]).{8,}$');
    return regex.hasMatch(password);
  }
}