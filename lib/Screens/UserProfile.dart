import 'dart:convert';
import 'dart:io';
import 'package:animated_emoji/animated_emoji.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:investdost/Screens/AuthorsfollwingScreen.dart';
import 'package:investdost/Screens/Leaderboard.dart';
import 'package:investdost/Models/UserPojo.dart';
import 'package:investdost/apiCalls/AllApiCalls.dart';
import 'package:investdost/Screens/mainLanderPage.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UsersProfile extends StatefulWidget {
   UsersProfile({super.key,required this.refreshdata});
  //  UserDetailsPojo userDetailsPojo;

   Function refreshdata;

  @override
  State<UsersProfile> createState() => _UsersProfileState();
}

enum  genderData {Male,Female}

class _UsersProfileState extends State<UsersProfile> {
  TextEditingController emailcontroller=TextEditingController();
  TextEditingController firstname=TextEditingController();
  TextEditingController lastname=TextEditingController();
  TextEditingController dob=TextEditingController();
  TextEditingController phone=TextEditingController();
  String date="";
  String Updates="";
  genderData gender=genderData.Male;
static const List<String> dropdonwdate=["Add Country","India","Australia"];
String dropdownvalue=dropdonwdate.first;

File  imagefile=File("");
UserDetailsPojo userDetailsPojo=UserDetailsPojo();

    Future<void> getImageFromGallery() async {
      final ImagePicker _picker = ImagePicker();
      final XFile? image = await _picker.pickImage(source: ImageSource.gallery);


 if(image!=null){
setState(() {

  imagefile=File(image.path);
});
 }


 await ApiCalls.updateProfilepicture(imagefile);
getUserDetails();
widget.refreshdata();


    }





@override
  void initState() {
getUserDetails();






    // TODO: implement initState
    super.initState();
  }




void getUserDetails() async{
SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
       Updates = await ApiCalls.getProfileCompleteInfo();
     userDetailsPojo=await ApiCalls.fetchuserProfile(sharedPreferences.getInt("userid")??0);
     print(userDetailsPojo.country??"ADD COUNTRY");

setState(() {
Updates;
userDetailsPojo;
List<String> splitted=(userDetailsPojo.fullname??"first last").split(" ");
firstname.text=splitted[0];
lastname.text=splitted[1];
dob.text=userDetailsPojo.dob??"Add date";
phone.text=(userDetailsPojo.phone??0).toString();
dropdownvalue=((userDetailsPojo.country??"").isEmpty)?"Add country":userDetailsPojo.country??"";
});
}



  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(height: 40,),
          Card(
            elevation: 8,
            margin: EdgeInsets.all(15),
            child: Container(
              color: Colors.white,
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: GestureDetector(
                      onTap: (){

                          getImageFromGallery();

                      },
                  child: CircleAvatar(backgroundImage: NetworkImage("https://investdost-test.portalwiz.in/investdostapi/storage/app/public/${userDetailsPojo.profilePic??"profile_pic/1712818972_IMG_20240409_220900.jpg"}"),radius: 60,))),
                  Column(
                    children: [
                      Text(userDetailsPojo.username??"Investdost",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),textAlign: TextAlign.end,),
                      SizedBox(height: 5,),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Padding(
                          padding: EdgeInsets.only(left: 5),
                          child: Text(userDetailsPojo.email??"change your Email",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w300),textAlign: TextAlign.end,)),
                      ),
                           SizedBox(height: 5,),
                      Row(children: [ 
                        Lottie.network("https://lottie.host/23487be8-ce79-4dda-89c3-149d0eaad3fd/1ZZp6TgATT.json",height: 40),
// SizedBox(width: 2,),
Text((userDetailsPojo.currentScore??0).toString(),style: TextStyle(fontSize: 18,fontWeight: FontWeight.w300),textAlign: TextAlign.end,),],)
                    ],
                  )

                ],
              ),
            ),

          ),
          SizedBox(height: 10,),
Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
    Card(
      
      color:Colors.white,
      child: GestureDetector(
        onTap: ()async{
          SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
          await ApiCalls.calculatePoints(sharedPreferences.getInt("userid")??0);
           await ApiCalls.assignranktouser();
         Get.to( Leaderboard(),transition: Transition.upToDown);
        },
        child: Container(
          width: MediaQuery.of(context).size.width*0.65,
        decoration: BoxDecoration(  color: Colors.amber.shade300,
        borderRadius: BorderRadius.circular(11)
        ),
          child: Padding(
            padding:EdgeInsets.all(10),
            child: Text("Current Rank ${userDetailsPojo.currentRank??0}",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),textAlign: TextAlign.center,)),
        ),
      ),
    ),
    GestureDetector(
      onTap: () {
        
        showDialog(context: context, builder: (context){

          return Dialog(
              child: Container(
                color: Colors.white,
                height: 200,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: 10,),
                      Text("Invite a Friend",style: TextStyle(fontSize: 24),),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: TextFormField(
                          controller:emailcontroller,
                          decoration: InputDecoration(
                            label: Text("Friends Email"),
                            isDense: true,
                            contentPadding: EdgeInsets.zero
                          ),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.fromLTRB(8.0,0,20,0),
                        child: Align(
                          alignment: Alignment.bottomRight,
                          child: ElevatedButton(
                            style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.white),foregroundColor: MaterialStatePropertyAll(Colors.black)),
                            onPressed: ()async{
                              Navigator.pop(context);
                          bool check=await ApiCalls.sendInviteTOUser(emailcontroller.text);
                          // (check)?ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Invitation Sent"))):ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Sorry Not Sent"))
                          // );
                          }, child:  Text("Send Invite")),
                        ),
                      )
                    ],
                  ),
                ),
              ),
          );

        });

      },
      child: Card(
        color:Colors.white,
        child: Container(
          width: MediaQuery.of(context).size.width*0.25,
       decoration: BoxDecoration(
           color: Colors.white,
           borderRadius: BorderRadius.circular(11)
       ),
          child: Padding(
            padding:EdgeInsets.all(10),
            child: Icon(Icons.person_add,size: 30,)),
        ),
      ),
    ),

  ],
),

  SizedBox(height: 20,),
Table(

children: [
  TableRow(
    children: [
          Card(
              color: Colors.white,
            child: Container(
              width: MediaQuery.of(context).size.width*0.4,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                
                color: Colors.white,
              ),
              child: Padding(
                padding: EdgeInsets.fromLTRB(10,20,10,20),
                child: Column(
                  children: [
                    Row(
                      children: [
                        AnimatedEmoji(AnimatedEmojis.fire),
                        SizedBox(width: 5,),
                        Text("Profile Completed",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400),),
                      ],
                    ),
                     SizedBox(height: 10,),
                            Text(Updates,style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
                  ],
                ),
              ),
            ),
          ),
          Card(
              color: Colors.white,
            child: Container(
             
              width: MediaQuery.of(context).size.width*0.4,
              decoration: BoxDecoration(
                  color: Colors.white,
                borderRadius: BorderRadius.circular(10)
              ),
              child: Padding(
                padding: EdgeInsets.fromLTRB(10,20,10,20),
                child: Column(
                  children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                   
                        Text("Current League",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400),),
                      ],
                    ),
                 
                    Lottie.network("https://lottie.host/16b224ce-8a90-4a48-8e06-98aed2c1ed86/WTiAo2ZQmS.json",
                    reverse: true,
                    height: 40
                    )
                  ],
                ),
              ),
            ),
          )
    ]
  ),
  TableRow(
    children: [
          Card(
              color: Colors.white,
            child: Container(
              width: MediaQuery.of(context).size.width*0.4,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                
                color: Colors.white,
              ),
              child: Padding(
                padding: EdgeInsets.fromLTRB(10,30,10,16),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                   
                        Text("Current Rank",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400),textAlign: TextAlign.center,),
                      ],
                    ),
                     SizedBox(height: 18,),
                            Text((userDetailsPojo.currentRank??0).toString(),style: TextStyle(fontSize: 22,fontWeight: FontWeight.w500),),
                  ],
                ),
              ),
            ),
          ),
          Card(
              color: Colors.white,
            child: Container(
             
              width: MediaQuery.of(context).size.width*0.4,
              decoration: BoxDecoration(
                  color: Colors.white,
                borderRadius: BorderRadius.circular(10)
              ),
              child: Padding(
                padding: EdgeInsets.fromLTRB(10,20,10,20),
                child: Column(
                  children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Lottie.network("https://lottie.host/23487be8-ce79-4dda-89c3-149d0eaad3fd/1ZZp6TgATT.json",height: 40),
                        SizedBox(width: 05,),
                        Text("Points",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400),),
                      ],
                    ),
                    SizedBox(height: 10,),
                        Text((userDetailsPojo.currentScore??0).toString(),style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400),),
                  ],
                ),
              ),
            ),
          )
    ]
  )
],

),



          Card(
              margin: EdgeInsets.all(10),
              color: Colors.white,
            child: GestureDetector(
              onTap: ()async{
                
                SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
                    UserDetailsPojo usersProfile=await ApiCalls.fetchuserProfile(sharedPreferences.getInt("userid")??0);
                       Get.offAll(MyWidget(ind: 2, user_id: sharedPreferences.getInt("userid")??0,));
              },
              child: Container(
              
               decoration: BoxDecoration(
                 color: Colors.white,
                 borderRadius: BorderRadius.circular(12),
                 border: Border.all(color: Color.fromARGB(221, 193, 193, 193))
               ),
                  width: double.infinity,
                child: Padding(
                  padding: EdgeInsets.only(top: 20,bottom: 20),
                  child: Text("My Bookmarks",textAlign:TextAlign.center,style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),)),
              ),
            ),
          ),
          Card(
              margin: EdgeInsets.all(10),
              color: Colors.white,
            child: GestureDetector(
              onTap: (){
       
              },
              child: GestureDetector(
                onTap: (){
                  Get.to(Authorsfollowedbyuser(imageProfile: "https://investdost-test.portalwiz.in/investdostapi/storage/app/public/${userDetailsPojo.profilePic??"profile_pic/1712818972_IMG_20240409_220900.jpg"}",),transition: Transition.size);
                },
                child: Container(
                      decoration: BoxDecoration(
                   color: Colors.white,
                   borderRadius: BorderRadius.circular(12),
                   border: Border.all(color: Color.fromARGB(221, 193, 193, 193))
                 ),
                        
                    width: double.infinity,
                  child: Padding(
                    padding: EdgeInsets.only(top: 20,bottom: 20),
                    child: Text("Followed Authors",textAlign:TextAlign.center,style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),)),
                ),
              ),
            ),
          ),

          Card(
            elevation: 3,
                margin: EdgeInsets.all(10),
            color: Colors.white,
            child: Container(
           padding: const EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(11),
                color: Colors.white
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Text("Personal Details",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
                  ),
                  SizedBox(height: 10,),
                  Table(
                    border: TableBorder(horizontalInside: BorderSide(color: Colors.amber.shade100)),
                    defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                    children: [
                  
                              
                      TableRow(children: 
                      [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Name",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500)),
                        ),Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: (){
                        showDialog(context: context, builder: (context){
                          return Dialog(
                            child: Container(
                              color: Colors.white,
                              height: MediaQuery.of(context).size.height*0.3,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(15.0,10,0,0),
                                    child: Text("Name",style: TextStyle(fontSize: 20),),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 10),
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                        label: Text("First Name")
                                      ),
                                      controller:firstname,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 10),
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                        label: Text("Last Name")
                                      ),
                                      controller: lastname,
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.bottomRight,
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: ElevatedButton(onPressed: ()async{
                                              SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
                                            await ApiCalls.updateName(sharedPreferences.getInt("userid")??0, firstname.text,lastname.text);
                                          userDetailsPojo= await ApiCalls.fetchuserProfile(sharedPreferences.getInt("userid")??0);
                                           Navigator.pop(context);
                                            setState(() {
                                              userDetailsPojo;
                                            });
                                            Get.rawSnackbar(title: "Profilename Updated",backgroundColor: Colors.greenAccent.shade100,icon: Icon(Icons.verified),message: "Profile Updated Successfully",isDismissible: true);
                                      }, child: Text("Update Name")),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        });
                            },
                            child: Text(userDetailsPojo.fullname??"Add Name",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400))),
                        )
                      ]
                      ),
                      TableRow(children: 
                      [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("DOB",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500)),
                        ),Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: (){



   showDialog(context: context, builder: (context){
                          return Dialog(
                            child: Container(
                              color: Colors.white,
                              height: MediaQuery.of(context).size.height*0.2,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(15.0,10,0,0),
                                    child: Text("Date of Birth",style: TextStyle(fontSize: 20),),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 10),
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                        suffixIcon: InkWell(
                                          onTap:() async{
                                            
SharedPreferences sharedPreferences =await SharedPreferences.getInstance();
                                                DateTime? dateTime=await showDatePicker(context: context, firstDate: DateTime(1900), lastDate: DateTime(2050));
                                              setState(() {
                                                date="${dateTime!.year}-${dateTime!.month}-${dateTime!.day}";
                                                dob.text=date;
                                              });
                                                
                                          },
                                          child: Icon(Icons.calendar_month)),
                                    
                                        hintText: date,
                                      ),
                                      controller:dob,
                                    ),
                                  ),
              
                                  Align(
                                    alignment: Alignment.bottomRight,
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: ElevatedButton(onPressed: ()async{
                                              SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
                                            await ApiCalls.updateDob(sharedPreferences.getInt("userid")??0, date);
                                          userDetailsPojo= await ApiCalls.fetchuserProfile(sharedPreferences.getInt("userid")??0);
                                           Navigator.pop(context);
                                            setState(() {
                                              userDetailsPojo;
                                            });
                                            Get.rawSnackbar(title: "DOB Updated",backgroundColor: Colors.greenAccent.shade100,icon: Icon(Icons.verified),message: "DOB Updated Successfully",isDismissible: true);
                                      }, child: Text("Update Date")),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        });




                            },
                            child: Text(userDetailsPojo.dob??"Add Date Of Birth",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400))),
                        ),
                      ]
                      ),
                      TableRow(children: 
                      [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Gender",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500)),
                        ),GestureDetector(
                          onTap: (){
                            showDialog(context: context, builder: (context){

                                return Dialog(
                                  child: StatefulBuilder(
                                    
                                    builder: (context, setState2) {
                                      return Container(
                                        color: Colors.white,
                                        height: 150,
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Text("Choose Gender",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Text("Male",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400)),
                                                Radio<genderData>( 
                                                 fillColor:MaterialStatePropertyAll( Colors.amber.shade200),
                                                  value: genderData.Male, groupValue: gender, onChanged: ( value){
                                                  
                                                      print(value);
                                                     setState2((){
                                                     gender=value??genderData.Male;
                                                   });
                                                }),
                                                SizedBox(width: 25,),
                                                 Text("Female",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400)),
                                                Radio<genderData>(
                                                  fillColor:MaterialStatePropertyAll( Colors.amber.shade200),
                                                  value: genderData.Female, groupValue: gender, onChanged: ( value){
                                                                                  
                                                                                  
                                                  setState2(() {
                                                     gender=value??genderData.Male;
                                                   });
                                                                                  
                                                
                                                
                                                }),
                                              ],
                                            ),
                                            ElevatedButton(
                                              style: ButtonStyle(surfaceTintColor: MaterialStatePropertyAll(Colors.white)),
                                              onPressed: ()async{
                                              
                                                  SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
                                                  print(gender==genderData.Male);
                                              await ApiCalls.updateGender(sharedPreferences.getInt("userid")??0, (gender==genderData.Male)?"Male":"Female");
                                              userDetailsPojo= await ApiCalls.fetchuserProfile(sharedPreferences.getInt("userid")??0);
                                           Navigator.pop(context);
                                            setState(() {
                                              userDetailsPojo;
                                            });

                                            Get.rawSnackbar(title: "Changed Gender",message: "Gender Changed Successfully!!!",backgroundColor: Colors.greenAccent.shade100);
                                            }, child: Text("Change"))
                                          ],
                                        ),
                                        
                                        );
                                    }
                                  ),
                                );

                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(userDetailsPojo.gender??"Add Gender",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400)),
                          ),
                        ),
                      ]
                      ),
                      TableRow(children: 
                      [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Country",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500)),
                        ),GestureDetector(
                          onTap: ()async{

                                  showDialog(context: context, builder: (context){

                                      return Dialog(

                                        child: StatefulBuilder(
                                      
                                          builder: (context, StepState1) {
                                            return Container(
                                              height: MediaQuery.of(context).size.height*0.2,
                                              color: Colors.white,
                                              child: Column(
                                                children: [
                                                  SizedBox(height: 5,),
                                                     Text("Choose Country",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
                                                          SizedBox(height: 5,),
                                                          Row(
                                                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                            children: [
                                                              Text("Country :",style: TextStyle(fontSize: 17,fontWeight: FontWeight.w400)),
                                                              Container(
                                                                margin: EdgeInsets.symmetric(horizontal: 5),
                                                                
                                                                child: DropdownButton(
                                                                  hint: Text("Add Country"),
                                                                  value: dropdownvalue,
                                                                  items: dropdonwdate.map((String data) {
                                                                    return DropdownMenuItem(child: Text(data),value: data,);
                                                                  }).toList(), onChanged: (value){
                                                                                                            
                                                                        StepState1(() {
                                                                          dropdownvalue=value??"";
                                                                        });
                                                                }),
                                                                
                                                              ),
                                                            ],
                                                          ),
                                                      ElevatedButton(
                                                        style: ButtonStyle(
                                                          surfaceTintColor: MaterialStatePropertyAll(Colors.white)
                                                        ),
                                                        onPressed: ()async{


                                               SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
                                              await ApiCalls.updateCountry(sharedPreferences.getInt("userid")??0, dropdownvalue);
                                              userDetailsPojo= await ApiCalls.fetchuserProfile(sharedPreferences.getInt("userid")??0);
                                           Navigator.pop(context);
                                            setState(() {
                                              userDetailsPojo;
                                            });

                                            Get.rawSnackbar(title: "Changed Country",message: "Country Changed Successfully!!!",backgroundColor: Colors.greenAccent.shade100);

                                                      }, child: Text("Change Country")),
                                                ],
                                              ),
                                            );
                                          }
                                        ),

                                      );

                                  });

                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(dropdownvalue,style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400)),
                          ),
                        ),
                      ]
                      ),
                      TableRow(children: 
                      [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Language",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500)),
                        ),Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("English",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400)),
                        ),
                      ]
                      ),
                      TableRow(children: 
                      [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Phone",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500)),
                        ),Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: (){


                                   showDialog(context: context, builder: (context){
                                    return Dialog(
                            child: Container(
                              color: Colors.white,
                              height: MediaQuery.of(context).size.height*0.22,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(15.0,10,0,0),
                                    child: Text("Contact no",style: TextStyle(fontSize: 20),),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 10),
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                      
                                    
                                      label: Text("Contact Info"),
                                      ),
                                      controller:phone,
                                    ),
                                  ),
              
                                  Align(
                                    alignment: Alignment.bottomRight,
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: ElevatedButton(onPressed: ()async{
                                              SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
                                            await ApiCalls.contactNo(sharedPreferences.getInt("userid")??0, phone.text);
                                          userDetailsPojo= await ApiCalls.fetchuserProfile(sharedPreferences.getInt("userid")??0);
                                           Navigator.pop(context);
                                            setState(() {
                                              userDetailsPojo;
                                            });
                                            Get.rawSnackbar(title: "Phone Updated",backgroundColor: Colors.greenAccent.shade100,icon: Icon(Icons.verified),message: "Phone Updated Successfully",isDismissible: true);
                                      }, child: Text("Phone updated")),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          
                                      
                                    );
                                   });

                              
                            },
                            child: Text((userDetailsPojo.phone??0000).toString(),style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400))),
                        ),
                      ]
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),


SizedBox(height: 40,)

        ],
      ),
    );
  }
}