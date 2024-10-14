import 'package:intl/intl.dart';

String formatDateAPI(String dateStr) {
  // Parse the input date string
  DateTime parsedDate =
      DateFormat("yyyy-MM-dd HH:mm:ss.SSS").parse(dateStr, true);

  // Format the parsed date to the desired format
  String formattedDate =
      DateFormat("yyyy-MM-ddTHH:mm:ss.SSS'Z'").format(parsedDate.toUtc());

  return formattedDate;
}

String formatDate(String dateStr) {
  final dateTime = DateTime.parse(dateStr);
  return DateFormat('dd/MM/yyyy').format(dateTime);
}

String formatDateTime(String dateStr) {
  final dateTime = DateTime.parse(dateStr).add(Duration(hours: 7));
  return DateFormat('dd/MM/yyyy HH:mm').format(dateTime);
}

DateTime parseDate(String dateString) {
  final DateFormat formatter = DateFormat('dd/MM/yyyy');
  return formatter.parse(dateString);
}
