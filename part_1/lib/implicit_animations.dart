import 'package:flutter/material.dart';

import 'utils/random_generator.dart';

class ImplicitAnimations extends StatefulWidget {
  const ImplicitAnimations({super.key});

  @override
  State<ImplicitAnimations> createState() => _ImplicitAnimationsState();
}

class _ImplicitAnimationsState extends State<ImplicitAnimations> {
  late Color _color;
  late Size _size;
  bool _showBox = true;

  @override
  void initState() {
    super.initState();
    _setRandomValues();
  }

  void _setRandomValues() {
    _color = RandomGenerator.getColor();
    _size = RandomGenerator.getSize();
  }

  void _onBoxTap() {
    debugPrint('Colored box tapped!');
    setState(_setRandomValues);
  }

  void _onButtonTap() {
    debugPrint('Button tapped!');
    setState(() => _showBox = !_showBox);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        GestureDetector(
          onTap: _onBoxTap,
          child: IgnorePointer(
            ignoring: !_showBox,
            child: AnimatedOpacity(
              opacity: _showBox ? 1 : 0,
              duration: const Duration(milliseconds: 300),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 600),
                curve: Curves.elasticIn,
                color: _color,
                width: _size.width,
                height: _size.height,
              ),
            ),
          ),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: _onButtonTap,
          child: const Text('Toggle visibility'),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
