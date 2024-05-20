import 'package:get/get.dart';
import 'package:investdost/Models/Roommodel.dart';
import 'package:investdost/apiCalls/AllApiCalls.dart';



class myController extends GetxController{


var LoadingContent=true.obs;
List<RoomModel> myroom=<RoomModel>[].obs;
List<RomTopic> topicroom=<RomTopic>[].obs;


@override
  void onInit() {
    // TODO: implement onInit
    fetchAllrooms();

    super.onInit();
  }


void fetchAllrooms()async{
LoadingContent(true);

myroom=await ApiCalls.FetchAllRooms();

if(myroom.isNotEmpty){
  LoadingContent(false);
}
else{
  LoadingContent(true);
   print("ok2");
}

}
Future<void> fetchRoomTopics(int id)async{
LoadingContent(true);


topicroom=await ApiCalls.FetchAllTopics(id);



if(myroom.isNotEmpty){
  LoadingContent(false);
  
}
else{
  LoadingContent(true);
}

}


  


}