import 'package:flutter/material.dart';
import 'package:notes_app_with_fire_base/features/notes/presentation/views/widgets/notes_stream_builder.dart';

class NotesViewBody extends StatelessWidget {
  const NotesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(10.0),
      child: NotesStreamBuilder(),
    );
  }
}
