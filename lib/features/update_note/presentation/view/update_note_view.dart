import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app_with_fire_base/core/entities/note_entity.dart';
import 'package:notes_app_with_fire_base/features/update_note/data/data_source/update_note_remote_data_source.dart';
import 'package:notes_app_with_fire_base/features/update_note/data/repos/update_note_repo_impl.dart';
import 'package:notes_app_with_fire_base/features/update_note/presentation/manegar/cubit/update_note_cubit.dart';
import 'package:notes_app_with_fire_base/features/update_note/presentation/view/widgets/update_note_view_body_bloc_consumer.dart';

class UpdateNoteView extends StatelessWidget {
  const UpdateNoteView({super.key, required this.note, required this.docId});

  final NoteEntity note;
  final String docId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          UpdateNoteCubit(UpdateNoteRepoImpl(UpdateNoteRemoteDataSourceImpl())),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Update Note ✍️"),
        ),
        body: UpdateNoteViewBodyBlocConsumer(
          docId: docId,
          note: note,
        ),
      ),
    );
  }
}
