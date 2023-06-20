import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:captain/Consts/measures.dart';
import 'package:captain/Controllers/Home/home_controller.dart';

class BuildCollectorsModal extends StatelessWidget {
  const BuildCollectorsModal({Key? key, required this.controller})
      : super(key: key);

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height * .5,
      width: Get.width,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(16.0),
        ),
      ),
      padding: paddingAll16,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: const Icon(Icons.clear),
                onPressed: () {
                  Get.back();
                },
              ),
              const Text(
                'تیم گردآوردگان',
                style: TextStyle(
                  fontFamily: 'koodak',
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              )
            ],
          ),
          const Divider(),
          _buildItems(
            name: 'علی رجب نژاد',
            id: 0,
            role: 'توسعه دهنده',
            data1: 'https://alirn.ir',
            data2: '',
          ),
          const Divider(),
          _buildItems(
            name: 'محمدرضا سلطانی',
            data1: '09917347494',
            data2: 'https://www.instagram.com/mamarezasoltani/',
            role: 'تهیه کننده',
            id: 1,
          ),
          const Divider(),
          _buildItems(
            name: 'حسین خسروی',
            data1: '09104046914',
            data2: 'https://www.instagram.com/castlemafia_/',
            role: 'طراح',
            id: 1,
          ),
        ],
      ),
    );
  }

  Widget _buildItems({
    required String name,
    required String role,
    required String data1,
    required String data2,
    required int id,
  }) {
    return SizedBox(
      height: Get.height * .07,
      width: Get.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton(
            onPressed: () {
              controller.goData(
                data: data1,
                id: id,
              );
            },
            child: id == 0
                ? const FaIcon(FontAwesomeIcons.globe)
                : const FaIcon(FontAwesomeIcons.phone),
          ),
          id == 1 ? TextButton(
            onPressed: () {
              controller.goData(
                data: data2,
                id: id,
              );
            },
            child: const FaIcon(FontAwesomeIcons.instagram),
          ): const SizedBox(),
          Expanded(
            child: SizedBox(
              height: double.maxFinite,
              width: double.maxFinite,
              child: Column(
                children: [
                  Flexible(
                    flex: 1,
                    child: SizedBox(
                      height: double.maxFinite,
                      width: double.maxFinite,
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          role,
                          style: const TextStyle(
                            fontFamily: 'koodak',
                            fontSize: 10.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: SizedBox(
                      height: double.maxFinite,
                      width: double.maxFinite,
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          name,
                          style: const TextStyle(
                            fontFamily: 'koodak',
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
