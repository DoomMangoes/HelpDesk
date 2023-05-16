import 'package:flutter/material.dart';
import 'package:helpdesk/models/comment.dart';
import 'package:helpdesk/models/report.dart';
import 'package:provider/provider.dart';

import '../providers/helpDeskProvider.dart';

class AddCommentWidget extends StatefulWidget {
  final Report reportItem;
  const AddCommentWidget({super.key, required this.reportItem});

  @override
  State<AddCommentWidget> createState() => _AddCommentWidgetState();
}

class _AddCommentWidgetState extends State<AddCommentWidget> {
  late final TextEditingController _commentController;

  @override
  void initState() {
    _commentController = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    _commentController.dispose();

    super.dispose();
  }

  void addComment(String currentUser, String currentUserType) {
    final String comment = _commentController.text;

    if (comment.isNotEmpty) {
      final newComment = Comment(
          commentBody: comment,
          originalPoster: currentUser,
          userType: currentUserType,
          parentID: widget.reportItem.reportID,
          date: DateTime.now());

      context
          .read<HelpDeskProvider>()
          .addComment(widget.reportItem, newComment);

      Navigator.of(context).pop();
    } else {
      alert();
    }
  }

  void alert() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              title: Text("All fields must be filled!",
                  textAlign: TextAlign.center),
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

  @override
  Widget build(BuildContext context) {
    final String currentUser = context.select<HelpDeskProvider, String>(
      (provider) => provider.currentUser,
    );
    final String currentUserType = context.select<HelpDeskProvider, String>(
      (provider) => provider.currentUserType,
    );

    return Container(
      height: 400,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              maxLines: 2,
              controller: _commentController,
              decoration: InputDecoration(
                labelText: "Comment:",
              ),
            ),
            SizedBox(
              height: 25,
            ),
            ElevatedButton(
              onPressed: () {
                addComment(currentUser, currentUserType);
              },
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  "Add Comment",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
