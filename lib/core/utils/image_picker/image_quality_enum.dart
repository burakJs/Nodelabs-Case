enum ImageQualityEnum {
  none(0),
  extraLow(20),
  low(40),
  medium(60),
  high(80),
  original(100);

  const ImageQualityEnum(this.value);
  final int value;
}
