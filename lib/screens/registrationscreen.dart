import "package:madsocialproj2/services/authservice.dart";
import "package:madsocialproj2/screens/homescreen.dart";
import "package:flutter/material.dart";

class RegisScreen extends StatefulWidget {
  const RegisScreen({Key? key}) : super(key: key);
  @override
  _RegisScreenState createState() => _RegisScreenState();
}

class _RegisScreenState extends State<RegisScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Register account'),
          centerTitle: true,
        ),
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
                  final message = await AuthService().registration(
                      email: _emailController.text,
                      password: _passwordController.text);
                  if (message!.contains('success')) {
                    print("Error");
                  } else {
                    Navigator.pop(context);
                  }
                },
                child: Text('Create Account'),
              )
            ],
          ),
        ));
  }
}
