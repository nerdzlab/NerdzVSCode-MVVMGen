import 'dart:math';

class Utils {
  static formattedTime({required int timeInSecond}) {
    int sec = timeInSecond % 60;
    int min = (timeInSecond / 60).floor();
    String minute = min.toString().length <= 1 ? "0$min" : "$min";
    String second = sec.toString().length <= 1 ? "0$sec" : "$sec";
    return "$minute : $second";
  }

  static bool _isToday(DateTime date) {
    final now = DateTime.now();

    return now.year == date.year &&
        now.month == date.month &&
        now.day == date.day;
  }

  static bool _isYesterday(DateTime date) {
    final now = DateTime.now();

    return now.year == date.year &&
        now.month == date.month &&
        now.day - 1 == date.day;
  }

  static String shortLink(String url) {
    return url.length > 80 ? url.substring(0, 80) : url;
  }

  static double randomSilentMicroValue() {
    Random random = Random();
    return random.nextDouble() / 10;
  }
}
