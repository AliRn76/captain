import 'package:flutter/material.dart';
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
            mobile: 'https://alirn.ir/',
          ),
          const Divider(),
          _buildItems(
            name: 'محمدرضا سلطانی',
            mobile: '09121086430',
            role: 'تهیه کننده',
            id: 1,
          ),
          const Divider(),
          _buildItems(
            name: 'حسین خسروی',
            mobile: '09387126623',
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
    required String mobile,
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
                data: mobile,
                id:id,
              );
            },
            child: const Text(
              'راه ارتباطی',
              style: TextStyle(
                fontFamily: 'koodak',
                fontSize: 12.0,
              ),
            ),
          ),
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
