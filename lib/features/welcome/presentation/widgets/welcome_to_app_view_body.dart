import 'package:flutter/material.dart';
import 'package:notes_app_with_fire_base/core/utils/constants/icons.dart';
import 'package:notes_app_with_fire_base/core/utils/constants/navigators.dart';
import 'package:notes_app_with_fire_base/core/utils/widgets/custom_btn.dart';
import 'package:notes_app_with_fire_base/features/auth/presentation/views/sing_in_view.dart';
import 'package:notes_app_with_fire_base/features/auth/presentation/views/sing_up_view.dart';

class WelcomeToAppViewBody extends StatelessWidget {
  const WelcomeToAppViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(30),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(
                appIcon,
                size: 100,
              ),
              const Text("Welcome To SmallNotes App"),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: CustomBtn(
                      innnerText: "Sing In",
                      onPressed: () {
                        goTo(context, const SingInView());
                      },
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                      child: CustomBtn(
                    innnerText: "Sing Up",
                    onPressed: () {
                        goTo(context, const SingUpView());
                    },
                  )),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
