import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:helpdesk/widgets/reportListWidget.dart';
import 'package:helpdesk/widgets/reportPostWidget.dart';
import 'package:provider/provider.dart';

import '../models/category.dart';
import '../models/user.dart';
import '../providers/helpDeskProvider.dart';
import 'createReportPage.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final String currentUser = context.select<HelpDeskProvider, String>(
      (provider) => provider.currentUser,
    );
    final String currentUserType = context.select<HelpDeskProvider, String>(
      (provider) => provider.currentUserType,
    );
    final UnmodifiableListView<Category> categories =
        context.select<HelpDeskProvider, UnmodifiableListView<Category>>(
      (provider) => provider.categories,
    );

    String dropDownValue = context.select<HelpDeskProvider, String>(
      (provider) => provider.currentCategory,
    );

    return Scaffold(
      appBar: AppBar(
        // The title text which will be shown on the action bar
        title: Column(children: [
          Text(currentUser),
          Text(
            currentUserType,
            style: TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 13,
            ),
          )
        ]),
        actions: [
          Container(
            width: 130,
            padding: EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 3,
            ),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
            child: DropdownButton<String>(
              isExpanded: true,
              value: dropDownValue,
              items: categories.map((Category category) {
                return DropdownMenuItem<String>(
                  value: category.categoryName,
                  child: Text(category.categoryName),
                );
              }).toList(),
              onChanged: (String? value) {
                context.read<HelpDeskProvider>().changeCategoy(value!);
              },
              underline: SizedBox(),
            ),
          ),
        ],
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
      floatingActionButton: currentUserType == "User"
          ? FloatingActionButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CreateReportPage()));
              },
              child: const Icon(
                Icons.add,
              ),
            )
          : FloatingActionButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CreateReportPage()));
              },
              child: const Icon(
                Icons.filter_alt,
              ),
            ),
    );
  }
}
