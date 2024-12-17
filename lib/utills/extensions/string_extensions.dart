extension StringExtensions on String {
  String getInitials() {
    if (isEmpty) {
      return "";
    }

    List<String> words = split(" ");
    String initials = "";

    for (String word in words) {
      if (word.isNotEmpty) {
        initials += word[0].toUpperCase();
      }
    }

    return initials;
  }

  bool isValidEmail() {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(this);
  }

  bool isValidPassword() {
    final passwordRegex = RegExp(
        r'^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])[0-9a-zA-Z!@#$%^&*()\-_=+{}|?>.<,:;~`’]{8,}$');
    return passwordRegex.hasMatch(this);
  }

  int parseToInt() {
    return int.parse(this);
  }

  double parseToDouble() {
    return double.parse(this);
  }
}
