import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

void main() {
  timeDilation = 3;
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  bool _expanded = false;

  @override
  void initState() {
    super.initState();
  }

  void _toggleExpandedState() => setState(() => _expanded = !_expanded);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(
                width: 256.0,
                height: 144.0,
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Positioned(
                      top: 60.0,
                      left: 0,
                      right: 0,
                      child: TripCard(
                        icon: Icons.cell_tower,
                        title: 'Eiffel Tower',
                        subtitle: 'Paris',
                        date: '5 August',
                      ),
                    ),
                    Positioned(
                      top: 54.0,
                      left: 0,
                      right: 0,
                      child: TripCard(
                        icon: Icons.campaign,
                        title: 'Concert',
                        subtitle: 'Hamburg',
                        date: '12 August',
                      ),
                    ),
                    Positioned(
                      top: 48,
                      left: 0,
                      right: 0,
                      child: TripCard(
                        icon: Icons.girl,
                        title: 'Meetup',
                        subtitle: 'Berlin',
                        date: '22 August',
                      ),
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: _toggleExpandedState,
                child: Text(_expanded ? 'Hide' : 'Show All'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TripCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final String date;

  const TripCard({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: IntrinsicHeight(
          child: Row(
            children: [
              Container(
                height: 48.0,
                width: 48.0,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Icon(
                  icon,
                  color: Colors.white,
                ),
              ),
              const SizedBox(width: 12.0),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                    Text(
                      subtitle,
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Text(date),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
