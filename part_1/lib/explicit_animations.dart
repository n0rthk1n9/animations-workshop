import 'package:flutter/material.dart';

class ExplicitAnimations extends StatefulWidget {
  const ExplicitAnimations({super.key});

  @override
  State<ExplicitAnimations> createState() => _ExplicitAnimationsState();
}

class _ExplicitAnimationsState extends State<ExplicitAnimations>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    // initialize controllers/animations/listeners here
    _controller = AnimationController(
      vsync: this,
      upperBound: 500,
      duration: const Duration(milliseconds: 300),
    );

    _controller.addListener(_listener);
  }

  @override
  void dispose() {
    // don't forget to dispose of controllers/animations here, and remove listeners
    _controller.removeListener(_listener);
    _controller.dispose();
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
          top: _controller.value,
          child: ElevatedButton(
            onPressed: _onButtonPressed,
            child: const Text('Animate me!'),
          ),
        ),
      ],
    );
  }
}
