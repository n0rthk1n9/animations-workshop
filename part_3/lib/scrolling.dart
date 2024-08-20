import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  /// TODO: what to do with this...?
  late final ScrollController _controller;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          elevation: 12.0,
          title: const Text('List Animation'),
        ),
        body: Column(
          children: [
            /// TODO: add a fitting widget to show the "progress" ;)
            Expanded(
              child: ListView.builder(
                itemCount: 100,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text('Title $index'),
                    subtitle: const Text('Subtitle'),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
