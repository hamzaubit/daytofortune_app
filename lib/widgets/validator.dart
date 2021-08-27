class Validator {
  static String validateEmail(String value) {
    //Pattern pattern = r'[^\@]+\@[a-zA-Z0-9]+(\.[a-zA-Z0-9]+)+';
    RegExp regex = new RegExp(r'[^\@]+\@[a-zA-Z0-9]+(\.[a-zA-Z0-9]+)+');
    if (!regex.hasMatch(value))
      return 'Please enter a valid email address.';
    else
      return "";
  }

  static String validatePassword(String value) {
    //Pattern pattern = r'^((?=.*[A-Z])(?=.*\W).{8,13})$';
    RegExp regex = new RegExp(r'^((?=.*[A-Z])(?=.*\W).{8,13})$');
    if (!regex.hasMatch(value))
      return 'Password length must be between 8 and 13\n and must contain 1 Special Character and 1 number';
    else
      return "";
  }

  static String validateConfirmPassword(String value, String previousValue) {
    if (value != previousValue)
      return 'Password does not match';
    else
      return "";
  }

  static String validateName(String value) {
    //Pattern pattern = r"^[a-zA-Z]+(([',. -][a-zA-Z ])?[a-zA-Z]*)*$";
    RegExp regex = new RegExp(r"^[a-zA-Z]+(([',. -][a-zA-Z ])?[a-zA-Z]*)*$");
    if (!regex.hasMatch(value))
      return 'Please enter a valid name.';
    else
      return "";
  }

  static String validateNumber(String value) {
    //Pattern pattern = r'^(?:[+0]9)?[0-9]{10}$';
    RegExp regex = new RegExp(r'^(?:[+0]9)?[0-9]{10}$');
    if (!regex.hasMatch(value))
      return '';
    else
      return "";
  }

  static String validateCVV(String value) {
    if (value.length != 3)
      return 'Please enter a valid CVV.';
    else
      return "";
  }

  static String validateCard(String value) {
    //Pattern pattern = r'^(?:4[0-9]{12}(?:[0-9]{3})?|[25][1-7][0-9]{14}|6(?:011|5[0-9][0-9])[0-9]{12}|3[47][0-9]{13}|3(?:0[0-5]|[68][0-9])[0-9]{11}|(?:2131|1800|35\d{3})\d{11})$';
    RegExp regex = new RegExp(r'^(?:4[0-9]{12}(?:[0-9]{3})?|[25][1-7][0-9]{14}|6(?:011|5[0-9][0-9])[0-9]{12}|3[47][0-9]{13}|3(?:0[0-5]|[68][0-9])[0-9]{11}|(?:2131|1800|35\d{3})\d{11})$');
    if (!regex.hasMatch(value))
      return 'Invalid Card format.';
    else
      return "";
  }
  //^(0[1-9]|1[0-2])\/([0-9]{2})$

  static String validateCardExpiryDate(String value) {
    //Pattern pattern = r'^(0[1-9]|1[0-2])\/([0-9]{2})$';
    RegExp regex = new RegExp(r'^(0[1-9]|1[0-2])\/([0-9]{2})$');
    if (!regex.hasMatch(value))
      return 'Invalid Date format. Valid format is MM/YY';
    else
      return "";
  }
  /*static String validateAddress(String value){
    if(value.isEmpty){
      return "Please enter your address";
    }
    else{
      null;
    }
  }*/
  static String validateAddress(String value) {
    //Pattern pattern = r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]";
    RegExp regex = new RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]");
    if (!regex.hasMatch(value))
      return 'Please enter your address';
    else
      return "";
  }
  static String validateAge(String value){
    String pattern = r'(^[0-9]*$)';
    RegExp regExp = new RegExp(pattern);
    if (value.length == 0){
      return "Age is required.";
    } else if (!regExp.hasMatch(value)){
      return "Age cannot contain characters other than numbers.";
    }
    else{
      return "";
    }
  }
  static String validateForNotEmpty(String value) {
    //Pattern pattern = r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]";
    RegExp regex = new RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]");
    if (!regex.hasMatch(value))
      return 'Please enter your bio status';
    else
      return "";
  }
}