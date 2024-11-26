import 'package:ecommercedelivery/controller/homescreen_controller.dart';
import 'package:ecommercedelivery/core/constant/color.dart';
import 'package:ecommercedelivery/view/widget/home/custombottomappbarhome.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(HomeScreenControllerImp());
    return GetBuilder<HomeScreenControllerImp>(
        builder: (controller) => Scaffold(
              appBar: AppBar(
                title: Text(
                    controller.bottomappbar[controller.currentpage]['title']),
                actions: [
                  Container(
                    padding: const EdgeInsets.only(bottom: 6),
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.only(bottom: 7),
                          child: const Text(
                            'Logout',
                            style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                color: AppColor.grey),
                          ),
                        ),
                        IconButton(
                            onPressed: () {
                              controller.logout();
                            },
                            icon: const Icon(
                              Icons.logout_outlined,
                              size: 25,
                            )),
                      ],
                    ),
                  )
                ],
              ),
              bottomNavigationBar: const CustomBottomAppBarHome(),
              body: controller.listPage.elementAt(controller.currentpage),
            ));
  }
}
