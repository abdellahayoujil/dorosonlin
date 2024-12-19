import 'package:bac/page/SplashScreen.dart';
import 'package:bac/page/ThemeProvider.dart';
import 'package:bac/page/page1.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

<<<<<<< HEAD
// Colors for my app
=======
// Colors for the app
>>>>>>> origin/main
const Color colorb = Color.fromARGB(255, 250, 81, 118);
const Color colorr = Color.fromARGB(255, 80, 255, 123);
const Color colorg = Color.fromARGB(255, 80, 248, 226);
const Color colork = Color.fromARGB(255, 0, 0, 0);
const Color colorgr = Color.fromARGB(255, 187, 177, 177);

void main() {
  debugPaintSizeEnabled = false;
  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return MaterialApp(
          theme: themeProvider.themeData,
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),);}
    );
      }
}

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
<<<<<<< HEAD
  // ignore: library_private_types_in_public_api
=======
>>>>>>> origin/main
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const SliderPage(
      title: "الباكالوريا: الأولى في التعليم العالي",
      description: "الباكالوريا هي الخطوة الأولى نحو التعليم العالي، وهي تعتبر أساس نجاح مستقبلك الأكاديمي والمهني. اكتشف كيف يمكن أن تؤثر هذه المرحلة الحاسمة على مسارك وتفتح لك أبوابًا جديدة.",
      image: "lib/image/ed.jpg",
    ),
    const SliderPage(
      title: "نصائح واستراتيجيات للتفوق في الباكالوريا",
      description: "لتحقيق النجاح في الباكالوريا، عليك باتباع استراتيجيات فعالة تساعدك على تنظيم وقتك وتركيز دراستك. تعرف على أهم النصائح لتحقق أعلى الدرجات وتحقق أهدافك.",
      image: "lib/image/ed33.png",
    ),
    const SliderPage(
      title: "تحدي الباكالوريا: اختبر معرفتك",
      description: "في هذا القسم، سنقدم لك مجموعة من التمارين المصممة لمساعدتك على تعزيز فهمك لمحتويات امتحانات الباكالوريا. اختبر معرفتك من خلال الأنشطة المتنوعة التي تشمل مطابقة الكلمات",
      image: "lib/image/ed22.png",
    ),
  ];

  void navigateToMainScreen() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => Page1()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          Directionality(
            textDirection: TextDirection.rtl,
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              itemCount: _pages.length,
              itemBuilder: (context, index) {
                return _pages[index];
              },
            ),
          ),
          Positioned(
            top: screenHeight * 0.05,
            right: screenWidth * 0.05,
            child: TextButton(
              onPressed: navigateToMainScreen,
              child: const Text(
                'تخطي',
                style: TextStyle(fontSize: 25, color: colorb),
              ),
            ),
          ),
          Positioned(
            bottom: 30,
            right: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
<<<<<<< HEAD
              textDirection: TextDirection.rtl, 
=======
              textDirection: TextDirection.rtl, // Add this line
>>>>>>> origin/main
              children: List.generate(
                _pages.length,
                (index) => Container(
                  margin: const EdgeInsets.symmetric(horizontal: 6),
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _currentIndex == index ? colorb : const Color.fromARGB(255, 116, 114, 114),
                  ),
                ),
              ),
          ),
          ),
          Positioned(
            bottom: 30,
            left: 20,
            child: TextButton(
              onPressed: () {
                if (_currentIndex == _pages.length - 1) {
                  navigateToMainScreen();
                } else {
                  _pageController.nextPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                }
              },
              child: Text(
                _currentIndex == _pages.length - 1 ? 'تم' : 'التالي',
                style: const TextStyle(fontSize: 25, color: colorb),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
class SliderPage extends StatefulWidget {
  final String title;
  final String description;
  final String image;

  const SliderPage({
    required this.title,
    required this.description,
    required this.image,
    Key? key,
  }) : super(key: key);

  @override
  State<SliderPage> createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _titleOffsetAnimation;
  late Animation<Offset> _descriptionOffsetAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
<<<<<<< HEAD
      duration: const Duration(milliseconds: 1700), 
    );

    _titleOffsetAnimation = Tween<Offset>(
      begin: const Offset(-1.0, 1),
      end: Offset.zero,         
=======
      duration: const Duration(milliseconds: 1700), // Slower animation
    );

    _titleOffsetAnimation = Tween<Offset>(
      begin: const Offset(1, 0), // Start from the right
      end: Offset.zero,          // End at normal position
>>>>>>> origin/main
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));

    _descriptionOffsetAnimation = Tween<Offset>(
<<<<<<< HEAD
      begin: const Offset(-1.0, 1), 
      end: Offset.zero,         
=======
      begin: const Offset(1, 0), // Start from the right 
      end: Offset.zero,          // End at normal position
>>>>>>> origin/main
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));

    _fadeAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeIn,
    ));

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
Widget build(BuildContext context) {
  final screenWidth = MediaQuery.of(context).size.width;
  return Padding(
    padding: const EdgeInsets.all(40.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: SlideTransition( 
            position: _titleOffsetAnimation, 
            child: FadeTransition(
              opacity: _fadeAnimation,
              child: Image.asset(
                widget.image,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
        const SizedBox(height: 20),
        SlideTransition(
          position: _titleOffsetAnimation,
          child: FadeTransition(
            opacity: _fadeAnimation,
            child: Text(
              widget.title,
              style: TextStyle(
                fontSize: screenWidth * 0.06,
                fontWeight: FontWeight.bold,
                color: colork,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 35),
          child: SlideTransition(
            position: _descriptionOffsetAnimation,
            child: FadeTransition(
              opacity: _fadeAnimation,
              child: Text(
                widget.description,
                style: const TextStyle(
                  fontSize: 16,
                  color: colorgr,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
<<<<<<< HEAD
        const SizedBox(height: 30),
=======
        const SizedBox(height: 30), // Add some space at the bottom
>>>>>>> origin/main
      ],
    ),
  );
}}