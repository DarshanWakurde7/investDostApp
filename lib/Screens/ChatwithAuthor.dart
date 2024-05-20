
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:investdost/Models/AuthorChatPojo.dart';
import 'package:investdost/widgets/ChatImage.dart';
import 'package:investdost/widgets/ImageSendByAuthor.dart';
import 'package:investdost/widgets/SenderMessae.dart';
import 'package:investdost/widgets/UserMessage.dart';
import 'package:investdost/apiCalls/AllApiCalls.dart';

class ChatwithAuthor extends StatefulWidget {
  const ChatwithAuthor({super.key,required this.Authorname,required this.Authorid,required this.imageString,required this.AuthorImage});
  final String Authorname,AuthorImage;
    final int Authorid;
    final String imageString;
  
  @override
  State<ChatwithAuthor> createState() => _ChatwithAuthorState();
}

class _ChatwithAuthorState extends State<ChatwithAuthor> {

List<messageDart> messages=[];
  TextEditingController message =TextEditingController();
   final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
@override
  void initState() {

      getAllChats();

    super.initState();
  }

void getAllChats()async{
     messages= await ApiCalls.FetchAuthorsChats(widget.Authorid);
      setState(() {
      messages.reversed;
      });
}



File imagefile=File("");
Future<void> getImageData()async{

  final ImagePicker _picker = ImagePicker();
      final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
   if(image!=null){
setState(() {

  imagefile=File(image.path);
});
 }

if(image!=null){

  scaffoldKey.currentState?.showBottomSheet(
    backgroundColor: Colors.white.withOpacity(0.3),
    (context) {
    return Container(
      height: MediaQuery.of(context).size.height*0.7,
      width: double.infinity,
        color:Colors.white.withOpacity(0.3),
      child: Column(
        children: [
          SizedBox(height: 10,),
          Text("Image Preview",style: TextStyle(fontSize: 22,fontWeight: FontWeight.w400,backgroundColor: Colors.amber.shade300),),
          SizedBox(height: 10,),
          Container(height: MediaQuery.of(context).size.height*0.4,
          margin: EdgeInsets.all(8.0),
          
          decoration: BoxDecoration(image: DecorationImage(image: FileImage(File(image.path)))),),
          Padding(
            padding: const EdgeInsets.fromLTRB(5.0,8,15,0),
            child: Align(
              alignment: Alignment.bottomRight,
              child: ElevatedButton(
                style: ButtonStyle(surfaceTintColor: MaterialStatePropertyAll(Colors.white)),
                onPressed: ()async{
                  await ApiCalls.sendImageMessage(imagefile,widget.Authorid);
                  Navigator.pop(context);
                  getAllChats();
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CircleAvatar(backgroundImage: NetworkImage("https://investdost-test.portalwiz.in/investdostapi/storage/app/public/${widget.AuthorImage}"),radius: 12,),
                    SizedBox(width: 5,),
                    Text("Send",style: TextStyle(fontSize: 16),),
                  ],
                )),
            ),
          ),
        ],
      ));
  });
}
    
}







  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
      
          Text(widget.Authorname,style: TextStyle(fontWeight: FontWeight.w400),),
                    CircleAvatar(backgroundImage: NetworkImage("https://investdost-test.portalwiz.in/investdostapi/storage/app/public/${widget.AuthorImage}")),

        ],
      ),centerTitle: true,backgroundColor: Colors.amber.shade400,),
      body:SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
        
          
        
        
        
        Container(
        height: MediaQuery.of(context).size.height*0.81,
        
        child:ListView.builder(
          reverse: true,
          itemCount: messages.length,
          itemBuilder: (context,ind){
              
        DateTime dateTimedata=DateTime.parse(messages[ind].createdAt??"2024-04-17T06:28:23.000000Z");
         String period = dateTimedata.hour >= 12 ? 'PM' : 'AM';
          return (messages[ind].senderId==widget.Authorid)?((messages[ind].type??"0")=="2")?ImageSendByuser(image: "https://investdost-test.portalwiz.in/investdostapi/storage/app/public/${messages[ind].image??"profile_pic\/Screenshot (737).png"}", profileImage: "https://investdost-test.portalwiz.in/investdostapi/storage/app/public/${messages[ind].senderProfilePic??"profile_pic\/Screenshot (737).png"}", time: "${dateTimedata.hour}:${dateTimedata.minute} ${period}"):SenderMessage(message: messages[ind].content??"Investdost", profileImg: "https://investdost-test.portalwiz.in/investdostapi/storage/app/public/${messages[ind].senderProfilePic??"profile_pic\/Screenshot (737).png"}", time: "${dateTimedata.hour}:${dateTimedata.minute} ${period}"):((messages[ind].type??0)=="2")?ImageContainer(image: "https://investdost-test.portalwiz.in/investdostapi/storage/app/public/${messages[ind].image??"profile_pic\/Screenshot (737).png"}", profileImage: "https://investdost-test.portalwiz.in/investdostapi/storage/app/public/${messages[ind].senderProfilePic??"profile_pic\/Screenshot (737).png"}", time: "${dateTimedata.hour}:${dateTimedata.minute} ${period}"):SenderWidget(message: messages[ind].content??"Investdost", profileImg: "https://investdost-test.portalwiz.in/investdostapi/storage/app/public/${messages[ind].senderProfilePic??"profile_pic\/Screenshot (737).png"}", time: "${dateTimedata.hour}:${dateTimedata.minute} ${period}");
        })
        ),
           
            
         Container(
        margin: EdgeInsets.all(4),
        
          height: MediaQuery.of(context).size.height*0.07,
         decoration: BoxDecoration(
          
           borderRadius: BorderRadius.circular(26)
         ),
         child: TextFormField(
        controller: message,
        decoration: InputDecoration(
          hintText: "message",
        
          
          
          prefixIcon: Padding(
            padding: const EdgeInsets.all(4.0),
            child: GestureDetector(
              onTap: () {

                print("okk");
                getImageData();
                
              },
              child: CircleAvatar(
                        radius:26,
                        child: Icon(Icons.camera_alt_outlined),),
            ),
          ),
        
          suffixIcon: GestureDetector(
            onTap: ()async{

              print(message.text);
            await ApiCalls.SendMessagetoAuthor(widget.Authorid, message.text, "${DateTime.now().year}-${DateTime.now().month}-${DateTime.now().day}");
                getAllChats();  
                message.clear();
          
            },
            child: Transform.rotate(
        angle: 18.4,
        child: Icon(Icons.send,color: Colors.black,size: 30,)),
          ),
        border: OutlineInputBorder(
          
          borderRadius: BorderRadius.circular(26),
          borderSide: BorderSide(width:0.5,color: Color.fromARGB(255, 11, 11, 11))
        ),
        
        focusedBorder:  OutlineInputBorder(
          
          borderRadius: BorderRadius.circular(26),
          borderSide: BorderSide(width:0.5,color: Colors.amber),
        )
        ),
        
        
        
         )
         )
          ],
        ),
      ) ,
    );
  }
}