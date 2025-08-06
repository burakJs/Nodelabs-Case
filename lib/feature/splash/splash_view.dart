import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';
import 'package:nodelabs_case/feature/splash/cubit/splash_cubit.dart';
import 'package:nodelabs_case/feature/splash/view_model/splash_view_model.dart';
import 'package:nodelabs_case/product/generated/assets.gen.dart';

final class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

final class _SplashViewState extends State<SplashView> with SplashViewModel {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<SplashCubit>(
      create: (context) => splashCubit,
      child: Scaffold(
        body: Assets.png.sinFlixSplash.image(
          fit: BoxFit.cover,
          width: context.sized.width,
          height: context.sized.height,
        ),
      ),
    );
  }
}
