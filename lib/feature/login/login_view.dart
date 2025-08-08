import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';
import 'package:nodelabs_case/core/utils/padding/app_padding.dart';
import 'package:nodelabs_case/core/utils/sized_box/app_sized_box.dart';
import 'package:nodelabs_case/feature/login/cubit/login_cubit.dart';
import 'package:nodelabs_case/feature/login/view_model/login_view_model.dart';
import 'package:nodelabs_case/product/enum/social_media_enum.dart';
import 'package:nodelabs_case/product/generated/locale_keys.g.dart';
import 'package:nodelabs_case/product/widget/button/primary_button.dart';
import 'package:nodelabs_case/product/widget/container/social_media_container.dart';
import 'package:nodelabs_case/product/widget/text/text_widgets.dart';
import 'package:nodelabs_case/product/widget/text_field/auth/auth_text_field.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> with LoginViewModel {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginCubit>(
      create: (context) => loginCubit,
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const AppPadding.horizontalXXXHigh(),
            child: SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight:
                      context.sized.height -
                      MediaQuery.paddingOf(context).top -
                      MediaQuery.paddingOf(context).bottom,
                ),
                child: IntrinsicHeight(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: AppPadding.horizontalXXXHigh(),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            PrimarySemiBoldMediumText(
                              LocaleKeys.login_welcome_title.tr(),
                            ),
                            PrimaryRegularNormalText(
                              LocaleKeys.login_welcome_subtitle.tr(),
                              maxLine: 3,
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                      const AppSizedBox.heightExtraHigh(),
                      const AppSizedBox.heightHigh(),
                      AuthTextField.email(controller: emailController),
                      const AppSizedBox.heightHigh(),
                      AuthTextField.password(controller: passwordController),
                      const AppSizedBox.heightExtraHigh(),
                      const AppSizedBox.heightExtraLow(),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: TextButton(
                          onPressed: () {},
                          child: PrimaryRegularVerySmallText(
                            LocaleKeys.login_forgot_password.tr(),
                            isUnderline: true,
                          ),
                        ),
                      ),
                      const AppSizedBox.heightExtraHigh(),
                      PrimaryButton(
                        onPressed: handleLogin,
                        text: LocaleKeys.login_login_button.tr(),
                      ),
                      const AppSizedBox.heightExtraHigh(),
                      const AppSizedBox.heightMedium(),
                      Row(
                        spacing: 8,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: SocialMediaEnum.values
                            .map((e) => SocialMediaContainer(socialMedia: e))
                            .toList(),
                      ),
                      const AppSizedBox.heightExtraHigh(),
                      const AppSizedBox.heightLow(),
                      RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: LocaleKeys.login_no_account.tr(),
                              style: context.general.textTheme.labelSmall
                                  ?.copyWith(
                                    color: context.general.colorScheme.onPrimary
                                        .withValues(alpha: 0.5),
                                  ),
                            ),
                            const TextSpan(text: '  '),
                            TextSpan(
                              text: LocaleKeys.login_register.tr(),
                              style: context.general.textTheme.labelSmall
                                  ?.copyWith(
                                    color:
                                        context.general.colorScheme.onPrimary,
                                  ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = onRegisterTap,
                            ),
                          ],
                        ),
                      ),
                      const AppSizedBox.heightExtraHigh(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
