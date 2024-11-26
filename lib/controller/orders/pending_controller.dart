import 'package:ecommercedelivery/controller/homescreen_controller.dart';
import 'package:ecommercedelivery/core/class/statusrequest.dart';
import 'package:ecommercedelivery/core/functions/handingdatacontroller.dart';
import 'package:ecommercedelivery/core/services/services.dart';
import 'package:ecommercedelivery/data/datasource/remote/orders/pending_data.dart';
import 'package:ecommercedelivery/data/model/ordersmodel.dart';
import 'package:get/get.dart';

class OrdersPendingController extends GetxController {
  OrdersPendingData ordersPendingData = OrdersPendingData(Get.find());
  HomeScreenControllerImp homeController = Get.find();

  List<OrdersModel> data = [];

  late StatusRequest statusRequest;

  MyServices myServices = Get.find();

  String printPaymentMethod(String val) {
    if (val == "0") {
      return "Cash On Delivery";
    } else {
      return "Payment Card";
    }
  }

  getOrders() async {
    data.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await ordersPendingData.getData();
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        List listdata = response['data'];
        data.addAll(listdata.map((e) => OrdersModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }

  approveOrders(String orderid, String usersid) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await ordersPendingData.approveData(
        orderid,
        usersid,
        myServices.sharedPreferences.getString('id')!,
        homeController.accessToken);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        getOrders();
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }

  refrehOrder() {
    getOrders();
  }

  @override
  void onInit() {
    getOrders();
    super.onInit();
  }
}
