import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:investdost/Models/ResponseofRegister.dart';
import 'package:investdost/apiCalls/AllApiCalls.dart';
import 'package:investdost/logics/validations.dart';
import 'package:investdost/Screens/newloginpage.dart';
import 'package:lottie/lottie.dart';
import 'package:investdost/Screens/otpVerification.dart';
import 'package:url_launcher/url_launcher.dart';






class LoginPage extends StatefulWidget{
  @override
  State<LoginPage> createState() => _LoginPageState();





}

class _LoginPageState extends State<LoginPage> {
var nameCon=TextEditingController();
var emailCon=TextEditingController();
var passCon=TextEditingController();
var conpassCon=TextEditingController();
var phoneCon=TextEditingController();
Color mybordercolor=Colors.amber;


var value=true;

bool togVisible=true;
var passIcon=Icons.visibility_off_outlined;



  @override
  Widget build(BuildContext context) {
   





return Container(

width: WidgetsBinding.instance.window.physicalSize.width,
height: WidgetsBinding.instance.window.physicalSize.height,
decoration:const BoxDecoration(
image:  DecorationImage(image: AssetImage("assets/images/backgroundinvest.png"),fit: BoxFit.cover),

),
  child: Scaffold(
  backgroundColor: Colors.transparent,
  
  body:  SingleChildScrollView(
          scrollDirection: Axis.vertical,
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
    
        child: Center(
        
        
        
        child: Column(
        
        children: [
        
        
        Padding(
          padding: const EdgeInsets.fromLTRB(20,50,0,0),
          child: Row(
            children: [Container(
              alignment: AlignmentDirectional.centerStart,
              child: const Icon(Icons.arrow_back_ios,
              size: 28,),
            ),]
          ),
        ),
        Container(
          height: 3,
        ),
        
        Container(
        
          height: 140,
          width: 250,
         child: Image.asset(
        'assets/images/investD-removebg-preview.png'
        )
        ),
        
        Padding(
          padding:const EdgeInsets.fromLTRB(35,5,0,0),
          child: Row(
            children: [Container(
              alignment: AlignmentDirectional.centerStart,
              child: const Text("Register",
              style: TextStyle(fontSize: 24,fontWeight: FontWeight.w400,shadows: [    Shadow(
                color: Color.fromARGB(255, 144, 142, 142),      // Choose the color of the shadow
                blurRadius: 8,          // Adjust the blur radius for the shadow effect
                offset: Offset(2.0, 4.0), // Set the horizontal and vertical offset for the shadow
              ),]),),
            ),]
          ),
        ),
        Container(
        
        ),
        
        
        Padding(
          padding: const EdgeInsets.fromLTRB(35,5,0,0),
          child: Row(
            children: [Container(
              alignment: AlignmentDirectional.centerStart,
              child: const Text("Enter your personal Information",
              style: TextStyle(fontSize: 12,),),
            ),]
          ),
        ),
        
        
        Container(height: 50,),
        textFieldWidget(),
          Container(height: 3,),
        
        
        
        
        check_and_text(),
        
        Container(height:5),
        
        button(context),
           Container(height: 30,),
        
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          
          children: [
          
           const  Text("Alredy have an account?",style: TextStyle(fontSize: 10)
           ,),
    
    Container(width: 5,),
    
            InkWell(
              onTap: (){
    
                //  Navigator.push(context, MaterialPageRoute(builder: (context)=>newLogin()));

                Get.to(newLogin(),transition: Transition.downToUp,duration: Duration(milliseconds: 500));
    
              },
              child: const Text("Login",style: TextStyle(fontSize: 12,color: Colors.blue),
            )
            ),
          ],
        ),
        
          Container(height:25),
        
        
        ],
        
        ),
        
        
        ),
      ),
  
  
  
  
  
  
  
  
  
  
  ),
);







  }



   void toVisible(){
setState(() {
  
togVisible=!togVisible;
if(togVisible){
  passIcon=Icons.visibility_off_outlined;
}
else{
    passIcon=Icons.visibility_outlined;
}
});

  }






//-----------------------------------------------textField-----------------------------------




Column textFieldWidget(){


 return Column(

  children: [

      
       Padding(
                                    padding: EdgeInsets.fromLTRB(30, 0, 20, 0),
                                    child: TextField(
                                      textAlignVertical: TextAlignVertical.center,
                                      controller: nameCon,
                                    cursorHeight: 30.0,
                                    decoration: InputDecoration(
                                      hintText: "UserName",
                                      prefixIcon: const Icon(Icons.person_outline,size: 35,),
                                      isDense: true,
                                      contentPadding: const EdgeInsets.all(3),
                                      border: OutlineInputBorder(
                                        
                                        borderRadius: BorderRadius.circular(25),
                                        borderSide: const  BorderSide(
                                        color: Colors.amber,  
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        
                                        borderRadius: BorderRadius.circular(25),
                                        borderSide: const  BorderSide(
                                        color: Colors.amber,  
                                        ),
                                      )
                                    ),
                                      
                                    ),
                                  ),
Container(height: 15,),

Padding(
                                    padding: EdgeInsets.fromLTRB(30, 0, 20, 0),
                                    child: TextField(
                                      onTapOutside: (event){
                                                      setState(() {
                                            mybordercolor=Colors.amber;
                                          });
                                      },
                                      textAlignVertical: TextAlignVertical.center,
                                      onChanged: (value) {
                                        if(AllValidations.isValidEmail(value)){
                                   
                                          setState(() {
                                            mybordercolor=Colors.greenAccent;
                                          });
                                        }
                                        else{
                                       setState(() {
                                            mybordercolor=Colors.redAccent;
                                       });
                                         
                                        }
                                      },
                                      controller: emailCon,
                                    cursorHeight: 30.0,
                                    decoration: InputDecoration(
                                      hintText: "Email",
                                      prefixIcon: Icon(Icons.email_outlined,size: 35),
                                      isDense: true,
                                      contentPadding: const EdgeInsets.all(3),
                                      border: OutlineInputBorder(
                                        
                                        borderRadius: BorderRadius.circular(25),
                                        borderSide: const  BorderSide(
                                        color: Colors.amber,  
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        
                                        borderRadius: BorderRadius.circular(25),
                                        borderSide:   BorderSide(
                                        color: mybordercolor,  
                                        ),
                                      )
                                    ),
                                      
                                    ),
                                  ),


Container(height: 15,),

       Padding(
                                    padding: EdgeInsets.fromLTRB(30, 0, 20, 0),
                                    child: TextField(
                                      obscureText: togVisible,
                                      textAlignVertical: TextAlignVertical.center,
                                      controller: passCon,
                                    cursorHeight: 30.0,
                                    decoration: InputDecoration(
                                      hintText: "Password",
                                      prefixIcon: const Icon(Icons.lock_outline,size: 35),
                                      suffixIcon: InkWell(
                                        onTap: (){
                                              toVisible();
                                        },
                                        child: Icon(passIcon),
                                      ),
                                      isDense: true,
                                      contentPadding: const EdgeInsets.all(3),
                                      border: OutlineInputBorder(
                                        
                                        borderRadius: BorderRadius.circular(25),
                                        borderSide: const  BorderSide(
                                        color: Colors.amber,  
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        
                                        borderRadius: BorderRadius.circular(25),
                                        borderSide: const  BorderSide(
                                        color: Colors.amber,  
                                        ),
                                      )
                                    ),
                                      
                                    ),
                                  ),




Container(height: 15,),
       Padding(
                                    padding: EdgeInsets.fromLTRB(30, 0, 20, 0),
                                    child: TextField(
                                      textAlignVertical: TextAlignVertical.center,
                                      controller: conpassCon,
                                      obscureText: togVisible,
                                    cursorHeight: 30.0,
                                    decoration: InputDecoration(
                                      hintText: "Confirm Password",
                                      prefixIcon: Icon(Icons.lock_outline,size: 35),
                                      suffixIcon: Icon(passIcon),
                                      isDense: true,
                                      contentPadding: const EdgeInsets.all(3),
                                      border: OutlineInputBorder(
                                        
                                        borderRadius: BorderRadius.circular(25),
                                        borderSide: const  BorderSide(
                                        color: Colors.amber,  
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        
                                        borderRadius: BorderRadius.circular(25),
                                        borderSide: const  BorderSide(
                                        color: Colors.amber,  
                                        ),
                                      )
                                    ),
                                      
                                    ),
                                  ),
Container(height: 15,),
                                  //   Padding(
                                  //   padding: EdgeInsets.fromLTRB(30, 0, 20, 0),
                                  //   child: TextField(
                                  //     onTapOutside: (event){
                                  //             setState(() {
                                  //           mybordercolor=Colors.amber;
                                  //         });
                                  //     },
                                  //     textAlignVertical: TextAlignVertical.center,
                                  //     controller: phoneCon,
                                  //     onChanged: (value) {
                                  //       if(AllValidations.checkNumber(value)){
                                  //         setState(() {
                                  //           mybordercolor=Colors.greenAccent;
                                  //         });
                                  //       }
                                  //       else{
                                  //         setState(() {
                                  //            mybordercolor=Colors.redAccent;
                                  //         });
                                  //       }
                                  //     },
                                  //    keyboardType: TextInputType.number,
                                  //   cursorHeight: 30.0,
                                  //   decoration: InputDecoration(
                                  //     hintText: "Phone",
                                  //     prefixIcon: Icon(Icons.phone_outlined,size: 35),
                                  //     isDense: true,
                                  //     contentPadding: const EdgeInsets.all(3),
                                  //     border: OutlineInputBorder(
                                        
                                  //       borderRadius: BorderRadius.circular(25),
                                  //       borderSide: const  BorderSide(
                                  //       color: Colors.amber,  
                                  //       ),
                                  //     ),
                                  //     focusedBorder: OutlineInputBorder(
                                        
                                  //       borderRadius: BorderRadius.circular(25),
                                  //       borderSide:   BorderSide(
                                  //       color: mybordercolor,  
                                  //       ),
                                  //     )
                                  //   ),
                                      
                                  //   ),
                                  // ),



  ],
 );





}



//--------------------------checkbox and text ------------------------------------------------


Padding check_and_text(){

return Padding(
  
  padding:const EdgeInsets.fromLTRB(30,0,0,0),

child: Row(
  children: [
    const CheckboxExample(),


Container(width: 3,),
Row(
  children: [
    const Text("I Agree to the ",
    style: TextStyle(fontWeight: FontWeight.w300,fontSize: 10),
    ),
    GestureDetector(
      onTap: (){
        launchUrl(Uri.parse("https://investdost-test.portalwiz.in/"));
      },
      child: Text("terms and Conditions",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 10,color: Colors.blueAccent),))
  ],
)

  ],
),



);




}





Container button(BuildContext ctx){

return Container(
  height: 40,

  child: Center(
    child: Container(
width: 150,
      child: ElevatedButton(
      
        onPressed: () async{

              if(nameCon.text.isEmpty||passCon.text.isEmpty||conpassCon.text.isEmpty||emailCon.text.isEmpty){

                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Fill All fields Properly, All fields Required")));
              }
              else{
                if(AllValidations.isValidEmail(emailCon.text.toString())&&(passCon.text.toString()==conpassCon.text.toString())){


                               showDialog(context: context, builder: (context){
                    return Dialog(
                         backgroundColor: Colors.transparent,
                      child: Container(
                            color: Colors.transparent,
                          height: MediaQuery.of(context).size.height*0.4,
                          width: MediaQuery.of(context).size.width,
              
                
        
                          child: Lottie.network("https://lottie.host/70dc8380-50cf-411a-a784-fe04e37dece6/3I5unO7OVs.json",
                          frameRate: FrameRate(120),
                          reverse: true
                          )
                        
                      ),
                    );
                  });
                   String register=await ApiCalls.RegisterUser(nameCon.text.toString(), passCon.text.toString(), emailCon.text.toString());
setState(() {
  register;
});
// print(register.unverifiedUserId);
                  if(jsonDecode(register)["success"]){
                    
      Navigator.pop(context);
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>otpVerify(name: nameCon.text.toString(),email: emailCon.text.toString(),password: passCon.text.toString(),forgetpass: false,unverified_userid: (jsonDecode(register)["unverified_user"]).toString(),)));
                  }
                  else{
                                                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(jsonDecode(register)["message"])));
                                                      Navigator.pop(context);

                  }
                }
                else{
                                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Incorrect email or Confirm password")));

                }
              }
         

      },
      style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromARGB(255, 255, 255, 255),
          ),
            child: const Text(
          "Register",
          style:   TextStyle(color: Colors.amber,fontWeight: FontWeight.w500),
          ),
      ),  
    ),
  ),
);
}

}













class CheckboxExample extends StatefulWidget {
  const CheckboxExample({super.key});

  @override
  State<CheckboxExample> createState() => _CheckboxExampleState();
}
class _CheckboxExampleState extends State<CheckboxExample> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return const Color.fromARGB(255, 254, 254, 254);
      }
      return Colors.amber;
    }

    return Checkbox(
      checkColor: const Color.fromARGB(255, 255, 255, 255),
      fillColor: MaterialStateProperty.resolveWith(getColor),
      value: isChecked,
      onChanged: (bool? value) {
        setState(() {
          isChecked = value!;
        });
      },
    );
  }
}
