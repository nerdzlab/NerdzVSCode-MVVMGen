extension PasswordValidateExtension on String {
  bool get isMinimumPasswordCharacters {
    return trim().length > 8;
  }

  bool get isContainsAtLeastOneNumber {
    RegExp numberRegExp = RegExp("(?=.*[0-9])");
    return numberRegExp.hasMatch(this);
  }

  bool get isContainsAtLeastOneSpecialSymbol {
    RegExp symbolRegExp = RegExp("(?=.*\\W)");
    return symbolRegExp.hasMatch(this);
  }
}
