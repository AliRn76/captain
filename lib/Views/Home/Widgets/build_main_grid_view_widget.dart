import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:captain/Consts/measures.dart';
import 'package:captain/Models/Category/category_model.dart';

import '../../../Consts/colors.dart';
import '../../../Controllers/Home/home_controller.dart';

class BuildMainGridViewWidget extends StatelessWidget {
  const BuildMainGridViewWidget({Key? key, required this.controller})
      : super(key: key);

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: secondColorLight,
        child: SizedBox(
          height: double.maxFinite,
          width: double.maxFinite,
          child: GridView.builder(
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              childAspectRatio: (1 / .31),
            ),
            itemBuilder: (_, index) => _buildCategoryItem(
              category: controller.categoryList[index],
              index: index,
            ),
            itemCount: controller.categoryList.length,
          ),
        ),
      )
    );
  }

  Widget _buildCategoryItem({
    required CategoryModel category,
    required int index,
  }) {
    return AnimationConfiguration.synchronized(
      child: SlideAnimation(
        duration: Duration(milliseconds: (index * 1000)),
        child: FadeInAnimation(
          child: InkWell(
            onTap: (){
              controller.tapGame(id:category.id);
            },
            child: Container(
              margin: paddingAll12,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: radiusAll12,
                boxShadow: shadow(),
              ),
              child: Center(
                child: AutoSizeText(
                  category.title,
                  style: const TextStyle(
                    fontFamily: 'koodak',
                    color: Colors.white,
                    fontSize: 16.0,
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
