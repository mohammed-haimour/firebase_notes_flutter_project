import 'package:notes_app_with_fire_base/core/entities/note_entity.dart';
import 'package:notes_app_with_fire_base/core/utils/constants/firebase_collictions.dart';

abstract class AddNoteRemoteDataSource {
  Future<NoteEntity> addNote(NoteEntity note);
}

class AddNoteRemoteDataSourceImpl extends AddNoteRemoteDataSource {
  @override
  Future<NoteEntity> addNote(NoteEntity note) async {
    await fireStoreNotesCollection.add({
      "title": note.noteTitle,
      "content": note.noteContent,
      "uid": note.uid,
    });
    return note;
  }
}
