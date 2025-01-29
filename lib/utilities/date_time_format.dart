import 'package:intl/intl.dart';

String formatLocalTime(String? utcTime) {

    if (utcTime == null || utcTime.isEmpty) return "";
    DateTime dateTime = DateTime.parse(utcTime).toLocal(); // Convert to local
    return DateFormat('yyyy-MM-dd HH:mm:ss').format(dateTime);

    // if (utcTime == null || utcTime.isEmpty) return "";
    //
    // // Fix format if missing 'T' and assume it's UTC
    // String fixedUtcTime = utcTime.replaceFirst(" ", "T") + "Z";
    //
    // DateTime dateTime = DateTime.parse(fixedUtcTime).toLocal();
    // String formatted = DateFormat('yyyy-MM-dd HH:mm:ss').format(dateTime);
    //
    // print("Converted Local Time: $formatted");
    // return formatted;

}
