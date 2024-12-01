import 'package:arabic_font/arabic_font.dart';
import 'package:bac/main.dart';
import 'package:bac/page/ThemeProvider.dart';
import 'package:bac/page/annee4.dart';
import 'package:bac/page/annee5.dart';
import 'package:bac/page/bac.dart';
import 'package:bac/page/settings.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Page1 extends StatefulWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  _Page1State createState() => _Page1State();
}

class _Page1State extends State<Page1> with SingleTickerProviderStateMixin {
  int _selectedIndex = -1;
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final isDarkMode = themeProvider.isDarkMode;

    return Scaffold(
      backgroundColor: isDarkMode ? Colors.grey[900] : Colors.grey[100],
      appBar: AppBar(
        title: const Text(
          'القائمة الرئيسية',
          style: ArabicTextStyle(
            arabicFont: ArabicFont.dinNextLTArabic,
            fontSize: 22,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: isDarkMode ? Colors.grey[800] : colorb,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              FadeTransition(
                opacity: _animation,
                child: Text(
                  'اختر المستوى الدراسي',
                  style: ArabicTextStyle(
                    arabicFont: ArabicFont.dinNextLTArabic,
                    fontSize: 24,
                    color: isDarkMode ? Colors.white : Colors.black87,
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 30),
              Expanded(
                child: SlideTransition(
                  position: Tween<Offset>(
                    begin: const Offset(0, 0.1),
                    end: Offset.zero,
                  ).animate(_animation),
                  child: GridView.count(
                    crossAxisCount: 2,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 20,
                    padding: EdgeInsets.all(10),
                    children: [
                      _buildMenuItem(
                        context: context,
                        onPressed: () => _selectAndNavigate(0, const bac()),
                        icon: Icons.school,
                        label: 'الثانية باكالوريا',
                        color: Colors.blue,
                        index: 0,
                        isDarkMode: isDarkMode,
                      ),
                      _buildMenuItem(
                        context: context,
                        onPressed: () => _selectAndNavigate(1, const Annee5()),
                        icon: Icons.book,
                        label: 'الاولى باكالوريا',
                        color: Colors.green,
                        index: 1,
                        isDarkMode: isDarkMode,
                      ),
                      _buildMenuItem(
                        context: context,
                        onPressed: () => _selectAndNavigate(2, const annee4()),
                        icon: Icons.assignment,
                        label: 'الثالثة اعدادي',
                        color: Colors.orange,
                        index: 2,
                        isDarkMode: isDarkMode,
                      ),
                      _buildMenuItem(
                        context: context,
                        onPressed: () => _selectAndNavigate(3, const Settings()),
                        icon: Icons.settings,
                        label: 'الاعدادات',
                        color: Colors.purple,
                        index: 3,
                        isDarkMode: isDarkMode,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMenuItem({
    required BuildContext context,
    required VoidCallback onPressed,
    required IconData icon,
    required String label,
    required Color color,
    required int index,
    required bool isDarkMode,
  }) {
    final isSelected = index == _selectedIndex;
    final itemColor = isSelected ? Colors.white : (isDarkMode ? Colors.white : color);
    final backgroundColor = isSelected ? color : (isDarkMode ? Colors.grey[800]! : Colors.white);

    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      child: Card(
        elevation: isSelected ? 12 : 4,
        color: backgroundColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: InkWell(
          onTap: onPressed,
          borderRadius: BorderRadius.circular(20),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: color.withOpacity(0.3),
                  blurRadius: 8,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    icon,
                    size: 48,
                    color: itemColor,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    label,
                    style: ArabicTextStyle(
                      arabicFont: ArabicFont.dinNextLTArabic,
                      fontSize: 16,
                      color: itemColor,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _selectAndNavigate(int index, Widget page) {
    setState(() {
      _selectedIndex = index;
    });
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => page,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(opacity: animation, child: child);
        },
      ),
    ).then((_) {
      setState(() {
        _selectedIndex = -1;
      });
    });
  }
}