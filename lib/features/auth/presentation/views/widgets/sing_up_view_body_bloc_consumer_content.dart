import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app_with_fire_base/core/utils/constants/custom_colors.dart';
import 'package:notes_app_with_fire_base/core/utils/constants/icons.dart';
import 'package:notes_app_with_fire_base/core/utils/constants/navigators.dart';
import 'package:notes_app_with_fire_base/core/utils/constants/styles.dart';
import 'package:notes_app_with_fire_base/core/utils/functions/screen_info.dart';
import 'package:notes_app_with_fire_base/core/utils/widgets/custom_btn.dart';
import 'package:notes_app_with_fire_base/core/utils/widgets/custom_text_btn.dart';
import 'package:notes_app_with_fire_base/core/utils/widgets/custom_text_form_field.dart';
import 'package:notes_app_with_fire_base/features/auth/domain/entities/auth_entity.dart';
import 'package:notes_app_with_fire_base/features/auth/presentation/maneger/sing_up_cubit/sing_up_cubit.dart';
import 'package:notes_app_with_fire_base/features/auth/presentation/views/sing_in_view.dart';

class SingUpViewBodyBlocConsumerContent extends StatefulWidget {
  const SingUpViewBodyBlocConsumerContent({super.key, required this.isLoading});
  final bool isLoading;

  @override
  State<SingUpViewBodyBlocConsumerContent> createState() =>
      _SingUpViewBodyBlocConsumerContentState();
}

class _SingUpViewBodyBlocConsumerContentState
    extends State<SingUpViewBodyBlocConsumerContent> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  String email = "";
  String password = "";
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(20),
        height: getheight(context),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    appIcon,
                    size: 80,
                  ),
                  Text(
                    "Welcome To \nSmallNotes App\nSing Up",
                    style: Styles.textStyle30,
                  ),
                ],
              ),
              Column(
                children: [
                  CustomTextFormField(
                      onSaved: (value) {
                        email = value!;
                      },
                      validator: (value) {
                        if (value.toString().isEmpty) {
                          return "This Field Is Required";
                        } else {
                          return null;
                        }
                      },
                      inputType: TextInputType.emailAddress,
                      innerText: "Your Email Address",
                      prefixIcon: Icons.email),
                  const SizedBox(
                    height: 15,
                  ),
                  CustomTextFormField(
                      onSaved: (value) {
                        password = value!;
                      },
                      validator: (value) {
                        if (value.toString().isEmpty) {
                          return "This Field Is Required";
                        } else {
                          return null;
                        }
                      },
                      inputType: TextInputType.visiblePassword,
                      innerText: "Your Password",
                      prefixIcon: Icons.password),
                  const SizedBox(
                    height: 15,
                  ),
                  const Divider(
                    color: customGrey,
                  ),
                  Row(
                    children: [
                      const Text("Do You Have An Account ? "),
                      CustomTextBtn(
                        text: "Sing in",
                        onPressed: () {
                          replaceTo(context, const SingInView());
                        },
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomBtn(
                    width: double.infinity,
                    innnerText: "Create And Go !",
                    onPressed: () async {
                      if (widget.isLoading == false) {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          await BlocProvider.of<SingUpCubit>(context).singUp(
                            user: AuthEntity(
                              emailAdress: email,
                              password: password,
                            ),
                          );
                        } else {}
                      } else {}
                    },
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
