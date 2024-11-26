import 'package:ecommercedelivery/controller/homescreen_controller.dart';
import 'package:ecommercedelivery/view/widget/home/custombuttonappbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomBottomAppBarHome extends StatelessWidget {
  const CustomBottomAppBarHome({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeScreenControllerImp>(
        builder: (controller) => BottomAppBar(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ...List.generate(controller.listPage.length, ((index) {
                  return CustomButtonAppBar(
                      textbutton: controller.bottomappbar[index]['title'],
                      icondata: controller.bottomappbar[index]['icon'],
                      onPressed: () {
                        controller.changePage(index);
                      },
                      active: controller.currentpage == index ? true : false);
                }))
              ],
            )));
  }
}
