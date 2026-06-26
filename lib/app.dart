import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'core/router/app_router.dart';
import 'shared/theme/theme.dart';

class PatrimonIAApp extends ConsumerWidget {
  const PatrimonIAApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(appRouterProvider);

    final textTheme = GoogleFonts.getTextTheme('Playfair Display', ThemeData.light().textTheme);

    return MaterialApp.router(
      title: 'PatrimonIA',
      debugShowCheckedModeBanner: false,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      theme: PatrimoniaTheme.light.copyWith(
        textTheme: GoogleFonts.getTextTheme('DM Sans', ThemeData.light().textTheme).copyWith(
          headlineLarge: textTheme.headlineLarge,
          headlineMedium: textTheme.headlineMedium,
          titleLarge: textTheme.titleLarge,
        ),
      ),
      routerConfig: router,
    );
  }
}
