import 'package:flutter/material.dart';
import '../models/comment.dart';
import '../models/report.dart';
import '../providers/helpDeskProvider.dart';
import 'commentItemWidget.dart';

class CommentListWidget extends StatelessWidget {
  final Report reportItem;
  const CommentListWidget({super.key, required this.reportItem});

  @override
  Widget build(BuildContext context) {
    //final provider = Provider.of<HelpDeskProvider>(context);
    //final UnmodifiableListView<Report> reportItems = provider.reports;

    return reportItem.comments.isEmpty
        ? Center(
            child: Text("No Comments"),
          )
        : ListView.separated(
            shrinkWrap: true,
            padding: EdgeInsets.all(10),
            separatorBuilder: (context, index) => Container(height: 8),
            itemCount: reportItem.comments.length,
            itemBuilder: (BuildContext context, int index) {
              return CommentItemWidget(
                commentItem: reportItem.comments[index],
              );
            });
  }
}
