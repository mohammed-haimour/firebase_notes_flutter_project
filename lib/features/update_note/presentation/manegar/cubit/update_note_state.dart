part of 'update_note_cubit.dart';

@immutable
abstract class UpdateNoteState {}

class UpdateNoteInitial extends UpdateNoteState {}

class UpdateNoteLoading extends UpdateNoteState {}

class UpdateNoteSuccess extends UpdateNoteState {}

class UpdateNoteFailure extends UpdateNoteState {
  final String err;
  UpdateNoteFailure(this.err);
}
