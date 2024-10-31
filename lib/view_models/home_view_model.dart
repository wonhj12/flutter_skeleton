import 'package:flutter/material.dart';
import 'package:flutter_skeleton/models/user_model.dart';

class HomeViewModel with ChangeNotifier {
  UserModel userModel;
  BuildContext context;

  HomeViewModel({required this.userModel, required this.context});
}
