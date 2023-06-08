import 'package:notes_app_with_fire_base/core/entities/note_entity.dart';
import 'package:notes_app_with_fire_base/core/utils/constants/firebase_collictions.dart';

abstract class UpdateNoteRemoteDataSource {
  Future<NoteEntity> updateNote(String docId, NoteEntity note);
}

class UpdateNoteRemoteDataSourceImpl extends UpdateNoteRemoteDataSource {
  @override
  Future<NoteEntity> updateNote(String docId, NoteEntity note) async {
    await fireStoreNotesCollection.doc(docId).set({
      "title": note.noteTitle,
      "content": note.noteContent,
      "uid": note.uid,
    });
    return note;
  }
}
