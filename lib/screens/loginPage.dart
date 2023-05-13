import 'package:flutter/material.dart';
import 'package:helpdesk/screens/homePage.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // The title text which will be shown on the action bar
        title: Text("Homepage"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("HelpDesk"),
            SizedBox(
              height: 25,
            ),
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
          ],
        ),
      ),
    );
  }
}
