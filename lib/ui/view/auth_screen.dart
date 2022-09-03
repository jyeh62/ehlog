import 'package:ehynsta/ui/viewmodel/firebase_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'singin_screen.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  AuthPageState createState() => AuthPageState();
}

class AuthPageState extends State<AuthPage> {
  FirebaseProvider? fp;

  @override
  Widget build(BuildContext context) {
    fp = Provider.of<FirebaseProvider>(context);

    logger.d("user: ${fp?.getUser()??"no user"}");
    if (fp?.getUser() != null && fp?.getUser()?.emailVerified == true) {
      return const Text("log in success");
    } else {
      return const SignUpPage();
    }
  }
}