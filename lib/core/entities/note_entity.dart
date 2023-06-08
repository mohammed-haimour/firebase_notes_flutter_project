class NoteEntity {
  final String noteTitle;
  final String noteContent;
  final dynamic uid;

  NoteEntity({required this.noteTitle, required this.noteContent,required this.uid, });

  factory NoteEntity.fromJson(dynamic jsonData) {
    return NoteEntity(
      noteTitle: jsonData['title'],
      noteContent: jsonData['content'],
      uid: jsonData['uid'],
    );
  }
}
