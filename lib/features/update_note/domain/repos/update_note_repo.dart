import 'package:dartz/dartz.dart';
import 'package:notes_app_with_fire_base/core/entities/note_entity.dart';
import 'package:notes_app_with_fire_base/core/errors/failure.dart';

abstract class UpdateNoteRepo {
  Future<Either<Failure, NoteEntity>> updateNote(String docId , NoteEntity note);
}
