import "package:flutter/material.dart";
import "package:madsocialproj2/screens/maincontainer.dart";
import "package:madsocialproj2/screens/registrationscreen.dart";
import "package:madsocialproj2/services/authservice.dart";

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('LoginScreen')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                  width: MediaQuery.of(context).size.width / 2,
                  child: TextField(
                      controller: _emailController,
                      decoration:
                          const InputDecoration(hintText: 'Enter email'))),
              const SizedBox(height: 30.0),
              SizedBox(
                  width: MediaQuery.of(context).size.width / 2,
                  child: TextField(
                    controller: _passwordController,
                    decoration:
                        const InputDecoration(hintText: 'Enter password'),
                  )),
              const SizedBox(height: 30.0),
              ElevatedButton(
                onPressed: () async {
                  final message = await AuthService().login(
                      email: _emailController.text,
                      password: _passwordController.text);
                  if (message!.contains('success')) {
                    print("Error");
                  } else
                    print(message);

                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MainContainer()),
                  );
                },
                child: Text('Login'),
              ),
              const SizedBox(height: 30.0),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RegisScreen()),
                    );
                  },
                  child: Text('Registration')),
            ],
          ),
        ));
  }
}
