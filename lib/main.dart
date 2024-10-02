import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'home/Home_Screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyDl8DjXC-CSBIHGcyQgtobDMJFS7TTe_pQ",
          appId: "1:229567533246:android:01656c2e3ddc7454348eef",
          messagingSenderId: "229567533246",
          projectId: "girman-project"),
    );
  } catch (e) {
    print('Error initializing Firebase: $e');
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Girman Technologies',
      home: HomeScreen(),
    );
  }
}
