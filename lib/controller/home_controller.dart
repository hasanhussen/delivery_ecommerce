import 'dart:convert';

import 'package:ecommercedelivery/core/class/statusrequest.dart';
import 'package:ecommercedelivery/core/constant/routes.dart';
import 'package:ecommercedelivery/core/functions/handingdatacontroller.dart';
import 'package:ecommercedelivery/core/services/services.dart';
import 'package:ecommercedelivery/data/datasource/remote/home_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:googleapis_auth/auth_io.dart';
import 'package:http/http.dart' as http;

abstract class HomeController extends SearchMixController {
  initialData();
  getdata();
  goToItems(List categories, int selectedCat, String categoryid);
}

class HomeControllerImp extends HomeController {
  MyServices myServices = Get.find();

  String? username;
  String? id;
  String? lang;
  String accessToken = "";

  HomeData homedata = HomeData(Get.find());

  // List data = [];
  List categories = [];
  List items = [];
  // List items = [];

  @override
  initialData() {
    // myServices.sharedPreferences.clear() ;
    lang = myServices.sharedPreferences.getString("lang");
    username = myServices.sharedPreferences.getString("username");
    id = myServices.sharedPreferences.getString("id");
  }

  @override
  void onInit() {
    search = TextEditingController();
    getdata();
    initialData();
    getAccessToken();
    super.onInit();
  }

  @override
  getdata() async {
    statusRequest = StatusRequest.loading;
    var response = await homedata.getData();
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        categories.addAll(response['categories']['data']);
        items.addAll(response['items']['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  goToItems(categories, selectedCat, categoryid) {
    Get.toNamed(AppRoute.items, arguments: {
      "categories": categories,
      "selectedcat": selectedCat,
      "catid": categoryid
    });
  }

  Future<void> getAccessToken() async {
    try {
      final serviceAccountJson = await rootBundle.loadString(
          'assets/ecommerce-d4136-firebase-adminsdk-969x0-00fad52f32.json');
      final accountCredentials = ServiceAccountCredentials.fromJson(
        json.decode(serviceAccountJson),
      );
      const scopes = ['https://www.googleapis.com/auth/firebase.messaging'];
      final client = http.Client();
      try {
        final accessCredentials =
            await obtainAccessCredentialsViaServiceAccount(
          accountCredentials,
          scopes,
          client,
        );
        accessToken = accessCredentials.accessToken.data;
        print('Access Token: $accessToken');
      } catch (e) {
        print('Error obtaining access token: $e');
      } finally {
        client.close();
      }
    } catch (e) {
      print('Error loading service account JSON: $e');
    }
  }

  goToPageProductDetails(itemsModel) {
    Get.toNamed("productdetails", arguments: {"itemsmodel": itemsModel});
  }
}

class SearchMixController extends GetxController {
  late StatusRequest statusRequest;
  HomeData homedata = HomeData(Get.find());

  bool isSearch = false;
  TextEditingController? search;
  checkSearch(val) {
    if (val == "") {
      statusRequest = StatusRequest.none;
      isSearch = false;
    }
    update();
  }
}
