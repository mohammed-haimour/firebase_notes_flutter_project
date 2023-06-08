import 'package:dartz/dartz.dart';
import 'package:notes_app_with_fire_base/core/entities/note_entity.dart';
import 'package:notes_app_with_fire_base/core/errors/failure.dart';
import 'package:notes_app_with_fire_base/features/update_note/data/data_source/update_note_remote_data_source.dart';
import 'package:notes_app_with_fire_base/features/update_note/domain/repos/update_note_repo.dart';

class UpdateNoteRepoImpl extends UpdateNoteRepo {
  final UpdateNoteRemoteDataSource updateNoteRemoteDataSource;

  UpdateNoteRepoImpl(this.updateNoteRemoteDataSource);

  @override
  Future<Either<Failure, NoteEntity>> updateNote(
      String docId, NoteEntity note) async {
    try {
      return right(await updateNoteRemoteDataSource.updateNote(docId, note));
    } catch (e) {
      return left(CloudFireStoreFailure(e.toString()));
    }
  }
}
