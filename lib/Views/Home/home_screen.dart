import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:captain/Consts/colors.dart';

import '../../Controllers/Home/home_controller.dart';
import 'Widgets/build_main_grid_view_widget.dart';
import 'Widgets/header_widget.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainBgColor,
      body: SafeArea(
        child: Container(
          height: Get.height,
          width: Get.width,
          decoration: BoxDecoration(
            color: mainBgColor,
          ),
          child: Column(
            children: [
              MainHeaderWidget(
                controller: controller,
              ),
              // SizedBox(),
              BuildMainGridViewWidget(
                controller: controller,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
