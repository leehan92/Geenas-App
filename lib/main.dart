import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:to_do_app_tutorial/pages/page_1.dart';

void main() async {

  //iniitialize hive
  await Hive.initFlutter();
  
  //openbox

  var box = await Hive.openBox('mybox');
  runApp(const MyApp());
}


//splash screen

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 228, 219, 136),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/geena_logo.jpg',
              width: 250,
              height: 280,
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) {
                print('Error loading image: $error');
                return const Icon(Icons.error, size: 100);  // Shows an error icon if image fails to load
              },
            ),
            const SizedBox(height: 20),
            const Text("GeenBean's App",
              style: TextStyle(
                fontSize: 24,
                fontFamily: 'Cursive',
                fontStyle: FontStyle.normal
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FutureBuilder(
        future: Future.delayed(const Duration(seconds: 3)), // Show splash for 2 seconds
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const SplashScreen();
          } else {
            return const HomePage();
          }
        },
      ),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.yellow
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color.fromARGB(255, 48, 43, 3),
          titleTextStyle: TextStyle(
            color: Color.fromARGB(255, 223, 220, 195),
            fontSize: 32,
            fontFamily: 'Cursive',
            fontStyle: FontStyle.normal,
          ),
        ),
      ),
    );
  }
}