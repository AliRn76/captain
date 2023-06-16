import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Models/Roles/roles_model.dart';
import '../../Views/ShowRoles/Widgets/show_role_content_alert.dart';

class ShowRolesController extends GetxController {
  List<RolesModel> selectedRolesList = [];

  @override
  void onInit() {
    initData();
    super.onInit();
  }

  void initData() {
    selectedRolesList = Get.arguments['rolesList'];
    selectedRolesList.shuffle();
  }

  void showRole({
    required RolesModel role,
  }) async {
    if(role.isShow.isFalse){
      showDialog(
        context: Get.context!,
        builder: (BuildContext context) => AlertDialog(
          contentPadding: EdgeInsets.zero,
          backgroundColor: Colors.transparent,
          content: ShowRoleContentAlert(
            role: role,
          ),
        ),
      ).then((value){
        // if (role.title == 'شهروند ساده') {
        //   int citizenCount = calcCitizenCount();
        //
        // }

        print(role);
        // اینجا یه رول داره isShow اش true میشه ولی وقتی نقش ما شهروند ساده است، تمام شهروند ساده ها رو انگار داره  true میکنه
        role.isShow(true);
      });
    }
  }

  // int calcCitizenCount(){
  //   int citizenCount = 0;
  //   for (var o in selectedRolesList){
  //     if (o.title == 'شهروند ساده'){
  //       citizenCount ++;
  //     }
  //   }
  //   return citizenCount;
  // }

  void refreshRoles(){
    for (RolesModel role in selectedRolesList){
      role.isShow(false);
    }
    selectedRolesList.shuffle(Random());
  }
}
