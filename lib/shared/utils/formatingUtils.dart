String formatDouble(double value) {
  if (value >= 1000000) {
    return '${(value / 1000000).toStringAsFixed(3)}M';
  }

  String formattedValue = value.toStringAsFixed(2); // Keep two decimal places
  formattedValue = formattedValue
      .replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match match) {
    return '${match[1]},';
  });

  return formattedValue;
}

String formatDate(DateTime date) {
  return '${date.year}-${_twoDigits(date.month)}-${_twoDigits(date.day)} ${_twoDigits(date.hour)}:${_twoDigits(date.minute)}';
}

String formatString(String inputString) {
  int maxLength = 15;
  if (inputString.length > maxLength) {
    return inputString.substring(0, maxLength - 3) + "...";
  } else {
    return inputString;
  }
}

String _twoDigits(int n) {
  if (n >= 10) {
    return '$n';
  }
  return '0$n';
}
