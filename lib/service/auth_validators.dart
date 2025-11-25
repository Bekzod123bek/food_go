class AuthValidators {
  static String? emailValidator(String? content) {
    if (content == null || content.isEmpty) {
      return "malumot kiriting";
    } else if (RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
        ).hasMatch(content) ==
        false) {
      return 'email kiriting[@gmail.com]';
    }
    return null;
  }
  static String? passwordValidator(String? content) {
    if (content == null || content.isEmpty) {
      return "pasword  kiriting";
    } else if (content.length<8) {
      return 'parol kamida 8 ta bo\'lishi kerak' ;
    }
    return null;
  }
}
