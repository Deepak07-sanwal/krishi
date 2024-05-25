class CValidator {
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }

    // Regualer expression for email validation
    final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

    if (!emailRegExp.hasMatch(value)) {
      return 'Invalid email address';
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }

    if (value.length < 6) {
      return 'Password must contain at leat one uppercase letter';
    }

    //Check for uppercase letters
    if (!value.contains(RegExp(r'[A-Z]'))) {
      return 'Password must contain at leat one uppercase letter';
    }

    // Check for number
    if (!value.contains(RegExp(r'[0-9]'))) {
      return 'Password must contain at least one number';
    }

    // Check for special characters
    if (!value.contains(RegExp(r'[!@#$%^&*():{}|<>]'))) {
      return 'Password must contain at least one special character';
    }
    return null;
  }

  static String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Phone Number is required';
    }

    // Regualer expression for email validation
    final phoneNumberRegExp = RegExp(r'^\d{10}$');

    if (!phoneNumberRegExp.hasMatch(value)) {
      return 'Invalid phone number format : (10 digits required)';
    }
    return null;
  }
}
