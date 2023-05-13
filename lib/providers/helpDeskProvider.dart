import 'package:flutter/material.dart';
import 'package:helpdesk/models/report.dart';
import '../models/admin.dart';
import '../models/user.dart';
import 'dart:collection';

class HelpDeskProvider extends ChangeNotifier {
  final List<User> _users = [
    User(username: "user", password: "user"),
  ];
  final List<Admin> _admins = [
    Admin(username: "admin", password: "admin"),
  ];

  final List<Report> _reports = [
    Report(
        reportTitle: "Admin Deeznuts",
        reportBody: "Ligma",
        originalPoster: "Admin",
        userType: "Admin",
        category: "General",
        date: DateTime.now()),
    Report(
        reportTitle: "Not working",
        reportBody: "I dunno",
        originalPoster: "user",
        userType: "User",
        category: "General",
        date: DateTime.now())
  ];

  //Read only view
  UnmodifiableListView<User> get users => UnmodifiableListView(_users);
  UnmodifiableListView<Admin> get admins => UnmodifiableListView(_admins);
  UnmodifiableListView<Report> get reports => UnmodifiableListView(_reports);

  void register(User user) {
    _users.add(user);
    notifyListeners();
  }
}
