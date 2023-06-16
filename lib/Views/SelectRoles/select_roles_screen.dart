import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:captain/Consts/measures.dart';
import 'package:captain/Utils/view_utils.dart';
import 'package:captain/Views/SelectRoles/Widgets/build_citizen_part_widget.dart';
import '../../Consts/colors.dart';
import '../../Controllers/SelectRoles/select_roles_controller.dart';
import 'Widgets/build_independent_part_widget.dart';
import 'Widgets/build_mafia_part_widget.dart';

class SelectRolesScreen extends StatelessWidget {
  SelectRolesScreen({Key? key}) : super(key: key);

  final SelectRolesController controller = Get.put(SelectRolesController());

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
                        Get.back();
                      },
                      child: const Icon(
                        Icons.arrow_back_ios_rounded,
                        color: Colors.black,
                      ),
                    ),
                    const Text(
                      'انتخاب نقش ها',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.0,
                        fontFamily: 'koodak',
                      ),
                    ),
                    Obx(
                      () => (controller.playerCount.value == 0)
                          ? InkWell(
                              onTap: () {
                                controller.goToShowRolesPage();
                              },
                              child: const Icon(
                                Icons.check,
                                color: Colors.black,
                              ),
                            )
                          : Text(
                              persianNumber(
                                number: controller.playerCount.value.toString(),
                              ),
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 16.0,
                                fontFamily: 'koodak',
                              ),
                            ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: SizedBox(
                  height: double.maxFinite,
                  width: Get.width,
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      children: [
                        _buildSeparator(
                          title: 'نقش های شهروند',
                        ),
                        BuildCitizenPartWidget(
                          controller: controller,
                        ),
                        _buildSeparator(
                          title: 'نقش های مافیا',
                        ),
                        BuildMafiaPartWidget(
                          controller: controller,
                        ),
                        if(controller.hasIndependentRoles)_buildSeparator(
                          title: 'نقش های مستقل',
                        ),
                        if(controller.hasIndependentRoles)BuildIndependentPartWidget(
                          controller: controller,
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSeparator({
    required String title,
  }) {
    return Container(
      width: Get.width,
      height: Get.height * .05,
      margin: paddingSymmetricV20,
      decoration: BoxDecoration(
        color: mainBgColor,
        boxShadow: shadow(offset: const Offset(0.0, 2.0)),
      ),
      child: Center(
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 16.0,
            fontFamily: 'koodak',
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
