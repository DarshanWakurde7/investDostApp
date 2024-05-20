

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'package:investdost/apiCalls/AllApiCalls.dart';
import 'package:investdost/Screens/forgotPassword.dart';
import 'package:investdost/logics/validations.dart';
import 'package:investdost/Screens/loginpage.dart';
import 'package:investdost/main.dart';
import 'package:lottie/lottie.dart';






class newLogin extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
   
        return newLoginState();

  }

}


class newLoginState extends State<newLogin>{

bool togVisible=true;
var passIcon=Icons.visibility_off_outlined;

var emailLog=TextEditingController();
var passLog=TextEditingController();
Color onFocusborder=Colors.amber;

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
                onTap: () {
                 Navigator.pop(context);
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
              child: const Text("Login",
              style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400,shadows: [    Shadow(
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
              style: TextStyle(fontSize: 10,),),
            ),]
          ),
        ),
        
        
        Container(height: 50,),
        textFieldWidget(),
          Container(height: 15,),
        
        
        
        
        forgetPass(),
        
        Container(height:20),
        
        const Text("Or Continue with ",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w400),textAlign: TextAlign.center,),
         Container(height: 20,),
        
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
        CircleAvatar(
           maxRadius: 20.0,
        minRadius: 15.0,
          child: Padding(
            padding: const EdgeInsets.all(2),
            child: SvgPicture.asset("assets/images/google.svg")),
        
         backgroundColor: Colors.white,
        ),
        
          Container(width: 10,),
         CircleAvatar(
        maxRadius: 20.0,
        minRadius: 15.0,
          child: Image(image: NetworkImage("https://play-lh.googleusercontent.com/U202Yto9o6IT1ZA8bgigA5q4nIzvu0S9ztl2d0WQSj6Iw0hIw5W7SIAnH0U2-Kk3nao")),
        
          backgroundColor: Colors.white,
        ),
            ],
          ),
        
             Container(height: 30,),
        button(context),
           Container(height: 90,),
        
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          
          children: [
          
           const  Text("New User?",style: TextStyle(fontSize: 10)
           ,),
          
          Container(width: 5,),
          
            InkWell(
              onTap: (){
          
               Get.to(LoginPage(),transition: Transition.leftToRight,duration: Duration(milliseconds: 500));
          
              },
              child: const Text("Register",style: TextStyle(fontSize: 12,color: Colors.blue),
            )
            ),
          ],
        ),
        
          
        
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

        

Container(height: 15,),
                                Padding(
                                  
                                    padding: EdgeInsets.fromLTRB(30, 0, 20, 0),
                                    child: TextField(
                                      onChanged: (value) {
                                        print(value);
                                       if(AllValidations.isValidEmail(value)){
                                        setState(() {
                                          onFocusborder=Colors.greenAccent;
                                        });
                                       }
                                       else{
                                          setState(() {
                                          onFocusborder=Colors.redAccent;
                                        });
                                       }
                                      },
                                      textAlignVertical: TextAlignVertical.center,
                                      controller: emailLog,
                                    cursorHeight: 30.0,
                                    decoration: InputDecoration(
                                      hintText: "Username",
                                      prefixIcon: Icon(Icons.person_outline,size: 30,),
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
                                        borderSide:   BorderSide(
                                        color: onFocusborder,  
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
                                      controller: passLog,
                                    cursorHeight: 30.0,
                                    decoration: InputDecoration(
                                      hintText: "Password",
                                      prefixIcon: Icon(Icons.lock_outline_rounded,size: 30,),
                                      suffixIcon: InkWell(
                                        onTap: (){
                                              toVisible();
                                        },
                                        child: Icon(passIcon),
                                      ),
                                      isDense: true,
                                      contentPadding: const EdgeInsets.all(5.0),
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
                  



  ],
 );





}



//--------------------------forget password ------------------------------------------------


Padding forgetPass(){

return Padding(
  
  padding:const EdgeInsets.fromLTRB(30,0,40,0),

child: Row(
  mainAxisAlignment: MainAxisAlignment.end,
  children: [
 


Container(width: 5,),
InkWell(
  onTap: (){
    Navigator.push(context, MaterialPageRoute(builder: (context) => forgotPassword(),));
  },
  child: const Text("Forget password?",
  style: TextStyle(fontWeight: FontWeight.w400,fontSize: 10,color: Colors.blue),
  ),
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
          // bool check=await ApiCalls.LoginApi(emailLog.text.toString(),passLog.text.toString());//give it to of else later
          bool check=await ApiCalls.LoginUser(passLog.text.toString(),emailLog.text.toString(),);
       
          if(check){
                     Get.offAll(MyHomePage(title: ""),transition: Transition.circularReveal,duration: Duration(milliseconds: 500));
          }
          else{
            Navigator.pop(context);
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Sorry user Not found"),backgroundColor: Colors.redAccent,));
          }



      },
      style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromARGB(255, 255, 255, 255),
          ),
            child: const Text(
          "Login",
          style:   TextStyle(color: Colors.amber,fontWeight: FontWeight.w500),
          ),
      ),  
    ),
  ),
);
}


}