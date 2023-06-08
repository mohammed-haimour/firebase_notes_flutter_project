import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app_with_fire_base/core/utils/constants/navigators.dart';
import 'package:notes_app_with_fire_base/core/utils/functions/custom_snackbar.dart';
import 'package:notes_app_with_fire_base/features/auth/presentation/maneger/sing_up_cubit/sing_up_cubit.dart';
import 'package:notes_app_with_fire_base/features/auth/presentation/views/widgets/sing_up_view_body_bloc_consumer_content.dart';
import 'package:notes_app_with_fire_base/features/notes/presentation/views/notes_view.dart';

class SingUpViewBodyBlocConsumer extends StatelessWidget {
  const SingUpViewBodyBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SingUpCubit, SingUpState>(
      listener: ((context, state) {
        if (state is SingUpFailure) {
          customSnackBar(
            context,
            msg: state.err,
          );
        }
        if (state is SingUpSuccess) {
          replaceTo(context, const NotesView());
        }
      }),
      builder: (context, state) {
        return SingUpViewBodyBlocConsumerContent(
          isLoading: (state is SingUpLaoding ? true : false),
        );
      },
    );
  }
}
