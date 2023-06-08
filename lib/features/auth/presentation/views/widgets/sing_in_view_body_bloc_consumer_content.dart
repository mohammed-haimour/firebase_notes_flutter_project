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
import 'package:notes_app_with_fire_base/features/auth/presentation/maneger/sing_in_cubit/sing_in_cubit.dart';
import 'package:notes_app_with_fire_base/features/auth/presentation/views/sing_up_view.dart';

class SingInViewBodyBlocConsumerContent extends StatefulWidget {
  const SingInViewBodyBlocConsumerContent({super.key, this.isLoading = false});
  final bool isLoading;
  @override
  State<SingInViewBodyBlocConsumerContent> createState() =>
      _SingInViewBodyBlocConsumerContentState();
}

class _SingInViewBodyBlocConsumerContentState
    extends State<SingInViewBodyBlocConsumerContent> {
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
                    "Welcome To \nSmallNotes App \nSing in",
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
                      const Text("Don't Have An Account ? "),
                      CustomTextBtn(
                        text: "Creat It",
                        onPressed: () {
                          replaceTo(context, const SingUpView());
                        },
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomBtn(
                      width: double.infinity,
                      innnerText: widget.isLoading ? "Loading" : "Sing in",
                      onPressed: () async {
                        if (widget.isLoading == false) {
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();
                            await BlocProvider.of<SingInCubit>(context).singIn(
                              user: AuthEntity(
                                emailAdress: email,
                                password: password,
                              ),
                            );
                          } else {}
                        } else {}
                      })
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
