import 'package:flutter/material.dart';
import 'package:helpdesk/widgets/addCommentWidget.dart';
import 'package:helpdesk/widgets/commentListWidget.dart';
import 'package:helpdesk/widgets/reportPostViewWidget.dart';
import 'package:provider/provider.dart';
import '../models/report.dart';
import '../providers/helpDeskProvider.dart';

class ReportPage extends StatefulWidget {
  final Report reportItem;
  const ReportPage({
    super.key,
    required this.reportItem,
  });

  @override
  State<ReportPage> createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  @override
  Widget build(BuildContext context) {
    final String currentUser = context.select<HelpDeskProvider, String>(
      (provider) => provider.currentUser,
    );
    final String currentUserType = context.select<HelpDeskProvider, String>(
      (provider) => provider.currentUserType,
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
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ReportPostViewWidget(
                  reportItem: widget.reportItem,
                ),
                SizedBox(height: 10),
                CommentListWidget(
                  reportItem: widget.reportItem,
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (BuildContext context) {
              return AddCommentWidget(
                reportItem: widget.reportItem,
              );
            },
          );
        },
        child: const Icon(
          Icons.forum,
        ),
      ),
    );
  }
}
