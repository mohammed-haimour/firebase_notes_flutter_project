import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app_with_fire_base/features/add_note/data/data_source/add_note_remote_data_source.dart';
import 'package:notes_app_with_fire_base/features/add_note/data/repos/add_note_repo_impl.dart';
import 'package:notes_app_with_fire_base/features/add_note/presentation/manegar/add_note_cubit/add_note_cubit.dart';
import 'package:notes_app_with_fire_base/features/add_note/presentation/view/widgets/add_note_view_body_bloc_consumer.dart';

class AddNoteView extends StatelessWidget {
  const AddNoteView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          AddNoteCubit(AddNoteRepoImpl(AddNoteRemoteDataSourceImpl())),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Add Note"),
        ),
        body: const AddNoteViewBodyBlocConsumer(),
      ),
    );
  }
}
