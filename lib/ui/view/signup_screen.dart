import 'package:ehynsta/ui/viewmodel/firebase_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _mailCon = TextEditingController();
  final TextEditingController _pwCon = TextEditingController();
  final TextEditingController _nameCon = TextEditingController();

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  FirebaseProvider? fp;

  @override
  void dispose() {
    _mailCon.dispose();
    _pwCon.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    fp ??= Provider.of<FirebaseProvider>(context);

    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(title: const Text("Sign Up Page")),
        body: ListView(
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20, top: 10),
              child: Column(
                children: <Widget>[
                  //Header
                  Container(
                    height: 50,
                    decoration: const BoxDecoration(color: Colors.amber),
                    child: const Center(
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                            color: Colors.blueGrey,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),

                  // Input Area
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.amber, width: 1),
                    ),
                    child: Column(
                      children: <Widget>[
                        TextField(
                          controller: _mailCon,
                          decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.mail),
                            hintText: "Email",
                          ),
                        ),
                        TextField(
                          controller: _pwCon,
                          decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.lock),
                            hintText: "Password",
                          ),
                          obscureText: true,
                        ),
                        TextField(
                          controller: _nameCon,
                          decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.account_box),
                            hintText: "Name",
                          ),
                          obscureText: true,
                        )
                      ].map((c) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
                          child: c,
                        );
                      }).toList(),
                    ),
                  )
                ],
              ),
            ),

            // Sign Up Button
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: RaisedButton(
                color: Colors.indigo[300],
                child: const Text(
                  "Sign Up",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  FocusScope.of(context)
                      .requestFocus(FocusNode()); // 키보드 감춤
                  _signUp();
                },
              ),
            ),
          ],
        ));
  }

  void _signUp() async {
    bool result = await fp?.signUpWithEmail(_mailCon.text, _pwCon.text, _nameCon.text)??false;
    logger.d("_signUp result : $result");
    if(result) {
      logger.d("_signUp fp?.getUser(); : ${fp?.getUser()}");
    }
  }
}
