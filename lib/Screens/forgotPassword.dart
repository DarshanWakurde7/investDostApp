
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:investdost/apiCalls/AllApiCalls.dart';
import 'package:investdost/Screens/otpVerification.dart';

var emailForgot=TextEditingController();

class forgotPassword extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
   return forgotPasswordState(); 

  }
}

class forgotPasswordState extends State<forgotPassword>{
  @override
  Widget build(BuildContext context) {
    

      return Container(
          width: double.infinity,
          height: double.infinity,


          decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/backgroundinvest.png'),
                fit: BoxFit.cover
                )
          ),

        child: Scaffold(
                backgroundColor: Colors.transparent,
                body:SingleChildScrollView(
               physics: const ClampingScrollPhysics(parent: NeverScrollableScrollPhysics()),
               keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.manual,
                  child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                  
                        
                       const  Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            
                            Padding(padding: EdgeInsets.fromLTRB(10, 125, 0, 0)),
                            Icon(Icons.arrow_back_ios,size: 30,),
                       
                  
                        
                  
                            ]
                            ),
                                 Container(height: 5,),
                  
                                Container(
                              height: 150,
                              width: 150,
                       
                            decoration:const  BoxDecoration(
                              image: DecorationImage(
                                image:  AssetImage('assets/images/logo2.png'),
                                  fit: BoxFit.cover,            
                              ),
                              
                            ),
                              ),
                              Container(height: 20,),
                  
                           const  Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                
                                
                                Padding(padding: EdgeInsets.fromLTRB(20, 0, 0, 0)),
                                
                                 Text(
                              
                                "Forgot Password",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    shadows: [
                                      Shadow(
                                        color: Colors.black26,
                                        blurRadius: 8,
                                                                         )
                                    ]
                                  ),
                              textAlign: TextAlign.start,
                              ),]
                            ),
                  
                             Container(
                                alignment: AlignmentDirectional.centerStart,
                                width: double.infinity,
                              child:Padding(
                                padding: EdgeInsets.fromLTRB(22, 0, 25, 0),
                                child: const Text(
                                    
                                  "Don't worry! it occurs Please enter the email address linked with your account.",
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w200,
                                    ),
                                textAlign: TextAlign.start,
                                ),
                              ),
                             ),
                  
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(22, 20, 22, 0),
                                    child: TextField(
                                      textAlignVertical: TextAlignVertical.center,
                                      controller: emailForgot,
                                    cursorHeight: 30.0,
                                    decoration: InputDecoration(
                                      hintText: "Email",
                                      prefixIcon: Icon(Icons.email_outlined),
                                      isDense: true,
                                      contentPadding: const EdgeInsets.all(5),
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
                  
                  
                                  Container(height: 35,),
                  
                                  ElevatedButton(onPressed: ()async{

                                    bool check=await ApiCalls.sendOtpResetPass(emailForgot.text);
                                    (check)?Get.to(otpVerify(name: "", email: emailForgot.text, password: "", forgetpass: true,unverified_userid: "",)):ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Sorry")));
                                            
                                  }, child: const Text("Send Code",style: TextStyle(color:Colors.amber),),
                                  style: const ButtonStyle(
                                    backgroundColor: MaterialStatePropertyAll(Colors.white),
                                  ),
                                  
                                  ),
                  
                  
                      ],
                  
                  ),
                ) ,

              




        ),


      );


  }




}


