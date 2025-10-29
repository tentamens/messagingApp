import 'package:flutter/material.dart';
import 'package:messaging_app/firebase_options.dart';
import 'package:messaging_app/providers/chat_content_provider.dart';
import 'package:messaging_app/screens/home/home_screen.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ChatContentProvider()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.pink),
        ),
        home: HomeScreen(),
      ),
    ),
  );
}
