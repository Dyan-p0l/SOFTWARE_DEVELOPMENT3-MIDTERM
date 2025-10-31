import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
  
  final _formKey = GlobalKey<FormState>();
  
  String _submittedText = '';

  String textDisplay = '';

  final TextEditingController _controller = TextEditingController();

  @override
  Widget build (BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("PART B: Text Field Validation", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22, color: Colors.white),),
        backgroundColor: Color(0xFF2F7AE5),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                  controller: _controller,
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.done,
                  decoration: const InputDecoration(
                    labelText: 'Enter something',
                    hintText: 'Type a short message',
                    border: OutlineInputBorder(), 
                  ),

                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF2F7AE5),
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      setState(() {
                        _submittedText = _controller.text;
                        textDisplay = 'Hello ${_controller.text}';
                      });
                    }
                  },
                  child: const Text('Submit')
                ),
                const SizedBox(height: 30),
                Text(textDisplay, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
              ],
            ),
          ),
          )
        
      ),
    );

  }
}
