import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app_with_fire_base/core/utils/constants/navigators.dart';
import 'package:notes_app_with_fire_base/core/utils/functions/custom_snackbar.dart';
import 'package:notes_app_with_fire_base/features/add_note/presentation/manegar/add_note_cubit/add_note_cubit.dart';
import 'package:notes_app_with_fire_base/features/add_note/presentation/view/widgets/add_note_view_body_bloc_consumer_content.dart';
import 'package:notes_app_with_fire_base/features/notes/presentation/views/notes_view.dart';

class AddNoteViewBodyBlocConsumer extends StatelessWidget {
  const AddNoteViewBodyBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddNoteCubit, AddNoteState>(
      listener: (context, state) {
        if (state is AddNoteFailure) {
          customSnackBar(context, msg: state.err);
        } else if (state is AddNoteSuccess) {
          replaceTo(context, const NotesView());
        }
      },
      builder: (context, state) {
        return AddNoteViewBodyBlocConsumerContent(
          isLoading: state is AddNoteLoading ? true : false,
        );
      },
    );
  }
}
