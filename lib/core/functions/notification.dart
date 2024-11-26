import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:googleapis_auth/auth_io.dart';
import 'package:ecommercedelivery/core/constant/const_data.dart';
import 'package:http/http.dart' as http;

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
      final accessCredentials = await obtainAccessCredentialsViaServiceAccount(
        accountCredentials,
        scopes,
        client,
      );
      ConstData.accessToken = accessCredentials.accessToken.data;
      print('Access Token: $ConstData.accessToken');
    } catch (e) {
      print('Error obtaining access token: $e');
    } finally {
      client.close();
    }
  } catch (e) {
    print('Error loading service account JSON: $e');
  }
}
