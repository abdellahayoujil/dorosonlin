import 'package:arabic_font/arabic_font.dart';
import 'package:bac/page/ThemeProvider.dart';
import 'package:bac/page/annee4.dart';
import 'package:bac/page/bac.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:provider/provider.dart';

class Annee5 extends StatefulWidget {
  const Annee5({Key? key}) : super(key: key);

  @override
  State<Annee5> createState() => _Annee5State();
}

class _Annee5State extends State<Annee5> with TickerProviderStateMixin {
  late List<AnimationController> _controllers;
  late List<Animation<double>> _animations;
  List<bool> showPlus = List.generate(8, (_) => false);

  @override
  void initState() {
    super.initState();
    _controllers = List.generate(
      8, 
      (_) => AnimationController(
        duration: const Duration(milliseconds: 300),
        vsync: this,
      ),
    );
    _animations = _controllers
        .map((controller) => CurvedAnimation(
              parent: controller,
              curve: Curves.easeInOut,
            ))
        .toList();
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'الاولى باكالوريا',
          style: ArabicTextStyle(
            arabicFont: ArabicFont.dinNextLTArabic,
            fontSize: 30,
            color: Colors.white,
          ),
        ),
               centerTitle: true,
        elevation: 0,
        backgroundColor: themeProvider.isDarkMode
            ? Colors.grey[800]
            : Colors.green,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(0),
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: themeProvider.isDarkMode
                ? [Colors.grey[800]!, Colors.grey[600]!]
                : [Colors.green, Colors.white],
          ),
        ),
        child: AnimationLimiter(
          child: ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: 8, 
            itemBuilder: (context, index) {
              return AnimationConfiguration.staggeredList(
                position: index,
                duration: const Duration(milliseconds: 500),
                child: SlideAnimation(
                  verticalOffset: 50.0,
                  child: FadeInAnimation(
                    child: _buildExpandableSection(
                      title: _titles[index], 
                      index: index,
                      color: _colors[index], 
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  final List<String> _titles = [
    "علوم رياضية",
    "علوم تجريبية",
    "علوم وتكنولوجيات كهربائية",
    "علوم وتكنولوجيات ميكانيكية",
    "آداب",
    "علوم إنسانية",
    "علوم اقتصادية وتدبير",
    "فنون تطبيقية",
  ];

  final List<Color> _colors = [
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.orange,
    Colors.purple,
    Colors.teal,
    Colors.pink,
    Colors.amber,
  ];

  Widget _buildExpandableSection({required String title, required int index, required Color color}) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      margin: const EdgeInsets.only(bottom: 16),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [color.withOpacity(0.1), Colors.white],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          children: [
            ListTile(
              title: Text(
                title,
                style: ArabicTextStyle(
                  arabicFont: ArabicFont.dinNextLTArabic,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: color,
                ),
              ),
              trailing: RotationTransition(
                turns: _animations[index],
                child: Icon(Icons.expand_more, color: color),
              ),
              onTap: () => _toggleExpand(index),
            ),
            AnimatedSize(
              duration: const Duration(milliseconds: 300),
              child: showPlus[index] ? _buildExpandedContent(index) : const SizedBox(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildExpandedContent(int index) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: AnimationConfiguration.toStaggeredList(
          duration: const Duration(milliseconds: 375),
          childAnimationBuilder: (widget) => SlideAnimation(
            horizontalOffset: 50.0,
            child: FadeInAnimation(
              child: widget,
            ),
          ),
          children: [
            _buildNavigationButton(
              text: 'وطني',
              onTap: () => _navigateToScreen(context, const bac()),
              color: Colors.blue,
              icon: Icons.public,
            ),
            const SizedBox(height: 8),
            _buildNavigationButton(
              text: 'جهوي',
              onTap: () => _navigateToScreen(context, const Annee5()),
              color: Colors.green,
              icon: Icons.location_city,
            ),
            const SizedBox(height: 8),
            _buildNavigationButton(
              text: 'محلي',
              onTap: () => _navigateToScreen(context, const annee4()),
              color: Colors.orange,
              icon: Icons.home,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavigationButton({
    required String text,
    required VoidCallback onTap,
    required Color color,
    required IconData icon,
  }) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon),
          const SizedBox(width: 8),
          Text(
            text,
            style: const ArabicTextStyle(
              arabicFont: ArabicFont.dinNextLTArabic,
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }

  void _toggleExpand(int index) {
    setState(() {
      for (int i = 0; i < showPlus.length; i++) {
        if (i == index) {
          showPlus[i] = !showPlus[i];
          if (showPlus[i]) {
            _controllers[i].forward();
          } else {
            _controllers[i].reverse();
          }
        } else {
          showPlus[i] = false;
          _controllers[i].reverse();
        }
      }
    });
  }

  void _navigateToScreen(BuildContext context, Widget screen) {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => screen,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(
            opacity: animation,
            child: child,
          );
        },
        transitionDuration: const Duration(milliseconds: 500),
      ),
    );
  }
}