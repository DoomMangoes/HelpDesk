import 'package:flutter/material.dart';
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

  //Read only view
  UnmodifiableListView<User> get users => UnmodifiableListView(_users);
  UnmodifiableListView<Admin> get admins => UnmodifiableListView(_admins);
}
