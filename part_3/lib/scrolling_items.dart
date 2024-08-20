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
  late final ScrollController _controller;
  late final List<GlobalKey> _keys;

  final _amountElements = 100;

  @override
  void initState() {
    super.initState();

    _controller = ScrollController()..addListener(() => setState(() {}));

    /// We need to attach a [GlobalKey] to each [ListTile] widget to
    /// reference it later (getting its position)
    _keys = List.generate(_amountElements, (_) => GlobalKey());
  }

  double _animationValue(
    int index, {
    double animationFractionStart = 0.7,
    double animationFractionEnd = 1.0,
  }) {
    /// TODO: use the information from the [ScrollController] to get
    /// the following information:
    ///   - viewport height to determine scroll container height
    ///   - the height when animation value starts and end (1 and 0)
    ///   - the current position of element at [index]
    ///  With these information you are able to calculate the animation
    /// value which needs to be normalised to 0 and 1
    return 0;
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
            Expanded(
              child: ListView.builder(
                controller: _controller,
                itemCount: _amountElements,
                itemBuilder: (context, index) {
                  return Opacity(
                    /// TODO: correctly use [_animationValue]
                    opacity: 1,

                    /// TODO: Wrap [ListTile] with whatever you want
                    /// it to "animate", the [Transform.*] widget can
                    /// do a lot here
                    child: ListTile(
                      key: _keys[index],
                      title: Text('Title $index'),
                      subtitle: const Text('Subtitle'),
                    ),
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
