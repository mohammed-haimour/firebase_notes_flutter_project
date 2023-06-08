import 'package:dartz/dartz.dart';
import 'package:notes_app_with_fire_base/core/entities/note_entity.dart';
import 'package:notes_app_with_fire_base/core/errors/failure.dart';
import 'package:notes_app_with_fire_base/features/add_note/data/data_source/add_note_remote_data_source.dart';
import 'package:notes_app_with_fire_base/features/add_note/domain/repos/add_note_repo.dart';

class AddNoteRepoImpl extends AddNoteRepo {
  final AddNoteRemoteDataSource addNoteRemoteDataSource;

  AddNoteRepoImpl(this.addNoteRemoteDataSource);

  @override
  Future<Either<Failure, NoteEntity>> addNote(NoteEntity note) async {
    try {
      return right(await addNoteRemoteDataSource.addNote(note));
    } catch (e) {
      return left(CloudFireStoreFailure(e.toString()));
    }
  }
}
