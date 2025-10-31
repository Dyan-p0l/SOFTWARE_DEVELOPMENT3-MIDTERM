import 'package:flutter/material.dart';
import 'pagetwo.dart';
import 'pagethree.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
      routes: {
        '/secondpage' : (context) => const pagetwo(),
        '/thirdpage'  : (context) => const pagethree(name: '', age: '', email: '',),
      }
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  


  @override
  Widget build(BuildContext context) {
 
    return Scaffold(
      backgroundColor: Color(0xFF1D63DC),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(84.0),
              child: const Text('WELCOME TO THE APPLICATION, I AM JOHN PAUL F. RAYCO', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white), textAlign: TextAlign.center,),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0XFFFA812F),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
              ),
              onPressed: () => {
                Navigator.pushNamed(context, '/secondpage')
              },
              child: const Text("CONTINUE", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            )
          ],
        )
      )
    );
  }
}
