import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';
import 'package:nodelabs_case/core/utils/padding/app_padding.dart';
import 'package:nodelabs_case/core/utils/sized_box/app_sized_box.dart';
import 'package:nodelabs_case/feature/register/cubit/register_cubit.dart';
import 'package:nodelabs_case/feature/register/cubit/register_state.dart';
import 'package:nodelabs_case/feature/register/view_model/register_view_model.dart';
import 'package:nodelabs_case/product/enum/social_media_enum.dart';
import 'package:nodelabs_case/product/generated/locale_keys.g.dart';
import 'package:nodelabs_case/product/widget/button/primary_button.dart';
import 'package:nodelabs_case/product/widget/container/social_media_container.dart';
import 'package:nodelabs_case/product/widget/text/text_widgets.dart';
import 'package:nodelabs_case/product/widget/text_field/auth/auth_text_field.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> with RegisterViewModel {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<RegisterCubit>(
      create: (context) => registerCubit,
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const AppPadding.horizontalXXXHigh(),
            child: SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight:
                      MediaQuery.of(context).size.height -
                      MediaQuery.of(context).padding.top -
                      MediaQuery.of(context).padding.bottom,
                ),
                child: IntrinsicHeight(
                  child: Form(
                    key: formKey,
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
                                LocaleKeys.register_welcome_title.tr(),
                              ),
                              PrimaryRegularNormalText(
                                LocaleKeys.register_welcome_subtitle.tr(),
                                maxLine: 3,
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                        const AppSizedBox.heightExtraHigh(),
                        const AppSizedBox.heightHigh(),
                        AuthTextField.nameSurname(
                          controller: nameSurnameController,
                        ),
                        const AppSizedBox.heightHigh(),
                        AuthTextField.email(controller: emailController),
                        const AppSizedBox.heightHigh(),
                        AuthTextField.password(controller: passwordController),
                        const AppSizedBox.heightHigh(),
                        AuthTextField.passwordConfirm(
                          controller: passwordConfirmController,
                        ),
                        const AppSizedBox.heightExtraHigh(),
                        const AppSizedBox.heightExtraLow(),
                        BlocBuilder<RegisterCubit, RegisterState>(
                          builder: (context, state) {
                            return Row(
                              children: [
                                Checkbox(
                                  value: state.isTermsAccepted,
                                  onChanged: (value) {
                                    registerCubit.toggleTermsAccepted();
                                  },
                                  materialTapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                  visualDensity: VisualDensity.compact,
                                  activeColor:
                                      context.general.colorScheme.onPrimary,
                                  checkColor:
                                      context.general.colorScheme.primary,
                                  side: BorderSide(
                                    color: context.general.colorScheme.onPrimary
                                        .withValues(alpha: 0.5),
                                    width: 1.5,
                                  ),
                                ),
                                const AppSizedBox.widthLow(),
                                Expanded(
                                  child: _RegisterTermsOfService(
                                    onTap: onTermsOfServiceTap,
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                        const AppSizedBox.heightExtraHigh(),
                        PrimaryButton(
                          onPressed: handleRegister,
                          text: LocaleKeys.register_register_button.tr(),
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
                                text: LocaleKeys.register_already_account.tr(),
                                style: context.general.textTheme.labelSmall
                                    ?.copyWith(
                                      color: context
                                          .general
                                          .colorScheme
                                          .onPrimary
                                          .withValues(alpha: 0.5),
                                    ),
                              ),
                              const TextSpan(text: '  '),
                              TextSpan(
                                text: LocaleKeys.register_login.tr(),
                                style: context.general.textTheme.labelSmall
                                    ?.copyWith(
                                      color:
                                          context.general.colorScheme.onPrimary,
                                    ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = onLoginTap,
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
      ),
    );
  }
}

final class _RegisterTermsOfService extends StatelessWidget {
  const _RegisterTermsOfService({required this.onTap});
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: LocaleKeys.register_terms_prefix.tr(),
            style: context.general.textTheme.labelSmall?.copyWith(
              color: context.general.colorScheme.onPrimary.withValues(
                alpha: 0.5,
              ),
            ),
          ),
          TextSpan(
            text: LocaleKeys.register_terms_accept.tr(),
            style: context.general.textTheme.labelSmall?.copyWith(
              color: context.general.colorScheme.onPrimary,
              decoration: TextDecoration.underline,
            ),
            recognizer: TapGestureRecognizer()..onTap = onTap,
          ),
          TextSpan(
            text: LocaleKeys.register_terms_suffix.tr(),
            style: context.general.textTheme.labelSmall?.copyWith(
              color: context.general.colorScheme.onPrimary.withValues(
                alpha: 0.5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
