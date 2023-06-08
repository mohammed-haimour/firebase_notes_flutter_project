import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app_with_fire_base/core/entities/note_entity.dart';
import 'package:notes_app_with_fire_base/core/utils/constants/navigators.dart';
import 'package:notes_app_with_fire_base/features/notes/presentation/views/notes_view.dart';
import 'package:notes_app_with_fire_base/features/update_note/presentation/manegar/cubit/update_note_cubit.dart';
import 'package:notes_app_with_fire_base/features/update_note/presentation/view/widgets/update_note_view_body_bloc_consumer_content.dart';

class UpdateNoteViewBodyBlocConsumer extends StatelessWidget {
  const UpdateNoteViewBodyBlocConsumer(
      {super.key, required this.note, required this.docId});

  final NoteEntity note;
  final String docId;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UpdateNoteCubit, UpdateNoteState>(
      listener: (context, state) {
        if (state is UpdateNoteSuccess) {
          replaceTo(context, const NotesView());
        }
      },
      builder: (context, state) {
        return UpdateNoteViewBodyBlocConsumerContent(
          docId: docId,
          isLoading: false,
          note: note,
        );
      },
    );
  }
}
