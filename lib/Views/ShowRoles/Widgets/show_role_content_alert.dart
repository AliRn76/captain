import 'package:auto_size_text/auto_size_text.dart';
import 'package:captain/Consts/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:captain/Consts/measures.dart';
import 'package:captain/Models/Roles/roles_model.dart';

import '../../../Utils/view_utils.dart';

class ShowRoleContentAlert extends StatelessWidget {
  const ShowRoleContentAlert({Key? key, required this.role}) : super(key: key);

  final RolesModel role;

  @override
  Widget build(BuildContext context) {
    Color roleColor = role.role != 0
        ? Colors.greenAccent.shade200
        : Colors.redAccent.shade200;
    return Container(
      width: Get.width,
      height: Get.height * .8,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          width: 4.0,
          color: roleColor,
        ),
        borderRadius: radiusAll16,
      ),
      padding: paddingAll18,
      child: Column(
        children: [
          AutoSizeText(
            role.title,
            maxLines: 1,
            maxFontSize: 40.0,
            minFontSize: 32.0,
            style: TextStyle(
              fontSize: 32.0,
              fontFamily: 'koodak',
              shadows: shadow(),
            ),
          ),
          SizedBox(
            width: Get.width * 0.5,
            height: Get.width * 0.5,
            child: Image.asset("assets/images/${role.title}.jpg"),
          ),
          SizedBox(
            height: Get.height * .02,
          ),
          Text(
            role.description,
            textAlign: TextAlign.right,
            style: const TextStyle(
              fontSize: 14.0,
              fontFamily: 'koodak',
            ),
          ),
          SizedBox(
            height: Get.height * .02,
          ),
          Expanded(
            child: SizedBox(
              height: double.maxFinite,
              width: Get.width,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: role.options.length,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        ':نکته ${persianNumber(
                          number: (index + 1).toString(),
                        )}',
                        style: const TextStyle(
                          fontSize: 12.0,
                          fontFamily: 'koodak',
                        ),
                      ),
                      Text(
                        role.options[index],
                        textAlign: TextAlign.right,
                        style: const TextStyle(
                          fontSize: 14.0,
                          fontFamily: 'koodak',
                        ),
                      ),
                      const SizedBox(height: 10.0),
                    ],
                  );
                },
              ),
            ),
          ),
          TextButton(
            onPressed: () =>  Get.back(),
            style: ButtonStyle(
              shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    side: BorderSide(
                      color: roleColor,
                      width: 1.0,
                      style: BorderStyle.solid,
                    )
                  )
              ),
              // backgroundColor: MaterialStateColor.resolveWith((states) => roleColor.withOpacity(.1)),
            ),
            child: Text(
              '     متوجه شدم     ',
              style: TextStyle(
                fontSize: 16.0,
                fontFamily: 'koodak',
                fontWeight: FontWeight.bold,
                color: mainBgColor,
              ),
            ),
          )
        ],
      ),
    );
  }
}
