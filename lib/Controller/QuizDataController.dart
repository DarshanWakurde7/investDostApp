import 'dart:ffi';

import 'package:get/get.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:investdost/Models/QuizPojo.dart';
import 'package:investdost/apiCalls/AllApiCalls.dart';

class QuizController extends GetxController{


  List<QuizPojio> quizdata=<QuizPojio> [].obs;

  var isloading=true.obs;

  @override
  void onInit() {
    // TODO: implement onInit
   
    super.onInit();
  }


Future<void> getQuizData(int id)async{
quizdata.clear();
print(id);

quizdata=await ApiCalls.GetQuizData(id);

if(quizdata.isEmpty){
  isloading(true);
}
else{
  isloading(false);
}





}





}