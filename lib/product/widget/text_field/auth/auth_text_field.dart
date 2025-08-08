import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:nodelabs_case/core/utils/border_radius/app_border_radius.dart';
import 'package:nodelabs_case/core/utils/duration/app_duration.dart';
import 'package:nodelabs_case/core/utils/padding/app_padding.dart';
import 'package:nodelabs_case/core/utils/validator/app_textfield_validator.dart';
import 'package:nodelabs_case/product/widget/text_field/auth/auth_text_field_type.dart';

final class AuthTextField extends StatefulWidget {
  const AuthTextField.nameSurname({super.key, required this.controller})
    : _type = AuthTextFieldType.nameSurname;

  const AuthTextField.email({super.key, required this.controller})
    : _type = AuthTextFieldType.email;

  const AuthTextField.password({super.key, required this.controller})
    : _type = AuthTextFieldType.password;

  const AuthTextField.passwordConfirm({super.key, required this.controller})
    : _type = AuthTextFieldType.passwordConfirm;

  final TextEditingController controller;
  final AuthTextFieldType _type;

  @override
  State<AuthTextField> createState() => AuthTextFieldState();
}

final class AuthTextFieldState extends State<AuthTextField> {
  AuthTextFieldType get type => widget._type;
  bool isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      validator: type.validator.validate,
      obscureText: type.isPassword && !isPasswordVisible,
      style: context.general.textTheme.labelMedium?.copyWith(
        color: context.general.colorScheme.onPrimary,
      ),
      keyboardType: type.keyboardType,
      decoration: InputDecoration(
        contentPadding: AppPadding.allXXHigh() - AppPadding.verticalLow(),
        hintText: type.title,
        hintStyle: context.general.textTheme.labelSmall?.copyWith(
          color: context.general.colorScheme.onPrimary,
        ),
        prefixIconConstraints: const BoxConstraints(
          minWidth: 24,
          minHeight: 24,
        ),
        prefixIcon: Padding(
          padding: const AppPadding.leftXXHigh() + AppPadding.rightHigh(),
          child: SizedBox(
            width: 18,
            height: 18,
            child: type.icon.svg(fit: BoxFit.contain, width: 18, height: 18),
          ),
        ),
        suffixIcon: type.isPassword
            ? Padding(
                padding: const AppPadding.rightXXHigh() + AppPadding.leftLow(),
                child: _AuthTextFieldSuffixIcon(
                  isPasswordVisible: isPasswordVisible,
                  onPressed: _onPasswordVisibleTap,
                ),
              )
            : null,
        filled: true,
        fillColor: context.general.colorScheme.onPrimary.withValues(alpha: 0.1),
        border: OutlineInputBorder(
          borderRadius:
              AppBorderRadius.allVeryLarge() + AppBorderRadius.allLow(),
          borderSide: BorderSide(
            color: context.general.colorScheme.onPrimary.withValues(alpha: 0.2),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius:
              AppBorderRadius.allVeryLarge() + AppBorderRadius.allLow(),
          borderSide: BorderSide(
            color: context.general.colorScheme.onPrimary.withValues(alpha: 0.2),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius:
              AppBorderRadius.allVeryLarge() + AppBorderRadius.allLow(),
          borderSide: BorderSide(
            width: 2,
            color: context.general.colorScheme.onPrimary.withValues(alpha: 0.5),
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius:
              AppBorderRadius.allVeryLarge() + AppBorderRadius.allLow(),
          borderSide: BorderSide(color: context.general.colorScheme.error),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius:
              AppBorderRadius.allVeryLarge() + AppBorderRadius.allLow(),
          borderSide: BorderSide(
            width: 2,
            color: context.general.colorScheme.error,
          ),
        ),
      ),
    );
  }

  void _onPasswordVisibleTap() {
    isPasswordVisible = !isPasswordVisible;
    setState(() {});
  }
}

final class _AuthTextFieldSuffixIcon extends StatelessWidget {
  const _AuthTextFieldSuffixIcon({
    required this.isPasswordVisible,
    required this.onPressed,
  });

  final bool isPasswordVisible;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: AnimatedSwitcher(
        duration: AppDuration.low(),
        child: Icon(
          key: ValueKey(isPasswordVisible),
          isPasswordVisible
              ? Icons.visibility_outlined
              : Icons.visibility_off_outlined,
          color: context.general.colorScheme.onPrimary.withValues(alpha: 0.8),
        ),
      ),
    );
  }
}
