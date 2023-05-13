import 'package:flutter/material.dart';
import 'package:helpdesk/screens/homePage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    late final TextEditingController _usernameController;
    late final TextEditingController _passwordController;

    @override
    void initState() {
      _usernameController = TextEditingController();
      _passwordController = TextEditingController();
      super.initState();
    }

    @override
    void dispose() {
      _usernameController.dispose();
      _passwordController.dispose();
      super.dispose();
    }

    void alert(String message) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
                title: Text(message, textAlign: TextAlign.center),
                actions: <Widget>[
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          Navigator.of(context).pop();
                        });
                      },
                      child: Center(child: Text("Back"))),
                ]);
          });
    }

    return Scaffold(
      appBar: AppBar(
        // The title text which will be shown on the action bar
        title: Text("Helpdesk"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 200,
              child: TextField(
                maxLines: 1,
                //controller: _titleController,
                decoration: InputDecoration(
                  labelText: "Username:",
                ),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Container(
              width: 200,
              child: TextField(
                maxLines: 1,
                //controller: _titleController,
                decoration: InputDecoration(
                  labelText: "Password:",
                ),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Container(
              width: 200,
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HomePage()));
                      },
                      child: Text("Login"),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text("Register"),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              width: 200,
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HomePage()));
                      },
                      child: Text(" Admin Login"),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
