import 'package:ecommercedelivery/core/class/statusrequest.dart';
import 'package:ecommercedelivery/core/functions/handingdatacontroller.dart';
import 'package:ecommercedelivery/data/datasource/remote/orders/details_data.dart';
import 'package:ecommercedelivery/data/model/cartmodel.dart';
import 'package:ecommercedelivery/data/model/ordersmodel.dart';
import 'package:get/get.dart';

class OrdersDetailsController extends GetxController {
  OrdersDetailsData ordersDetailsData = OrdersDetailsData(Get.find());

  List<CartModel> data = [];

  late StatusRequest statusRequest;

  late OrdersModel ordersModel;

  double? lat;
  double? long;

  @override
  void onInit() {
    ordersModel = Get.arguments['ordersmodel'];
    getData();
    super.onInit();
  }

  getData() async {
    statusRequest = StatusRequest.loading;

    var response = await ordersDetailsData.getData(ordersModel.ordersId!);

    print("=============================== Controller $response ");

    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        List listdata = response['data'];
        data.addAll(listdata.map((e) => CartModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }
}
