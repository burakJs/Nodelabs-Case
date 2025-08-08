import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nodelabs_case/core/router/app_routes.dart';
import 'package:nodelabs_case/feature/profile/profile_view.dart';

mixin ProfileViewModel on State<ProfileView> {
  Future<void> onUploadPhotoTap() async {
    await context.push(AppRoutes.uploadPhoto.path);
  }
}
