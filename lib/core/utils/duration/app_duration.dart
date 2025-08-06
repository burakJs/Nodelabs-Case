final class AppDuration extends Duration {
  /// 100 milliseconds
  const AppDuration.xLow() : super(milliseconds: 100);

  /// 200 milliseconds
  const AppDuration.low() : super(milliseconds: 200);

  /// 500 milliseconds
  const AppDuration.medium() : super(milliseconds: 500);

  /// 1000 milliseconds
  const AppDuration.high() : super(seconds: 1);

  /// 2000 milliseconds
  const AppDuration.xHigh() : super(seconds: 2);
}
