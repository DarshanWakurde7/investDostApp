import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GetInternet extends GetxController{

    Connectivity connectivity=Connectivity();

    @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    connectivity.onConnectivityChanged.listen(NetConnectivityResult);
  }

  NetConnectivityResult(List<ConnectivityResult> cr){

    if(cr.contains(ConnectivityResult.none)){
     Get.rawSnackbar(shouldIconPulse: true,title: "Poor Internet Connection",message: "Sorry Try or Check your Internet Again",icon: Icon(Icons.wifi_off),isDismissible: true,backgroundColor: Colors.redAccent,duration: Duration(days:1));
    }else{
      if(Get.isSnackbarOpen){
        Get.closeCurrentSnackbar();
      }
    }

  }

}