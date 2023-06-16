import 'package:get/get.dart';

class RolesModel {
  int id;
  int role;
  String title;
  String description;
  List<String> options;
  RxBool isSelected;
  RxBool isShow;

  RolesModel({
    required this.id,
    required this.role,
    required this.title,
    required this.description,
    required this.options,
    required this.isSelected,
    required this.isShow,
  });
}
