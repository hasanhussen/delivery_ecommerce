import 'package:ecommercedelivery/core/class/crud.dart';
import 'package:ecommercedelivery/linkapi.dart';

class OrdersAcceptedData {
  Crud crud;
  OrdersAcceptedData(this.crud);
  getData(String id) async {
    var response = await crud.postData(AppLink.ordersaccepted, {'id': id});
    return response.fold((l) => l, (r) => r);
  }

  doneOrder(String ordersid, String usersid, String accessToken) async {
    var response = await crud.postData(AppLink.ordersdone,
        {'ordersid': ordersid, 'usersid': usersid, 'accessToken': accessToken});
    return response.fold((l) => l, (r) => r);
  }
}
