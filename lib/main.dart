import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:notes_app_with_fire_base/core/utils/constants/themes.dart';
import 'package:notes_app_with_fire_base/features/notes/presentation/views/notes_view.dart';
import 'package:notes_app_with_fire_base/features/welcome/presentation/welcome_to_app_view.dart';
import 'firebase_options.dart';

bool? isSingin;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  if (FirebaseAuth.instance.currentUser == null) {
    isSingin = false;
  } else {
    isSingin = true;
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightTheme(),
      darkTheme: darkTheme(),
      themeMode: ThemeMode.dark,
      home: (isSingin ?? false) ? const NotesView() : const WelcomeToAppView(),
    );
  }
}
