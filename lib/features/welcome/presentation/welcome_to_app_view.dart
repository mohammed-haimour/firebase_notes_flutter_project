import 'package:flutter/material.dart';
import 'package:notes_app_with_fire_base/features/welcome/presentation/widgets/welcome_to_app_view_body.dart';

class WelcomeToAppView extends StatelessWidget {
  const WelcomeToAppView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: WelcomeToAppViewBody(),
    );
  }
}