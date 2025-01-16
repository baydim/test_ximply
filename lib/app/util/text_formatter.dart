import 'package:intl/intl.dart';

String numToStringRupiah({required num data}) {
  return NumberFormat.currency(
    symbol: "",
    locale: "id_ID",
    decimalDigits: 0,
  ).format(data);
}

/// alias name max 3
String aliasName({required String name}) {
  List<String> splitName = name.split(" ");
  String alias = "";
  for (var i = 0; i < splitName.length; i++) {
    if (i < 3) {
      alias += splitName[i].substring(0, 1).toUpperCase();
    }
  }
  return alias;
}
