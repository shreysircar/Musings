/*import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:music/core/configs/assets/app_vectors.dart';
import 'package:music/presentation/intro/pages/get_started.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
@override
void initState(){
  super.initState();
  redirect();
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(
       child:SvgPicture.asset(
       AppVectors.logo,
       width:120,
       height:120
       ),
      )
    );
  }
  Future<void> redirect() async{
    await Future.delayed(Duration(seconds:4));
    Navigator.pushReplacement(
      // ignore: use_build_context_synchronously
      context, 
      MaterialPageRoute(
        builder: (BuildContext context) => const GetStartedPage()
        )
        );
  }
}*/

/*
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';
import 'package:music/core/configs/assets/app_vectors.dart';
import 'package:music/presentation/intro/pages/get_started.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  bool showLogo = false;

  @override
  void initState() {
    super.initState();
    playAnimation();
  }

  void playAnimation() async {
    // Play animation for 3 seconds, then show the logo
    await Future.delayed(const Duration(seconds: 5));
    setState(() {
      showLogo = true;
    });

    // After 2 more seconds, navigate to GetStartedPage
    await Future.delayed(const Duration(seconds:3));
    navigateToNextPage();
  }

  void navigateToNextPage() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const GetStartedPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: showLogo
            ? SvgPicture.asset(
                AppVectors.logo,
                width: 100,
                height: 100,
              )
            : Lottie.asset(
                'assets/images/animation.json', // Path to your animation file
                width: 200,
                height: 200,
                fit: BoxFit.contain,
              ),
      ),
    );
  }
}
*/

/*
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';
import 'package:music/core/configs/assets/app_vectors.dart';
import 'package:music/presentation/intro/pages/get_started.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  bool showLogo = false;

  @override
  void initState() {
    super.initState();
    playAnimation();
  }

  void playAnimation() async {
    // Play animation for 3 seconds, then show the logo
    await Future.delayed(const Duration(seconds: 5));
    setState(() {
      showLogo = true;
    });

    // After 2 more seconds, navigate to GetStartedPage with swipe-up animation
    await Future.delayed(const Duration(seconds: 3));
    navigateToNextPage();
  }

  void navigateToNextPage() {
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        transitionDuration: const Duration(seconds:3),
        pageBuilder: (_, __, ___) => const GetStartedPage(),
        transitionsBuilder: (_, animation, __, child) {
          return SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(0, 1), // Start from bottom
              end: Offset.zero, // Move to top
            ).animate(CurvedAnimation(
              parent: animation,
              curve: Curves.easeInOut, // Smooth transition
            )),
            child: child,
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: showLogo
            ? SvgPicture.asset(
                AppVectors.logo,
                width: 100,
                height: 100,
              )
            : Lottie.asset(
                'assets/images/animation.json', // Path to your animation file
                width: 200,
                height: 200,
                fit: BoxFit.contain,
              ),
      ),
    );
  }
}
*/


//only animation(no logo) followed by swipe up
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:music/presentation/intro/pages/get_started.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    playAnimation();
  }

  void playAnimation() async {
    // Play animation for 3 seconds, then navigate with swipe-up transition
    await Future.delayed(const Duration(seconds: 5));
    navigateToNextPage();
  }

  void navigateToNextPage() {
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        transitionDuration: const Duration(seconds: 4),
        pageBuilder: (_, __, ___) => const GetStartedPage(),
        transitionsBuilder: (_, animation, __, child) {
          return SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(0,40), // Start from bottom
              end: Offset.zero, // Move to top
            ).animate(CurvedAnimation(
              parent: animation,
              curve: Curves.easeInOut, // Smooth transition
            )),
            child: child,
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Lottie.asset(
          'assets/images/animation.json', // Path to your Lottie animation file
          width: 200,
          height: 200,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
