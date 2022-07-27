class Validator {
  Validator();

  textValidator(String value) {
    if (value == "") {
      return "empty?";
    }
  }

  idValidator(String value) {
    if (value.length < 8) {
      return 'must have at least 14 digits';
    }
  }
}
