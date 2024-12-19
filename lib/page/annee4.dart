import 'package:arabic_font/arabic_font.dart';
<<<<<<< HEAD
import 'package:bac/page/PdfView.dart';
import 'package:bac/page/ThemeProvider.dart';
import 'package:bac/page/annee5.dart';
=======
import 'package:bac/page/ThemeProvider.dart';
import 'package:bac/page/annee5.dart';
import 'package:bac/page/bac.dart';
>>>>>>> origin/main
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:provider/provider.dart';

<<<<<<< HEAD
=======
// ignore: camel_case_types
>>>>>>> origin/main
class annee4 extends StatefulWidget {
  const annee4({super.key});

  @override
<<<<<<< HEAD
  State<annee4> createState() => _Annee4State();
}

class _Annee4State extends State<annee4> with TickerProviderStateMixin {
=======
  State<annee4> createState() => _annee4State();
}

// ignore: camel_case_types
class _annee4State extends State<annee4> with TickerProviderStateMixin {
>>>>>>> origin/main
  late List<AnimationController> _controllers;
  late List<Animation<double>> _animations;
  List<bool> showPlus = [false, false, false];

  @override
  void initState() {
    super.initState();
    _controllers = List.generate(
      3,
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
<<<<<<< HEAD
          'الثالثة اعدادي',
=======
          'الاولى باكالوريا',
>>>>>>> origin/main
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
            : Colors.orange,
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
                : [Colors.orange, Colors.white],
          ),
        ),
        child: AnimationLimiter(
<<<<<<< HEAD
          child: ListView(
            padding: const EdgeInsets.all(16),
            children: AnimationConfiguration.toStaggeredList(
              duration: const Duration(milliseconds: 500),
              childAnimationBuilder: (widget) => SlideAnimation(
                verticalOffset: 50.0,
                child: FadeInAnimation(child: widget),
              ),
              children: [
                _buildExpandableSection(
                  title: 'امتحانات جهوية للسنة الثالثة اعدادي',
                  index: 0,
                  color: Colors.red,
                  navigationButtons: [
                    _buildNavigationButton(
                      text: 'وطني 1',
                      onTap: () => _navigateToScreen(context, const PdfView()),
                      color: Colors.blue,
                      icon: Icons.public,
                    ),
                    const SizedBox(height: 8),
                    _buildNavigationButton(
                      text: 'جهوي 1',
                      onTap: () => _navigateToScreen(context, const annee5()),
                      color: Colors.green,
                      icon: Icons.location_city,
                    ),
                    const SizedBox(height: 8),
                    _buildNavigationButton(
                      text: 'محلي 1',
                      onTap: () => _navigateToScreen(context, const annee4()),
                      color: Colors.orange,
                      icon: Icons.home,
                    ),
                  ],
                ),
                _buildExpandableSection(
                  title: ' (الرياضيات) امتحانات محلية',
                  index: 1,
                  color: Colors.blue,
                  navigationButtons: [
                    _buildNavigationButton(
                      text: 'وطني 2',
                      onTap: () => _navigateToScreen(context, const PdfView()),
                      color: Colors.purple,
                      icon: Icons.public,
                    ),
                    const SizedBox(height: 8),
                    _buildNavigationButton(
                      text: 'جهوي 2',
                      onTap: () => _navigateToScreen(context, const annee5()),
                      color: Colors.teal,
                      icon: Icons.location_city,
                    ),
                    const SizedBox(height: 8),
                    _buildNavigationButton(
                      text: 'محلي 2',
                      onTap: () => _navigateToScreen(context, const annee4()),
                      color: Colors.amber,
                      icon: Icons.home,
                    ),
                  ],
                ),
                _buildExpandableSection(
                  title: 'شعبة العلوم الرياضية 3',
                  index: 2,
                  color: Colors.green,
                  navigationButtons: [
                    _buildNavigationButton(
                      text: 'وطني 3',
                      onTap: () => _navigateToScreen(context, const PdfView()),
                      color: Colors.cyan,
                      icon: Icons.public,
                    ),
                    const SizedBox(height: 8),
                    _buildNavigationButton(
                      text: 'جهوي 3',
                      onTap: () => _navigateToScreen(context, const annee5()),
                      color: Colors.lime,
                      icon: Icons.location_city,
                    ),
                    const SizedBox(height: 8),
                    _buildNavigationButton(
                      text: 'محلي 3',
                      onTap: () => _navigateToScreen(context, const annee4()),
                      color: Colors.pink,
                      icon: Icons.home,
                    ),
                  ],
                ),
              ],
            ),
=======
          child: ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: 3,
            itemBuilder: (context, index) {
              return AnimationConfiguration.staggeredList(
                position: index,
                duration: const Duration(milliseconds: 500),
                child: SlideAnimation(
                  verticalOffset: 50.0,
                  child: FadeInAnimation(
                    child: _buildExpandableSection(
                      title: 'شعبة العلوم الرياضية ${index + 1}',
                      index: index,
                      color: [Colors.red, Colors.blue, Colors.green][index],
                    ),
                  ),
                ),
              );
            },
>>>>>>> origin/main
          ),
        ),
      ),
    );
  }

<<<<<<< HEAD
  Widget _buildExpandableSection({
    required String title,
    required int index,
    required Color color,
    required List<Widget> navigationButtons,
  }) {
=======
  Widget _buildExpandableSection({required String title, required int index, required Color color}) {
>>>>>>> origin/main
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
<<<<<<< HEAD
              child: showPlus[index]
                  ? Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        children: navigationButtons,
                      ),
                    )
                  : const SizedBox(),
=======
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
>>>>>>> origin/main
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
<<<<<<< HEAD
}
=======
}
>>>>>>> origin/main
