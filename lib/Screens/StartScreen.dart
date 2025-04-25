import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  final void Function() start;
  const StartScreen(this.start, {super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Discover Your Personality Type!',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('💖', style: TextStyle(fontSize: 36)),
              SizedBox(width: 10),
              Text('🍁', style: TextStyle(fontSize: 36)),
            ],
          ),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('📆', style: TextStyle(fontSize: 36)),
              SizedBox(width: 10),
              Text('🧠', style: TextStyle(fontSize: 36)),
            ],
          ),
          SizedBox(height: 8),
          ElevatedButton(
            onPressed: () {
              start();
            },
            child: Text('Start'),
          ),
        ],
      ),
    );
  }
}
