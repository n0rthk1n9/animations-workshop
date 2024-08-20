import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

void main() {
  timeDilation = 10;
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  final items = {
    'Personal': false,
    'Inspiration': true,
    'Ideas': false,
    'To-Do': false,
    'Meetings': true,
    'Study': false,
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Wrap(
              children: items.entries.map<Widget>((entry) {
            return BouncyChip(
              key: ValueKey(entry.key),
              label: entry.key,
              value: entry.value,
              onChanged: (value) {
                setState(() {
                  items[entry.key] = value;
                });
              },
            );
          }).toList()),
        ),
      ),
    );
  }
}

class BouncyChip extends StatefulWidget {
  const BouncyChip(
      {super.key,
      required this.label,
      required this.value,
      required this.onChanged});

  final String label;
  final bool value;
  final Function(bool) onChanged;

  @override
  State<BouncyChip> createState() => _BouncyChipState();
}

class _BouncyChipState extends State<BouncyChip>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  late Animation<double> _scaleAnimation;
  late Animation<double> _sizeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 100),
      vsync: this,
    );

    _scaleAnimation = TweenSequence<double>([
      TweenSequenceItem(
        tween: Tween<double>(begin: 0, end: 1.5),
        weight: 90,
      ),
      TweenSequenceItem(
        tween: Tween<double>(begin: 1.5, end: 1),
        weight: 10,
      ),
    ]).animate(_controller);

    _sizeAnimation = TweenSequence<double>([
      TweenSequenceItem(
        tween: Tween<double>(begin: 0, end: 1.5),
        weight: 50,
      ),
      TweenSequenceItem(
        tween: Tween<double>(begin: 1.5, end: 1),
        weight: 50,
      ),
    ]).animate(_controller);

    // If we want to "animate in" on creating our widget
    // we can start the animation from 0
    if (widget.value) {
      _controller.forward(from: 0);
    }
  }

  @override
  void didUpdateWidget(covariant BouncyChip oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Only drive the animation if the values change
    if (widget.value != oldWidget.value) {
      if (widget.value) {
        _controller.forward(from: 0);
      } else {
        _controller.reverse(from: 1);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            12,
          ),
          border: Border.all(
            // TODO BONUS: animate the border color
            color: widget.value ? Colors.green : Colors.grey,
            width: widget.value ? 2 : 1,
          ),
        ),
        child: GestureDetector(
          onTap: () {
            widget.onChanged(!widget.value);
          },
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: AnimatedBuilder(
                animation: _controller,
                builder: (context, child) {
                  return Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizeTransition(
                        axis: Axis.horizontal,
                        sizeFactor: _sizeAnimation,
                        child: Padding(
                          padding: EdgeInsets.only(right: 8),
                          child: ScaleTransition(
                            scale: _scaleAnimation,
                            child: SizedBox(
                              height: 36,
                              child: const Center(
                                child: Icon(
                                  Icons.check_circle,
                                  color: Colors.green,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Text(
                        widget.label,
                        style: const TextStyle(),
                      ),
                    ],
                  );
                }),
          ),
        ),
      ),
    );
  }
}
