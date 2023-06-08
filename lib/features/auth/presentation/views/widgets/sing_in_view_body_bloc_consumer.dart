import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app_with_fire_base/core/utils/constants/navigators.dart';
import 'package:notes_app_with_fire_base/core/utils/functions/custom_snackbar.dart';
import 'package:notes_app_with_fire_base/features/auth/presentation/maneger/sing_in_cubit/sing_in_cubit.dart';
import 'package:notes_app_with_fire_base/features/auth/presentation/views/widgets/sing_in_view_body_bloc_consumer_content.dart';
import 'package:notes_app_with_fire_base/features/notes/presentation/views/notes_view.dart';

class SingInViewBodyBlocConsumer extends StatelessWidget {
  const SingInViewBodyBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SingInCubit, SingInState>(
      listener: ((context, state) {
        if (state is SingInFailure) {
          customSnackBar(
            context,
            msg: state.err,
          );
        }
        if (state is SingInSuccess) {
          replaceTo(context, const NotesView());
        }
      }),
      builder: (context, state) {
        return SingInViewBodyBlocConsumerContent(
          isLoading: (state is SingInLoading ? true : false),
        );
      },
    );
  }
}
