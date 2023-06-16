import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Consts/colors.dart';
import '../../Controllers/Roles/roles_controller.dart';

class RolesScreen extends StatelessWidget {
  RolesScreen({Key? key}) : super(key: key);

  final RolesController controller = Get.put(RolesController());

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
                  ],
                ),
              ),
              Expanded(
                child: SizedBox(
                  height: double.maxFinite,
                  width: double.maxFinite,
                  child: Obx(
                    () => (controller.isLoaded.isTrue)
                        ? _buildRolesItem()
                        : const Center(
                            child: CircularProgressIndicator(),
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

  Widget _buildRolesItem() {
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      itemCount: controller.showList.length,
      separatorBuilder: (BuildContext context, int index) {
        return const Divider();
      },
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(12.0)),
              border: Border.all(
                width: 2.0,
                color: mainBgColor,
              ),
            ),
            child: TextButton(
              onPressed: () {
                controller.showRole(
                  role: controller.showList[index],
                );
              },
              child: Text(
                controller.showList[index].title,
                style: const TextStyle(
                  fontFamily: 'koodak',
                  fontSize: 14.0,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
