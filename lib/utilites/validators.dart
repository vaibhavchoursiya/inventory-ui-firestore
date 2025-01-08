class Validators {
  static String? emptyValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "field is required";
    }
    return null;
  }

  static String? phoneNumberValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "field is required";
    } else if (value.startsWith(" ")) {
      return "Remove white space for staring";
    } else if (!RegExp(r'^[0-9]{10}$').hasMatch(value)) {
      return "Enter valid phone no";
    }
    return null;
  }
}
