import 'package:intl/intl.dart';

String dateFormat(String dateChange) {
  var date = DateFormat('MM-dd-yyyy hh:mm').format(DateTime.parse(dateChange));
  return date;
}

String dateFormatWithoutTime(String dateChange) {
  var date = DateFormat('MM-dd-yyyy').format(DateTime.parse(dateChange));
  return date;
}
