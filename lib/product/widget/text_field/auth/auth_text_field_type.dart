import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:nodelabs_case/core/utils/validator/app_textfield_validator.dart';
import 'package:nodelabs_case/product/generated/assets.gen.dart';
import 'package:nodelabs_case/product/generated/locale_keys.g.dart';

enum AuthTextFieldType {
  nameSurname,
  email,
  password,
  passwordConfirm;

  const AuthTextFieldType();

  String get title => switch (this) {
    nameSurname => LocaleKeys.auth_field_name_surname.tr(),
    email => LocaleKeys.auth_field_email.tr(),
    password => LocaleKeys.auth_field_password.tr(),
    passwordConfirm => LocaleKeys.auth_field_password_confirm.tr(),
  };

  SvgGenImage get icon => switch (this) {
    nameSurname => Assets.svg.name,
    email => Assets.svg.email,
    password => Assets.svg.password,
    passwordConfirm => Assets.svg.password,
  };

  AppTextfieldValidator get validator => switch (this) {
    nameSurname => DefaultValidator(fieldName: LocaleKeys.auth_field_name_surname.tr(), minLength: 3),
    email => EmailValidator(),
    password => PasswordValidator(),
    passwordConfirm => PasswordValidator(),
  };

  TextInputType get keyboardType => switch (this) {
    nameSurname => TextInputType.name,
    email => TextInputType.emailAddress,
    password => TextInputType.visiblePassword,
    passwordConfirm => TextInputType.visiblePassword,
  };

  bool get isPassword => this == password || this == passwordConfirm;
}
