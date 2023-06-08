import 'package:cloud_firestore/cloud_firestore.dart';

final CollectionReference<Map<String, dynamic>> fireStoreNotesCollection =
    FirebaseFirestore.instance.collection("notes");
