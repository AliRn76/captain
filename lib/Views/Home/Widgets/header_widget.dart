import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../../../Consts/colors.dart';
import '../../../Controllers/Home/home_controller.dart';

class MainHeaderWidget extends StatelessWidget {
  const MainHeaderWidget({Key? key, required this.controller})
      : super(key: key);

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: Get.height * .15,
      color: mainBgColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            children: [
              const Text(
                'Captain',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
              SizedBox(
                width: Get.width * .02,
              ),
              const Text(
                'MAFIA',
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
            ],
          ),
          Hero(
            tag: 'CaptainAnimation',
            child: SizedBox(
              height: Get.height * .3,
              width: Get.width / 2,
              child: Lottie.asset(
                'assets/anims/mafiaLogo.json',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
