import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app_with_fire_base/core/entities/note_entity.dart';
import 'package:notes_app_with_fire_base/features/update_note/data/repos/update_note_repo_impl.dart';

part 'update_note_state.dart';

class UpdateNoteCubit extends Cubit<UpdateNoteState> {
  UpdateNoteCubit(this.updateNoteRepoImpl) : super(UpdateNoteInitial());

  final UpdateNoteRepoImpl updateNoteRepoImpl;

  Future<void> updateNote(
      {required String docId, required NoteEntity note}) async {
    emit(UpdateNoteLoading());
    var result = await updateNoteRepoImpl.updateNote(docId, note);
    result.fold((err) {
      emit(UpdateNoteFailure(err.msg));
    }, (note) {
      emit(UpdateNoteSuccess());
    });
  }
}
