import 'package:bac/page/annee4.dart';
import 'package:bac/page/annee5.dart';
import 'package:bac/page/bac.dart';
import 'package:flutter/material.dart';

class Test extends StatefulWidget {
  const Test({Key? key}) : super(key: key);

  @override
  TestState createState() => TestState();
}

class TestState extends State<Test> {
  bool showPlus = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          setState(() {
            showPlus = !showPlus;
          });
        },
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Text(
                'Rect 1',
                style: TextStyle(
                  fontSize: showPlus ? 24 : 16,
                  fontWeight: showPlus ? FontWeight.bold : FontWeight.normal,
                ),
              ),
            ),
            if (showPlus)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildNavigationContainer(
                    color: Colors.blue,
                    text: 'Screen 1',
                    onTap: () => _navigateToScreen(context, const bac()),
                  ),
                  _buildNavigationContainer(
                    color: Colors.green,
                    text: 'Screen 2',
                    onTap: () => _navigateToScreen(context, const Annee5()),
                  ),
                  _buildNavigationContainer(
                    color: Colors.orange,
                    text: 'Screen 3',
                    onTap: () => _navigateToScreen(context, const annee4()),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavigationContainer({
    required Color color,
    required String text,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 80,
        height: 80,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(color: Colors.white, fontSize: 14),
          ),
        ),
      ),
    );
  }

  void _navigateToScreen(BuildContext context, Widget screen) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => screen));
  }
}

// Example screens (Screen1, Screen2, Screen3) - Same as before