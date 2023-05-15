import 'package:flutter/material.dart';
import 'package:helpdesk/models/category.dart';
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

  final List<Category> _categories = [
    Category(categoryName: "All"),
    Category(categoryName: "General"),
    Category(categoryName: "AD Management"),
    Category(categoryName: "E-mail"),
    Category(categoryName: "Hardware"),
    Category(categoryName: "Intranet"),
    Category(categoryName: "Internet"),
    Category(categoryName: "Network"),
    Category(categoryName: "Phones"),
    Category(categoryName: "Printers"),
    Category(categoryName: "Programming"),
    Category(categoryName: "Scanners"),
    Category(categoryName: "Software"),
    Category(categoryName: "Training"),
    Category(categoryName: "Virus/Malware"),
    Category(categoryName: "Other"),
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
        category: "Hardware",
        date: DateTime.now())
  ];

  String _currentUser = "Test";
  String _currentUserType = "Test";
  String _currentCategory = "All";

  //Read only view
  UnmodifiableListView<User> get users => UnmodifiableListView(_users);
  UnmodifiableListView<Admin> get admins => UnmodifiableListView(_admins);
  UnmodifiableListView<Report> get reports => UnmodifiableListView(_reports);
  UnmodifiableListView<Category> get categories =>
      UnmodifiableListView(_categories);

  String get currentUser => _currentUser;
  String get currentUserType => _currentUserType;
  String get currentCategory => _currentCategory;

  void register(User user) {
    _users.add(user);
    notifyListeners();
  }

  void login(String currentUser, String currentUserType) {
    _currentUser = currentUser;
    _currentUserType = currentUserType;
    notifyListeners();
  }

  void changeCategoy(String currentCategory) {
    _currentCategory = currentCategory;
    notifyListeners();
  }
}
