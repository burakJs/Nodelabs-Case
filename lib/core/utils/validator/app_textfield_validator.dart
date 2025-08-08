import 'package:easy_localization/easy_localization.dart';
import 'package:kartal/kartal.dart';
import 'package:nodelabs_case/product/generated/locale_keys.g.dart';

sealed class AppTextfieldValidator {
  String? validate(String? value);
}

final class EmailValidator extends AppTextfieldValidator {
  @override
  String? validate(String? value) {
    if (value == null) return LocaleKeys.validator_errors_email_empty.tr();
    if (value.isEmpty) return LocaleKeys.validator_errors_email_empty.tr();
    final isValidEmail = value.ext.isValidEmail;
    if (!isValidEmail) {
      return LocaleKeys.validator_errors_email_invalid.tr();
    }
    return null;
  }
}

final class PasswordValidator extends AppTextfieldValidator {
  @override
  String? validate(String? value) {
    final trimValue = value?.trim();
    if (trimValue == null) {
      return LocaleKeys.validator_errors_password_empty.tr();
    }
    if (trimValue.isEmpty) {
      return LocaleKeys.validator_errors_password_empty.tr();
    }
    if (trimValue.length < 6) {
      return LocaleKeys.validator_errors_password_length.tr();
    }
    return null;
  }
}

final class DefaultValidator extends AppTextfieldValidator {
  DefaultValidator({required this.fieldName, this.minLength});
  final String fieldName;
  final int? minLength;
  @override
  String? validate(String? value) {
    final trimValue = value?.trim();
    if (trimValue == null) {
      return LocaleKeys.validator_errors_general_empty.tr(
        namedArgs: {'fieldName': fieldName},
      );
    }
    if (trimValue.isEmpty) {
      return LocaleKeys.validator_errors_general_empty.tr(
        namedArgs: {'fieldName': fieldName},
      );
    }
    if (minLength != null && trimValue.length < minLength!) {
      return LocaleKeys.validator_errors_general_length.tr(
        namedArgs: {'fieldName': fieldName, 'minLength': minLength!.toString()},
      );
    }
    return null;
  }
}
