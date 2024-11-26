import 'package:ecommercedelivery/core/class/crud.dart';
import 'package:ecommercedelivery/linkapi.dart';

class OrdersPendingData {
  Crud crud;
  OrdersPendingData(this.crud);
  getData() async {
    var response = await crud.postData(AppLink.pendingorders, {});
    return response.fold((l) => l, (r) => r);
  }

  approveData(String ordersid, String usersid, String deliveryid,
      String accessToken) async {
    var response = await crud.postData(AppLink.ordersapprove, {
      "ordersid": ordersid,
      "usersid": usersid,
      "deliveryid": deliveryid,
      'accessToken': accessToken
    });
    return response.fold((l) => l, (r) => r);
  }
}
