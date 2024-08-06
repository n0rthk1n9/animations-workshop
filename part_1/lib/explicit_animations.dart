import 'package:flutter/material.dart';

class ExplicitAnimations extends StatefulWidget {
  const ExplicitAnimations({super.key});

  @override
  State<ExplicitAnimations> createState() => _ExplicitAnimationsState();
}

class _ExplicitAnimationsState extends State<ExplicitAnimations> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    // initialize controllers/animations/listeners here
  }

  @override
  void dispose() {
    // don't forget to dispose of controllers/animations here, and remove listeners
    super.dispose();
  }

  void _listener() => setState(() {});

  void _onButtonPressed() {
    _controller.forward().then((_) => _controller.reverse());
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Positioned(
          top: 0,
          child: ElevatedButton(
            onPressed: () {},
            child: const Text('Animate me!'),
          ),
        ),
      ],
    );
  }
}
