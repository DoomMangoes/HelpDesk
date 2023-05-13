import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

class Report {
  String reportID;
  String reportTitle;
  String reportBody;
  String originalPoster;
  String category;
  DateTime date;

  Report({
    required this.reportTitle,
    required this.reportBody,
    required this.originalPoster,
    required this.category,
    required this.date,
  }) : reportID = const Uuid().v4();

  @override
  bool operator ==(covariant Report other) => reportID == other.reportID;

  @override
  int get hashCode => reportID.hashCode;
}
