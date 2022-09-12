import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';

import 'ui/view/auth_screen.dart';
import 'ui/viewmodel/firebase_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); //<= the key is here
  SystemChrome.setPreferredOrientations(
      [ DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown ]);
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MultiProvider(
      providers: [
        ChangeNotifierProvider<FirebaseProvider>(
            create: (_) => FirebaseProvider())
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(

          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  var logger = Logger();

  @override
  Widget build(BuildContext context) {

    logger.d("main");
    return Scaffold(
      appBar: AppBar(title: const Text("Flutter Firebase")),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: const Text("Sign up"),
            subtitle: const Text("join"),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const AuthPage()));
            },
          ),
          ListTile(
            title: const Text("Firebase Auth"),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => const AuthPage()));
            },
          ),
        ].map((child) {
          return Card(
            child: child,
          );
        }).toList(),
      ),
    );
  }
}
