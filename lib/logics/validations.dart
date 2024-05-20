class AllValidations{
  static bool isValidEmail(String email) {
  final RegExp emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$'); // This regex pattern may not cover all edge cases, but it's a basic one.
  return emailRegex.hasMatch(email);
}
  static bool isvalid(String getdatsa) {
 final RegExp passwordRegex = RegExp(r'^.{3,}$'); // This regex pattern may not cover all edge cases, but it's a basic one.
  return passwordRegex.hasMatch(getdatsa);
}
  static bool checkNumber(String number) {
final RegExp indianPhoneNumberRegex = RegExp(r'^(\+91[\s-]?)?[0]?[6789]\d{9}$');// This regex pattern may not cover all edge cases, but it's a basic one.
  return indianPhoneNumberRegex.hasMatch(number);
}

}