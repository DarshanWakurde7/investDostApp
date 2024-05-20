import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:investdost/apiCalls/AllApiCalls.dart';
import 'package:investdost/Screens/loginpage.dart';
import 'package:investdost/main.dart';
import 'package:investdost/Screens/mainLanderPage.dart';
import 'package:investdost/Screens/newloginpage.dart';
import 'package:investdost/Screens/shortNews.dart';

import 'package:lottie/lottie.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';
import 'package:shared_preferences/shared_preferences.dart';



class otpVerify extends StatefulWidget{


const otpVerify({required this.name,required this.email,required this.password, required this.forgetpass,required this.unverified_userid});

final String name,password,email;
final String unverified_userid;

final bool forgetpass;



  @override
  State<otpVerify> createState() => _otpVerifyState();




}

class _otpVerifyState extends State<otpVerify> {


TextEditingController pass=TextEditingController();
TextEditingController conpass=TextEditingController();



String otppin="0000";
  @override
  Widget build(BuildContext context) {
   return  Container(
width: double.infinity,
height: double.infinity,
    decoration:const BoxDecoration(
image:  DecorationImage(image: AssetImage("assets/images/backgroundinvest.png"),fit: BoxFit.cover),

),
     child: Scaffold(
     
     backgroundColor: Colors.transparent,
     
       body: SingleChildScrollView(
            physics: const ClampingScrollPhysics(parent: NeverScrollableScrollPhysics()),
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
       
       
        child: Center(
        
        
        
        child: Column(
        
        children: [
        
        
        Padding(
          padding: const EdgeInsets.fromLTRB(20,50,0,0),
          child: Row(
            children: [Container(
              alignment: AlignmentDirectional.centerStart,
              child: InkWell(
                onTap: (){
       
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginPage()));
       
                },
                child: const Icon(Icons.arrow_back_ios,
                size: 28,),
              ),
            ),]
          ),
        ),
        Container(
          height: 3,
        ),
        
        Container(
          height: 150,
          width: 250,
         child: Image.asset(
        'assets/images/otp.png'
        )
        ),
        
        Container(height: 50,),
        Padding(
          padding: const EdgeInsets.fromLTRB(35,5,0,0),
          child: Row(
            children: [Container(
              alignment: AlignmentDirectional.centerStart,
              child:  Text((widget.forgetpass)?"Enter your New Password and Otp":"OTP Verification",
              style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400,shadows: [    Shadow(
                color: Color.fromARGB(255, 144, 142, 142),      // Choose the color of the shadow
                blurRadius: 8,          // Adjust the blur radius for the shadow effect
                offset: Offset(2.0, 4.0), // Set the horizontal and vertical offset for the shadow
              ),]),),
            ),]
          ),
        ),
      
        Container(height: 3,),
        
        Padding(
          padding: const EdgeInsets.fromLTRB(35,5,0,0),
          child: Row(
            children: [Container(
              width: 260,
              alignment: AlignmentDirectional.centerStart,
              child: const Text(
                "Enter the verification code we just sent on your email address",
              style: TextStyle(fontSize: 10,),
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              ),
            ),]
          ),
        ),


        


           Padding(
            padding: EdgeInsets.fromLTRB(30, 2, 30, 2),
             child: Visibility(
              visible: widget.forgetpass,
              child: TextField(
              
                       controller: pass,
                       decoration: InputDecoration(
                          contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                     
              label: Text("Password"),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(13)
              )
                       ),
                       
                      
                       )),
           ),
            Container(height: 5,),
           Padding(
            padding: EdgeInsets.fromLTRB(30, 2, 30, 2),
             child: Visibility(
              visible: widget.forgetpass,
              child: TextField(
                       controller: conpass,
                       decoration: InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                        
              label: Text("Confirm Password"),
              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(13)
              )
                       ),
                       
                       )),
           ),
           Container(height: 20,),
       
       Padding(
      padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
      child: otptexts(context)),

       
        Container(height: 30,),
       
        btn(context),
       
        Container(height:20),
       
        resend(),
      //  Container(height: 300,),
     
        ],
        
        ),
        
        
        ),
      ),
       
     
     
     
     
     
     
     
     
     
     ),
   );






  }





Container btn(BuildContext context){

return Container(
width: 150,
  child: ElevatedButton(
    style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
    child: const Text(
      "Verify" ,
      style: TextStyle(
        fontSize: 15,
        color: Colors.amber,
        ),
      ),
      onPressed: ()async{

      showDialog(context: context, builder: (context){
                    return Dialog(
                      backgroundColor: Colors.transparent,
                      child: Lottie.network("https://lottie.host/a6ddeb08-ef9d-417e-b270-805998cf8541/QRpxt3jeYP.json",
                      reverse: true
                      )
                    );
                  });
      if(widget.forgetpass){
SharedPreferences preferences=await SharedPreferences.getInstance();
            bool check=await ApiCalls.verifyOtpToResetPass(otppin,pass.text);
          

           (check)?Get.to(newLogin()):ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Something Went wrong...")));
      }
      else{
              String check=await ApiCalls.SendOtp(widget.name, widget.password, widget.email, otppin);
            
              Navigator.pop(context);
            if(jsonDecode(check)["success"]){
                Navigator.pop(context);
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MyHomePage(title: "")));
            }else{
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(jsonDecode(check)["message"])));
            }

      }


        

      },
      
      )
  ,
);






}






Container otptexts(BuildContext context){


return Container(

  width: 350,

child: OTPTextField(
  length: 4,
  width: MediaQuery.of(context).size.width,
  fieldWidth: 60,
  style: const TextStyle(
    fontSize: 17
  ),
  textFieldAlignment: MainAxisAlignment.spaceAround,
  outlineBorderRadius: 25,
  fieldStyle: FieldStyle.box,
  otpFieldStyle: OtpFieldStyle(
  
    focusBorderColor: Colors.amber
  ),
  onCompleted: (pin) {



 setState(() {
   otppin=pin;
 });

    ScaffoldMessenger.of(context).showSnackBar( SnackBar(content: Text("pin $pin" ,style: const TextStyle(color: Colors.black,fontWeight: FontWeight.w300),),
    backgroundColor: Colors.white,));


  },
),
    );


}
//






Row resend(){


return  Row(
      mainAxisAlignment: MainAxisAlignment.center,
      
      children: [
      
       const  Text("Didn't received code?",style: TextStyle(fontSize: 10)
       ,),

Container(width: 5,),

        InkWell(
          onTap: ()async {
           
                // await ApiCalls.markUnverifiedUser(widget.unverified_userid);

               await ApiCalls.RegisterUser(widget.name, widget.password, widget.email);

               ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("OTP has been Sent Again")));

          },
          child: const Text("Resend",style: TextStyle(fontSize: 10,color: Colors.blue),
        )
        ),
      ],
    );




}





}





//------------------input Text Box for otp-------------------------------------------------









//-------------------------------resend Otp----------------------------------------------

