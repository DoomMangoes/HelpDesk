import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/category.dart';
import '../providers/helpDeskProvider.dart';

class CreateReportPage extends StatefulWidget {
  const CreateReportPage({super.key});

  @override
  State<CreateReportPage> createState() => _CreateReportPageState();
}

class _CreateReportPageState extends State<CreateReportPage> {
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

    final List<Category> selectCategories =
        categories.where((category) => category.categoryName != "All").toList();

    String dropDownValue = selectCategories.first.categoryName;

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
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 300,
              child: TextField(
                maxLines: 1,
                decoration: InputDecoration(
                  labelText: "Title:",
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Row(
                children: [
                  Text("Body:"),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: 300,
              child: TextField(
                maxLines: 10,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Row(
                children: [
                  Container(
                    width: 130,
                    height: 30,
                    padding: EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 3,
                    ),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: DropdownButton<String>(
                      isExpanded: true,
                      value: dropDownValue,
                      items: selectCategories.map((Category category) {
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
            ),
            SizedBox(height: 25),
            ElevatedButton(
              onPressed: () {},
              child: Text("Post Report"),
            ),
          ],
        ),
      ),
    );
  }
}
