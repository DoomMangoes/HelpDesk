import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

class Report {
  String reportID;
  String reportTitle;
  String reportBody;
  String originalPoster;
  String category;

  Report({
    required this.reportID, required this.reportTitle, required this.reportBody, required this.originalPoster, required this.category
  });
}
