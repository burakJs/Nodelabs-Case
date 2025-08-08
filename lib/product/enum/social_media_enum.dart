import 'package:nodelabs_case/product/generated/assets.gen.dart';

enum SocialMediaEnum {
  google,
  apple,
  facebook;

  const SocialMediaEnum();

  SvgGenImage get icon => switch (this) {
    google => Assets.svg.google,
    apple => Assets.svg.apple,
    facebook => Assets.svg.facebook,
  };
}
