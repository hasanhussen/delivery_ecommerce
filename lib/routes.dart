import 'package:ecommercedelivery/core/constant/routes.dart';
import 'package:ecommercedelivery/core/middleware/mymiddleware.dart';
import 'package:ecommercedelivery/view/screen/auth/forgetpassword/forgetpassword.dart';
import 'package:ecommercedelivery/view/screen/auth/login.dart';
import 'package:ecommercedelivery/view/screen/auth/forgetpassword/resetpassword.dart';
import 'package:ecommercedelivery/view/screen/auth/forgetpassword/success_resetpassword.dart';
import 'package:ecommercedelivery/view/screen/auth/forgetpassword/verifycode.dart';
import 'package:ecommercedelivery/view/screen/homescreen.dart';
import 'package:ecommercedelivery/view/screen/language.dart';
import 'package:ecommercedelivery/view/screen/onboarding.dart';
import 'package:ecommercedelivery/view/screen/orders/archive.dart';
import 'package:ecommercedelivery/view/screen/orders/details.dart';
import 'package:ecommercedelivery/view/screen/orders/pending.dart';
import 'package:get/get.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(
      name: "/", page: () => const Language(), middlewares: [MyMiddleWare()]),
  // GetPage(name: "/", page: () =>   TestView()),
//  Auth
  GetPage(name: AppRoute.login, page: () => const Login()),
  GetPage(name: AppRoute.forgetPassword, page: () => const ForgetPassword()),
  GetPage(name: AppRoute.verfiyCode, page: () => const VerfiyCode()),
  GetPage(name: AppRoute.resetPassword, page: () => const ResetPassword()),
  GetPage(
      name: AppRoute.successResetpassword,
      page: () => const SuccessResetPassword()),
  GetPage(name: AppRoute.onBoarding, page: () => const OnBoarding()),
  //
  GetPage(name: AppRoute.homepage, page: () => const HomeScreen()),
  GetPage(name: AppRoute.orderspending, page: () => const OrdersPending()),
  GetPage(name: AppRoute.ordersarchive, page: () => const OrdersArchiveView()),
  GetPage(name: AppRoute.ordersdetails, page: () => const OrdersDetails()),
];
