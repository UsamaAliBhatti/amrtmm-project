// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';

abstract class NetworkInfo {
  Future<bool> isConnected();
}

class NetworkInfoImpl extends NetworkInfo {
  Dio dio;
  Connectivity connectivity;
  NetworkInfoImpl({
    required this.dio,
    required this.connectivity,
  });
  @override
  Future<bool> isConnected() async {
    try {
      // Check if the device is connected to a network (Wi-Fi or mobile)
      final connectivityResult = await connectivity.checkConnectivity();

      if (connectivityResult.isEmpty) {
        return false; // No network connection
      }

      // Verify actual internet access by sending an HTTP request
      final response = await dio
          .get('https://www.google.com')
          .timeout(const Duration(seconds: 5));
      if (response.statusCode == 200) {
        return true; // Internet is working
      }
    } catch (e) {
      return false;
    }
    return false; // Internet is not working
  }
}
