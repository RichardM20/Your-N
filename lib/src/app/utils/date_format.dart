import 'package:intl/intl.dart';

String dateFormat(DateTime date) {
  final formatter = DateFormat('dd MMMM y, HH:mm:ss', 'es');
  return formatter.format(date);
}
