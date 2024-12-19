import 'package:arabic_font/arabic_font.dart';
import 'package:bac/page/PdfView.dart';
import 'package:bac/page/ThemeProvider.dart';
import 'package:bac/page/annee4.dart';
import 'package:bac/page/annee5.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:provider/provider.dart';

class bac extends StatefulWidget {
  const bac({super.key});

  @override
  State<bac> createState() => _bacState();
}

class _bacState extends State<bac> with TickerProviderStateMixin {
  late List<AnimationController> _controllers;
  late List<Animation<double>> _animations;
  List<bool> showPlus = List.generate(16, (_) => false); 

  final List<Color> cardColors = [
    const Color(0xFF1E88E5),
    const Color(0xFF43A047),
    const Color(0xFFE53935),
    const Color(0xFFEF6C00),
    const Color(0xFFAB47BC),
    const Color(0xFF00ACC1),
    const Color(0xFFF06292),
    const Color(0xFFFFA726),
     const Color(0xFF1E88E5),
    const Color(0xFF43A047),
    const Color(0xFFE53935),
    const Color(0xFFEF6C00),
    const Color(0xFFAB47BC),
    const Color(0xFF00ACC1),
    const Color(0xFFF06292),
    const Color(0xFFFFA726),
  ];

  final List<String> _titles = [
    "المسالك العلمية",
    "مسلك علوم رياضية",
    "مسلك علوم حياة والأرض",
    "مسلك علوم فيزيائية"
    "مسلك علوم التدبير المحاسباتي",
    "المسالك العلمية بالفرنسية",
    "مسلك علوم رياضية بالفرنسية",
    "مسلك علوم التدبير المحاسباتي بالفرنسية",
    "مسلك علوم ميكانيكية",
    "مسلك علوم كهربائية",
    "مسلك علوم اقتصادية بالفرنسية",
    "مسلك اداب",
    "مسلك علوم انسانية",
    "مسلك علوم شرعية",
    "مسلك لغة عربية",
    "مسلك فنون تطبيقية",
    "مسلك علوم زراعية",
  ];

  final List<List<Map<String, dynamic>>> navigationButtons = [
    [
      {'text': 'وطني 1', 'screen': const PdfView(), 'icon': Icons.public},
      {'text': 'جهوي 1', 'screen': const  annee4(), 'icon': Icons.location_city},
      {'text': 'محلي 1', 'screen': const annee5(), 'icon': Icons.home},
    ],
    [
      {'text': 'وطني 2', 'screen': const PdfView(), 'icon': Icons.public},
      {'text': 'جهوي 2', 'screen': const annee4(), 'icon': Icons.location_city},
      {'text': 'محلي 2', 'screen': const annee5(), 'icon': Icons.home},
    ],
    [
      {'text': 'وطني 3', 'screen': const PdfView(), 'icon': Icons.public},
      {'text': 'جهوي 3', 'screen': const annee4(), 'icon': Icons.location_city},
      {'text': 'محلي 3', 'screen': const annee5(), 'icon': Icons.home},
    ],
    [
      {'text': 'وطني 4', 'screen': const PdfView(), 'icon': Icons.public},
      {'text': 'جهوي 4', 'screen': const annee4(), 'icon': Icons.location_city},
      {'text': 'محلي 4', 'screen': const annee5(), 'icon': Icons.home},
    ],
    [
      {'text': 'وطني 5', 'screen': const PdfView(), 'icon': Icons.public},
      {'text': 'جهوي 5', 'screen': const annee4(), 'icon': Icons.location_city},
      {'text': 'محلي 5', 'screen': const annee5(), 'icon': Icons.home},
    ],
    [
      {'text': 'وطني 6', 'screen': const PdfView(), 'icon': Icons.public},
      {'text': 'جهوي 6', 'screen': const annee4(), 'icon': Icons.location_city},
      {'text': 'محلي 6', 'screen': const annee5(), 'icon': Icons.home},
    ],
    [
      {'text': 'وطني 7', 'screen': const PdfView(), 'icon': Icons.public},
      {'text': 'جهوي 7', 'screen': const annee4(), 'icon': Icons.location_city},
      {'text': 'محلي 7', 'screen': const annee5(), 'icon': Icons.home},
    ],
    [
      {'text': 'وطني 8', 'screen': const PdfView(), 'icon': Icons.public},
      {'text': 'جهوي 8', 'screen': const PdfView(), 'icon': Icons.location_city},
      {'text': 'محلي 8', 'screen': const PdfView(), 'icon': Icons.home},
    ],
     [
      {'text': 'وطني 8', 'screen': const PdfView(), 'icon': Icons.public},
      {'text': 'جهوي 8', 'screen': const PdfView(), 'icon': Icons.location_city},
      {'text': 'محلي 8', 'screen': const PdfView(), 'icon': Icons.home},
    ],
     [
      {'text': 'وطني 8', 'screen': const PdfView(), 'icon': Icons.public},
      {'text': 'جهوي 8', 'screen': const PdfView(), 'icon': Icons.location_city},
      {'text': 'محلي 8', 'screen': const PdfView(), 'icon': Icons.home},
    ],
     [
      {'text': 'وطني 8', 'screen': const PdfView(), 'icon': Icons.public},
      {'text': 'جهوي 8', 'screen': const PdfView(), 'icon': Icons.location_city},
      {'text': 'محلي 8', 'screen': const PdfView(), 'icon': Icons.home},
    ],
     [
      {'text': 'وطني 8', 'screen': const PdfView(), 'icon': Icons.public},
      {'text': 'جهوي 8', 'screen': const PdfView(), 'icon': Icons.location_city},
      {'text': 'محلي 8', 'screen': const PdfView(), 'icon': Icons.home},
    ],
     [
      {'text': 'وطني 8', 'screen': const PdfView(), 'icon': Icons.public},
      {'text': 'جهوي 8', 'screen': const PdfView(), 'icon': Icons.location_city},
      {'text': 'محلي 8', 'screen': const PdfView(), 'icon': Icons.home},
    ],
     [
      {'text': 'وطني 8', 'screen': const PdfView(), 'icon': Icons.public},
      {'text': 'جهوي 8', 'screen': const PdfView(), 'icon': Icons.location_city},
      {'text': 'محلي 8', 'screen': const PdfView(), 'icon': Icons.home},
    ],
    
     [
      {'text': 'وطني 8', 'screen': const PdfView(), 'icon': Icons.public},
      {'text': 'جهوي 8', 'screen': const PdfView(), 'icon': Icons.location_city},
      {'text': 'محلي 8', 'screen': const PdfView(), 'icon': Icons.home},
    ],
     [
      {'text': 'وطني 8', 'screen': const PdfView(), 'icon': Icons.public},
      {'text': 'جهوي 8', 'screen': const PdfView(), 'icon': Icons.location_city},
      {'text': 'محلي 8', 'screen': const PdfView(), 'icon': Icons.home},
    ],
  ];

  @override
  void initState() {
    super.initState();
    _controllers = List.generate(
      16, 
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
          'الثانية باكالوريا',
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
            : Colors.blue,
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
                : [Colors.blue, Colors.white],
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
                      color: cardColors[index],
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
          children: navigationButtons[index].map((button) {
            return Column(
              children: [ _buildNavigationButton(
                text: button['text'],
                onTap: () => _navigateToScreen(context, button['screen']),
                color: cardColors[index],
                icon: button['icon'],
              ), const SizedBox(height: 8),]
            );
          }).toList(),
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
