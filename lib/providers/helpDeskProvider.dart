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
      reportBody:
          "Muteki no egao de arasu media \nShiritai sono himitsu misuteriasu \nNuketeru toko sae kanojo no eria \nKanpeki na usotsuki na kimi wa \nTensaiteki na aidooru-sama",
      originalPoster: "Admin",
      userType: "Admin",
      category: "General",
      date: DateTime.now(),
    ),
    Report(
        reportTitle: "Not working",
        reportBody: "I dunno",
        originalPoster: "user",
        userType: "User",
        category: "General",
        date: DateTime.now())
  ];

  String _currentUser = "Test";
  String _currentUserType = "Test";

  //Read only view
  UnmodifiableListView<User> get users => UnmodifiableListView(_users);
  UnmodifiableListView<Admin> get admins => UnmodifiableListView(_admins);
  UnmodifiableListView<Report> get reports => UnmodifiableListView(_reports);

  String get currentUser => _currentUser;
  String get currentUserType => _currentUserType;

  void register(User user) {
    _users.add(user);
    notifyListeners();
  }

  void login(String currentUser, String currentUserType) {
    _currentUser = currentUser;
    _currentUserType = currentUserType;
    notifyListeners();
  }
}
