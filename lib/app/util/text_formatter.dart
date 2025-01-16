import 'package:intl/intl.dart';

String numToStringRupiah({required num data}) {
  return NumberFormat.currency(
    symbol: "",
    locale: "id_ID",
    decimalDigits: 0,
  ).format(data);
}
