import 'package:flutter/material.dart';
import 'package:notes_app_with_fire_base/core/utils/constants/navigators.dart';
import 'package:notes_app_with_fire_base/core/utils/widgets/custom_icon_btn.dart';
import 'package:notes_app_with_fire_base/features/add_note/presentation/view/add_note_view.dart';
import 'package:notes_app_with_fire_base/features/notes/presentation/views/widgets/notes_view_body.dart';

class NotesView extends StatelessWidget {
  const NotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Small Notes"),
        actions: [
          CustomIconBtn(
            icon: Icons.add,
            onPressed: () {
              goTo(context, const AddNoteView());
            },
          )
        ],
      ),
      body: const NotesViewBody(),
    );
  }
}
