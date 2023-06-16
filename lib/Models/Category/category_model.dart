import 'package:get/get.dart';

class CategoryModel {
  int id;
  String title;
  RxBool isSelected;

  CategoryModel({
    required this.id,
    required this.title,
    required this.isSelected,
  });
}
