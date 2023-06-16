import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:captain/Consts/colors.dart';
import 'package:captain/Utils/view_utils.dart';

import '../../Consts/measures.dart';
import '../../Controllers/ShowRoles/show_roles_controller.dart';
import '../../Models/Roles/roles_model.dart';

class ShowRolesScreen extends StatelessWidget {
  ShowRolesScreen({Key? key}) : super(key: key);

  final ShowRolesController controller = Get.put(ShowRolesController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: Get.height,
        width: Get.width,
        decoration: BoxDecoration(
          color: secondColorLight,
        ),
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(
                height: Get.height * .03,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        controller.refreshRoles();
                        Get.back();
                      },
                      child: const Icon(
                        Icons.arrow_back_ios_rounded,
                        color: Colors.black,
                      ),
                    ),
                    const Text(
                      'نمایش نقش ها',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.0,
                        fontFamily: 'koodak',
                      ),
                    ),
                    // InkWell(
                    //   onTap: () => controller.refreshRoles(),
                    //   child: const Icon(
                    //     Icons.refresh,
                    //     color: Colors.black,
                    //   ),
                    // ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  padding: paddingAll12,
                  height: double.maxFinite,
                  width: Get.width,
                  child: Wrap(
                    spacing: 8.0, // gap between adjacent chips
                    runSpacing: 4.0, // gap between lines
                    children: <Widget>[..._generateTags()],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _generateTags() {
    return controller.selectedRolesList
        .map((tag) => _getChip(role: tag))
        .toList();
  }

  _getChip({required RolesModel role}) {
    return AnimationConfiguration.synchronized(
      child: SlideAnimation(
        duration: const Duration(milliseconds: 400),
        child: FlipAnimation(
          duration: const Duration(milliseconds: 400),
          child: Obx(
            () => GestureDetector(
              onTap: () {
                controller.showRole(role: role);
              },
              child: Chip(
                backgroundColor: secondColor,
                avatar: (role.isShow.isTrue)
                    ? const Icon(
                        Icons.remove_red_eye_rounded,
                        color: Colors.white24,
                      )
                    : const Icon(
                        Icons.remove_red_eye_outlined,
                        color: Colors.white,
                      ),
                label: AutoSizeText(
                  persianNumber(
                      number: (controller.selectedRolesList.indexOf(role) + 1)
                          .toString()),
                  maxFontSize: 20.0,
                  minFontSize: 12.0,
                  maxLines: 1,
                  style: TextStyle(
                    color: (role.isShow.isTrue) ? Colors.white24 : Colors.white,
                    fontSize: 16.0,
                    fontFamily: 'koodak',
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
