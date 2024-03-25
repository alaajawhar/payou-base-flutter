class CustomDateUtils {
  static DateTime convertToDateTime(int milliseconds) {
    return DateTime.fromMillisecondsSinceEpoch(milliseconds);
  }

  static String formatDateTime(DateTime dateTime) {
    final year = dateTime.year.toString();
    // Pad month and day with zero if they are less than 10
    final month = dateTime.month.toString().padLeft(2, '0');
    final day = dateTime.day.toString().padLeft(2, '0');

    return "$year-$month-$day";
  }
}
