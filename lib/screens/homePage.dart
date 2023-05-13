import 'package:flutter/material.dart';
import 'package:helpdesk/widgets/reportListWidget.dart';
import 'package:helpdesk/widgets/reportPostWidget.dart';

class HomePage extends StatefulWidget {
  final String currentUser;
  final String userType;

  const HomePage({
    super.key,
    required this.currentUser,
    required this.userType,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // The title text which will be shown on the action bar
        title: Column(children: [
          Text(widget.currentUser),
          Text(
            widget.userType,
            style: TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 13,
            ),
          )
        ]),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ReportListWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
