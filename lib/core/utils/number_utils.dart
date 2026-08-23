abstract final class NumberUtils {
  static String formatPrice(double value) {
    return value.toStringAsFixed(2);
  }

  static String formatPercentage(double value) {
    return '${value.toStringAsFixed(2)}%';
  }
}