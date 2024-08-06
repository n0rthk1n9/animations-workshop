import 'package:flutter/material.dart';

import 'explicit_animations.dart';
import 'implicit_animations.dart';

void main() => runApp(const MainApp());

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      darkTheme:
          ThemeData.dark().copyWith(scaffoldBackgroundColor: Colors.white),
      home: const Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Flexible(
              child: ImplicitAnimations(),
            ),
            Flexible(
              child: ExplicitAnimations(),
            ),
          ],
        ),
      ),
    );
  }
}
