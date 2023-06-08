import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app_with_fire_base/core/entities/note_entity.dart';
import 'package:notes_app_with_fire_base/features/add_note/data/repos/add_note_repo_impl.dart';

part 'add_note_state.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit(this.addNoteRepoImpl) : super(AddNoteInitial());
  final AddNoteRepoImpl addNoteRepoImpl;

  Future<void> addNote({required NoteEntity note}) async {
    emit(AddNoteLoading());
    var result = await addNoteRepoImpl.addNote(note);
    result.fold((err) {
      emit(AddNoteFailure(err.msg));
    }, (note) {
      emit(AddNoteSuccess());
    });
  }
}
