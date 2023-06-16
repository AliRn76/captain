import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:captain/Consts/rolesData.dart';
import 'package:captain/Models/Category/category_model.dart';
import 'package:captain/Utils/rout_utils.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../Views/Home/Widgets/build_collectors_modal.dart';
import '../../Views/Home/Widgets/player_count_widget_dialog.dart';

class HomeController extends GetxController {
  RxDouble playerCount = 5.0.obs;

  RxDouble tvMafiaCount = 5.0.obs;

  List<CategoryModel> categoryList = [
    CategoryModel(
      id: 0,
      title: 'شروع بازی',
      isSelected: false.obs,
    ),
    CategoryModel(
      id: 1,
      title: 'مافیا تلویزیون ',
      isSelected: false.obs,
    ),
    CategoryModel(
      id: 2,
      title: 'مافیا فیلیمو  (به زودی)',
      isSelected: false.obs,
    ),
    CategoryModel(
      id: 3,
      title: 'نقش ها',
      isSelected: false.obs,
    ),
    CategoryModel(
      id: 4,
      title: 'گردآورندگان',
      isSelected: false.obs,
    ),
  ];

  void tapGame({
    required int id,
  }) {
    switch (id) {
      case 0:
        {
          showPlayerCountDialog(count: 6.0, id: id);
          break;
        }
      case 1:
        {
          showPlayerCountDialog(count: 7.0, id: id);
          break;
        }
      // case 2:
      //   {
      //     showPlayerCountDialog(8.0);
      //     break;
      //   }
      case 3:
        {
          Get.toNamed(NameRouts.roles);
          break;
        }
      case 4:
        {
          showCollectorsModal();
          break;
        }
    }
  }

  void showPlayerCountDialog({
    required double count,
    required int id,
  }) async {
    playerCount(count);
    var goNext = await showDialog(
      context: Get.context!,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.transparent,
          contentPadding: EdgeInsets.zero,
          content: PlayerCountWidgetDialog(
            controller: this,
          ),
        );
      },
    );

    if (goNext is bool && goNext) {
      switch (id) {
        case 0:
          {
            Get.toNamed(NameRouts.selectRoles, arguments: {
              'playerCount': playerCount.value.toInt(),
              'initRoles': rolesList
            });
            break;
          }
        case 1:
          {
            Get.toNamed(NameRouts.selectRoles, arguments: {
              'playerCount': playerCount.value.toInt(),
              'initRoles': investigatorList,
            });
            break;
          }
      }
    }
  }

  void changePosition({
    required double newPosition,
  }) {
    if (newPosition >= 5) {
      playerCount(newPosition);
    }
  }

  void showCollectorsModal() async {
    showModalBottomSheet(
      context: Get.context!,
      backgroundColor: Colors.transparent,
      isDismissible: true,
      builder: (BuildContext context) {
        return BuildCollectorsModal(
          controller: this,
        );
      },
    );
  }

  void goData({
    required String data,
    required int id,
  }) {
    if (id == 0) {
      launchUrl(
        Uri.parse(
          data,
        ),
      );
    } else {
      launchUrl(
        Uri.parse('tel: $data'),
      );
    }
  }
}
