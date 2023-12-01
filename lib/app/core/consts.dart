import 'package:intl/intl.dart';

/// \n limite de tela pequena
const int mobileZize = 801;


bool isNumeric(String num) {
  final numericRegex = RegExp(r'^-?(([0-9]*)|(([0-9]*)\.([0-9]*)))$');
  return numericRegex.hasMatch(num);
}

String isValidEmail(String email) {
  final emailRegExp = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  return emailRegExp.hasMatch(email) ? "" : "Email Invalido";
}

bool isValidNif(String email) {
  final emailRegExp = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  return emailRegExp.hasMatch(email);
}

final formateDate = DateFormat('yyyy-MM-dd hh:mm');
final formateDate2 = DateFormat('yyyy-MM-dd');
var numberFormat = NumberFormat.currency(locale: 'eu', symbol: 'AOA');