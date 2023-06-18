import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:captain/Consts/rolesData.dart';
import 'package:captain/Models/Roles/roles_model.dart';

import '../../Views/ShowRoles/Widgets/show_role_content_alert.dart';

class RolesController extends GetxController{

  List<RolesModel> showList = [];

  RxBool isLoaded = false.obs;

  @override
  void onInit() {
    initData();
    super.onInit();
  }

  void initData()async {
    for (var o in rolesList) {
      showList.add(o);
    }
    for (var o in investigatorList) {
      bool alreadyExists = false;
      for (var m in showList) {
        if(m.title == o.title){
          alreadyExists = true;
          break;
        }
      }
      if (!alreadyExists){
        showList.add(o);
      }
      // if(!showList.contains(o)){
      // }
    }

    // isLoaded.value = true;
    isLoaded(true);
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
      ).then((value){});
    }
  }



}