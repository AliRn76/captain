import 'package:get/get.dart';
import 'package:captain/Models/Roles/roles_model.dart';
import 'package:captain/Utils/rout_utils.dart';

import '../../Utils/view_utils.dart';

class SelectRolesController extends GetxController {
  RxInt playerCount = 0.obs;
  int player = 0;
  int goodRoles = 0;
  int badRoles = 0;
  int citizenCount = 0;
  bool hasIndependentRoles = false;

  List<RolesModel> selectedRolesList = [];
  List<RolesModel> initRolesList = [];

  @override
  void onInit() {
    initData();
    super.onInit();
  }

  void initData() async {
    playerCount.value = Get.arguments['playerCount'];
    initRolesList = Get.arguments['initRoles'];

    player = playerCount.value;

    badRoles = player ~/ 3;
    goodRoles = player - badRoles;

    for (var o in initRolesList) {
      o.isSelected(false);
      if (o.role == 2) {
        hasIndependentRoles = true;
      }
      if (o.title.contains('شهروند ساده')){
        o.title = 'شهروند ساده';
      }
    }
  }

  void checkRole({
    required RolesModel role,
  }) {
    // Unselected
    if (role.isSelected.isTrue) {
      role.isSelected(false);
      playerCount.value++;

      // Undo it
      if (role.role == 1) {
        if (role.title.contains('شهروند ساده')) {
          // If it was شهروند ساده

          goodRoles = citizenCount;
          playerCount.value = playerCount.value + citizenCount - 1;
          citizenCount = 0;

          // Pick all the selected Citizen roles
          List<RolesModel> removeRoles = [];
          for (var r in selectedRolesList){
            if (r.title.contains('شهروند ساده')){
              removeRoles.add(r);
            }
          }
          // Remove all the selected Citizen roles
          for (var v in removeRoles){
            selectedRolesList.remove(v);
          }
          role.title = 'شهروند ساده';
        }else{
          selectedRolesList.remove(role);
          goodRoles++;
        }
      } else {
        selectedRolesList.remove(role);
        badRoles++;
      }
      return;
    }

    // Selected
    if (playerCount.value == 0) return;

    if (role.role == 1) {
      // If it was citizen
      if (goodRoles > 0) {
        role.isSelected(true);

        if (role.title.contains('شهروند ساده')) {
          citizenCount = goodRoles;
          goodRoles = 0;
          playerCount.value = playerCount.value - citizenCount;
          for (var i = 0; i < citizenCount; i++) {
            RolesModel newRole = RolesModel(
              id: role.id + 100,
              role: role.role,
              title: role.title,
              description: role.description,
              options: role.options,
              isSelected: true.obs,
              isShow: false.obs,
            );
            selectedRolesList.add(newRole);
          }
          role.title = "${role.title}  x  ${persianNumber(number: citizenCount.toString())}";
        } else {
          goodRoles--;
          playerCount.value--;
          selectedRolesList.add(role);
        }
      }
    } else {
      // It was mafia
      if (badRoles > 0) {
        role.isSelected(true);
        badRoles--;
        playerCount.value--;
        selectedRolesList.add(role);
      }
    }
  }

  void goToShowRolesPage() {
    Get.toNamed(NameRouts.showRoles, arguments: {
      'rolesList': selectedRolesList,
    });
  }
}
