import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:investdost/Controller/getxInternetConnectivity.dart';
import 'package:investdost/Models/UserPojo.dart';
import 'package:investdost/apiCalls/AllApiCalls.dart';
import 'package:investdost/Screens/loginpage.dart';
import 'package:investdost/Screens/mainLanderPage.dart';
import 'package:shared_preferences/shared_preferences.dart';
void main() {




  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp,DeviceOrientation.portraitDown])
  .then((_) {
  runApp(GetMaterialApp(
    
    home: const MyApp(),debugShowCheckedModeBanner: false,
  
    theme: ThemeData.from( colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,),
  
  ));
  });





  Get.put(GetInternet(),permanent: true);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});





  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
      
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});



  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

 late int userid;
 
  getUserId()async{
final SharedPreferences prefs = await SharedPreferences.getInstance();
         setState(() {
            userid=prefs.getInt("userid")??0;
         });
          
       
  }

 @override
  void initState() {
    getUserId();
    super.initState();

Timer(const Duration(seconds: 3), () async{
    

      
       if(userid==0){
  
          Get.offAll(LoginPage());
       }else{
      
           await ApiCalls.LatestArticel();
           
        Get.offAll(MyWidget(ind: 0,user_id: userid,));
       
       }


 });



  }

  @override
  Widget build(BuildContext context) {
 
    return Scaffold(

  

      body: Center(


        child: Container(
          
            child: Image.asset("assets/images/welcome.png"),
        ),
    ),
    );
  }
}




















