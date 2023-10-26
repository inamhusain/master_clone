// Flutter imports:
import 'package:flutter/material.dart';
// Package imports:
import 'package:master_utility/master_utility.dart';
import 'package:provider/provider.dart';
import 'package:{{cookiecutter.repo_name}}/config/assets/colors.gen.dart';
import 'package:{{cookiecutter.repo_name}}/providers/splash_provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    Provider.of<SplashProvider>(context, listen: false).init(context);
    return Scaffold(
        backgroundColor: AppColors.white,
        body: AutoText(
          text: "Splash Screen",
        ));
  }
}
