import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:captain/Consts/measures.dart';
import 'package:captain/Controllers/Home/home_controller.dart';
import 'package:captain/Utils/view_utils.dart';

import '../../../Consts/colors.dart';

class PlayerCountWidgetDialog extends StatelessWidget {
  const PlayerCountWidgetDialog({Key? key, required this.controller})
      : super(key: key);

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height * .27,
      width: Get.width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: radiusAll24,
        border: Border.all(
          color: secondColor,
          width: 3.0,
        ),
      ),
      padding: paddingAll12,
      child: Column(
        children: [
          const AutoSizeText(
            'تعداد بازیکن ها را مشخص کنید',
            style: TextStyle(
              fontFamily: 'koodak',
            ),
          ),
          Obx(
            () => Slider(
              min: 0.0,
              thumbColor: secondColorLight,
              activeColor: secondColor,
              inactiveColor: Colors.white,
              divisions: 100,
              max: 100.0,
              label: controller.playerCount.value.toInt().toString(),
              value: controller.playerCount.value,
              onChanged: (value) async {
                controller.changePosition(
                  newPosition: value,
                );
              },
            ),
          ),
          SizedBox(
            height: Get.height * .02,
          ),
          Obx(
            () => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'نفر',
                  style: TextStyle(
                    fontFamily: 'koodak',
                  ),
                ),
                SizedBox(
                  width: Get.width * .02,
                ),
                Text(
                  persianNumber(
                    number: controller.playerCount.value.toInt().toString(),
                  ),
                  style: const TextStyle(
                    fontFamily: 'koodak',
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: Get.height * .04,
          ),
          Expanded(
            child: SizedBox(
              height: double.maxFinite,
              width: double.maxFinite,
              child: Row(
                children: [
                  Flexible(
                    flex: 1,
                    child: InkWell(
                      onTap: () {
                        Get.back(
                          result: false,
                        );
                      },
                      child: Container(
                        height: double.maxFinite,
                        width: double.maxFinite,
                        decoration: BoxDecoration(
                          color: Colors.grey[400],
                          borderRadius: radiusAll8,
                        ),
                        child: const Center(
                          child: AutoSizeText(
                            'لغو',
                            style: TextStyle(
                              color: Colors.black87,
                              fontSize: 16.0,
                              fontFamily: 'koodak',
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: Get.width * .02,
                  ),
                  Flexible(
                    flex: 2,
                    child: InkWell(
                      onTap: () {
                        Get.back(
                          result: true,
                        );
                      },
                      child: Container(
                        height: double.maxFinite,
                        width: double.maxFinite,
                        decoration: BoxDecoration(
                          color: secondColor,
                          borderRadius: radiusAll8,
                          boxShadow: shadow(),
                        ),
                        child: const Center(
                          child: AutoSizeText(
                            'تایید  و  ادامه',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.0,
                              fontFamily: 'koodak',
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
