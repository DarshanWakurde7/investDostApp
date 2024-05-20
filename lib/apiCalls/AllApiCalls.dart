import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:investdost/Models/AuthorChatPojo.dart';
import 'package:investdost/Models/AuthorsWhomtexted.dart';

import 'package:investdost/Screens/ChatsForum.dart';
import 'package:investdost/Screens/LanderPage.dart';
import 'package:investdost/Models/ArticlePojo.dart';
import 'package:investdost/Models/AuthorsBioPojo.dart';

import 'package:investdost/Models/LeaderBoardPojo.dart';
import 'package:investdost/Models/QuizCaregories.dart';
import 'package:investdost/Models/QuizPojo.dart';
import 'package:investdost/Models/RewardPojo.dart';
import 'package:investdost/Models/Roommodel.dart';
import 'package:investdost/Models/UserPojo.dart';
import 'package:investdost/Models/dropdown.dart';
import 'package:investdost/Screens/newloginpage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Models/landernewspojo.dart';


String baseurl="https://investdost-test.portalwiz.in/investdostapi/public/api/";
// String baseurl="https://investdost-dev.portalwiz.in/investdostapi/public/api/";

class ApiCalls {


static String Allnews='${baseurl}articles';
static String GetFeaturedNews='${baseurl}featured_articles';







 static  Future<void> getNews() async{
SharedPreferences sharedPreferences =await SharedPreferences.getInstance();

var url=Uri.parse(Allnews);


final response= await http.post(url,body: {
"user_id":"${sharedPreferences.getInt("userid")}"
});

var data=jsonDecode(response.body);

if(response.statusCode==200){

newsdata.clear();
for (Map<String,dynamic> i in data['data']){

newsdata.add(Data.fromJson(i));
}



}

}
 static  Future<void> getFeatured() async{

SharedPreferences sharedPreferences =await SharedPreferences.getInstance();
var url=Uri.parse(GetFeaturedNews);


final response= await http.post(url,body: {
  
"user_id":"${sharedPreferences.getInt("userid")}"

});

var data=jsonDecode(response.body.toString());



if(response.statusCode==200){

newsdata.clear();
for (Map<String,dynamic> i in data['data']){

newsdata.add(Data.fromJson(i));
}



}

}
 static  Future<void> getSponserdArticles() async{
SharedPreferences sharedPreferences =await SharedPreferences.getInstance();

var url=Uri.parse("${baseurl}get_sponsored_articles");


final response= await http.post(url,
body:  {
"user_id":"${sharedPreferences.getInt("userid")}"
}
);

var data=jsonDecode(response.body.toString());



if(response.statusCode==200){

newsdata.clear();
for (Map<String,dynamic> i in data['data']){

newsdata.add(Data.fromJson(i));
}



}

}
 static  Future<void> getEditorsChoice() async{

SharedPreferences sharedPreferences =await SharedPreferences.getInstance();
var url=Uri.parse('${baseurl}editors_picks');


final response= await http.post(url,body: {
"user_id":"${sharedPreferences.getInt("userid")}"
});

var data=jsonDecode(response.body.toString());



if(response.statusCode==200){

newsdata.clear();
for (Map<String,dynamic> i in data['data']){

newsdata.add(Data.fromJson(i));
}



}

}
 static  Future<void> LatestArticel() async{

SharedPreferences sharedPreferences =await SharedPreferences.getInstance();
var url=Uri.parse('${baseurl}latest_articles');


final response= await http.post(url,body: {
  
    "user_id":"${sharedPreferences.getInt("userid")}"

});


print(response.body);
var data=jsonDecode(response.body.toString());



if(response.statusCode==200){

newsdata.clear();
for (Map<String,dynamic> i in data['data']){

newsdata.add(Data.fromJson(i));
}



}

}
 static  Future<void> getTrendingArticle() async{

SharedPreferences sharedPreferences =await SharedPreferences.getInstance();
var url=Uri.parse('${baseurl}trending_articles');


final response= await http.post(url,body: {
"user_id":"${sharedPreferences.getInt("userid")}"
} );

var data=jsonDecode(response.body.toString());



if(response.statusCode==200){

newsdata.clear();
for (Map<String,dynamic> i in data['data']){

newsdata.add(Data.fromJson(i));
}


}

}





static Future<DataOfArticles> getFullArticsle(int id) async{
SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
late DataOfArticles data;
Uri url=Uri.parse("${baseurl}article_details");

var body={
    "article_id": id.toString(),
    "user_id":"${sharedPreferences.getInt("userid")}"
};



final response=await http.post(url,body: body);

print(response.body);

if(response.statusCode==200){

var body=jsonDecode(response.body.toString());

data=DataOfArticles.fromJson(body["data"]);

}

return data;




}



static Future<bool> LoginApi(String username,String password)async{


Uri url=Uri.parse("${baseurl}login");
  var body={
    "username": username,
    "password": password
};


final response=await http.post(url,body:body);


if(response.statusCode==200 && jsonDecode(response.body.toString())["success"]){

  return true;
}
else{
  return false;
}

}



static Future<List<Dropdownpage> > apiGetDropDownItems()async{
 List<Dropdownpage> dropdownconstent=[];

final response=await http.get(Uri.parse("${baseurl}fetch_categories"));

for (Map<String,dynamic> i in jsonDecode(response.body.toString())["data"]){

dropdownconstent.add(Dropdownpage(categoryName: i["category_name"], id: i["id"]));

}

return dropdownconstent;

}



static Future<List<Data>> getCategorywiseNew(int id)async{


// var body={
//   "id":id.toString()
// };

List<Data> articlesCtegoryeise=[];

Uri url=Uri.parse("${baseurl}category_articles?");

final response= await http.post(url,body: {"category_id":id.toString()});
articlesCtegoryeise.clear();
if(response.statusCode==200){
  for(Map<String,dynamic> i in jsonDecode(response.body.toString())["data"]){
  articlesCtegoryeise.add(Data.fromJson(i));

}

}
else{
  Get.to(newLogin());
}

return articlesCtegoryeise;

}






static Future<List<RoomModel>> FetchAllRooms() async{

List<RoomModel> myRooms=[];
final response= await http.post(Uri.parse("${baseurl}fetch_room"),body: {});
myRooms.clear();
for(Map<String,dynamic> i in jsonDecode(response.body)){

        myRooms.add(RoomModel(id: i["room_id"], room_name: i["room_name"], created_by: i["created_by"]));

}
return myRooms;


}
static Future<List<RomTopic>> FetchAllTopics(int id) async{

print(id);
List<RomTopic> myRooms=[];
final response= await http.post(Uri.parse("${baseurl}fetch_room_topic_per_room?"),body: {

 "room_id":id.toString()
});

myRooms.clear();


for(Map<String,dynamic> i in jsonDecode(response.body)){

        myRooms.add(RomTopic(id: i["room_id"], topic: i["topic_name"], created_by: i["created_by"],topic_id: i["topic_id"]));

}
return myRooms;


}
static Future<List<Comment>> GetCommentByTOpics() async{
final response= await http.post(Uri.parse("${baseurl}fetch_discussion_forums"),body: {

"room_id":3.toString(),
"topic_id":5.toString()
});


print(response.body);

List<Comment> comments= jsonDecode(response.body.toString())["discussions"]
      .map<Comment>((json) => Comment.fromJson(json))
      .toList();

     return comments;

}




static Future<List<QuizPojio>> GetQuizData(int id) async{

    
List<QuizPojio> myQuizData=[];

try{


final response= await http.post(Uri.parse("${baseurl}fetch_quiz"),body: 
{
  "quiz_id":id.toString()
}

);


print(response.body);

for(Map<String,dynamic> i in jsonDecode(response.body)){

      myQuizData.add(QuizPojio.fromJson(i));

}
}
catch(e){
  print(e);
}
     return myQuizData;

}





static Future<bool> addBookmark(int articleId)async{

SharedPreferences sharedPreferences=await SharedPreferences.getInstance();

final response=await http.post(Uri.parse("${baseurl}add_bookmark"),body: {
    "user_id":sharedPreferences.getInt("userid").toString(),
    "artical_id": articleId.toString(),
    "created_by": "1"
});


return jsonDecode(response.body)["success"];


}




static Future<bool> removeBookmark(int articleId)async{

SharedPreferences sharedPreferences=await SharedPreferences.getInstance();

final response=await http.post(Uri.parse("${baseurl}delete_bookmark"),body: {
    "user_id":sharedPreferences.getInt("userid").toString(),
    "artical_id": articleId.toString(),
});


print(response.body);

return jsonDecode(response.body)["success"];






}


static Future<List<DataOfArticles>> fetchBookmarks() async{

List<DataOfArticles> bookmarks=[];
SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
final response=await http.post(Uri.parse("${baseurl}fetch_user_bookmarks"),
body: {
  "user_id":(sharedPreferences.getInt("userid")).toString()
}
);





for(Map<String,dynamic> i in jsonDecode(response.body)["data"]){

  bookmarks.add(await ApiCalls.getFullArticsle(i["id"]));
}
print(bookmarks.length);
return bookmarks;
}



static Future<List<QuizData>> getQuizCategories() async{

List<QuizData> quizCategories=[];

final response=await http.get(Uri.parse("${baseurl}quiz_categories"));


for(Map<String,dynamic> i in jsonDecode(response.body)["data"]){

  quizCategories.add(QuizData.fromJson(i));

}

// print(response.body);
return quizCategories;





}
static Future<List<QuizTitle>> getQuizCategoriesTitle(int categoryId) async{


  var body={

    "category_id":categoryId.toString()

  };

List<QuizTitle> quizCategories=[];

final response=await http.post(Uri.parse("${baseurl}fetch_quizzes_by_category"),body: body);


for(Map<String,dynamic> i in jsonDecode(response.body)){

  quizCategories.add(QuizTitle(id: i['id'],title: i['title'],description: i['description']));

}

// print(response.body);
return quizCategories;





}

static Future<void> postComments(String msg ) async{


SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
final response=await http.post(Uri.parse("${baseurl}add_discussion_forum_comment"),
body: {
    "message":msg,
    "room_id": "3",
    "topic_id": "5",
    "commented_by":"8",
    "created_by":sharedPreferences.getInt("userid").toString()
}
);


print(response.body);

// print(response.body);






}
static Future<void> postReply(String msg,int id ) async{

SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
final response=await http.post(Uri.parse("${baseurl}add_discussion_forum_comment"),
body: {
  
    "parent_comment_id": id.toString(),
    "message":msg,
    "room_id": "3",
    "topic_id": "5",
    // "commented_by":
    "created_by":sharedPreferences.getInt("userid").toString(),

}
);


print(response.body);

// print(response.body);






}



static Future<String> RegisterUser(String username,String password,String Email) async{


final response=await http.post(Uri.parse("${baseurl}register_as_user"),
body: {
  "role_id":3.toString(),
   "username":username,
   "password":password,
   "email":Email,
   "is_remembered":0.toString(),
}
);



return response.body;

}



static Future<String> SendOtp(String username,String password,String Email,String otp) async{

SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
final response=await http.post(Uri.parse("${baseurl}verify_email_otp_for_user"),
body: {
  "role_id":3.toString(),
  "username":username,
  "password":password,
  "email":Email,
  "is_remembered":0.toString(),
  "otp":otp, 

});


print(jsonDecode(response.body)["user_id"]);
if(jsonDecode(response.body)["success"]){
  sharedPreferences.setInt("userid",jsonDecode(response.body)["user_id"] );
  sharedPreferences.setString("token",jsonDecode(response.body)["token"] );
  //   await http.post(Uri.parse("${baseurl}add_default_user_profile_setup"),body: {
  //     "user_id":(sharedPreferences.getInt("userid")).toString(),
  // });
return response.body;
}
else{
  return response.body;
}

// print(response.body);

}

static Future<bool> LoginUser(String password,String Email) async{

SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
final response=await http.post(Uri.parse("${baseurl}log_in"),
body: {
  "role_id":3.toString(),
   "username":Email,
   "password":password
});


print(response.body);
if(jsonDecode(response.body)["success"]){
  sharedPreferences.setInt("userid",jsonDecode(response.body)["user_id"] );
  sharedPreferences.setString("username",jsonDecode(response.body)["username"] );
  sharedPreferences.setString("token",jsonDecode(response.body)["token"] );
return true;
}
else{
  return false;
}

// print(response.body);

}





static Future<bool> sendOtpResetPass(String email) async{

final response=await http.post(Uri.parse("${baseurl}send_otp_to_reset_password"),
body: {
  "email":email,
});
return jsonDecode(response.body)["success"];

}


static Future<UserDetailsPojo> fetchuserProfile(int userId) async{
UserDetailsPojo userDetailsPojo;
final response=await http.post(Uri.parse("${baseurl}fetch_single_user_profile"),
body: {
  "user_id":userId.toString(),
});
print(response.body);

userDetailsPojo= UserDetailsPojo.fromJson(jsonDecode(response.body));

return userDetailsPojo;

}




static Future<bool> verifyOtpToResetPass(String otp,String password) async{

final response=await http.post(Uri.parse("${baseurl}verify_otp_to_reset_password"),
body: {
  "otp":otp,
  "password":password,
});
return jsonDecode(response.body)["success"];

}



static Future<bool> markUnverifiedUser(String unverified_user_id) async{
final response=await http.post(Uri.parse("${baseurl}deactivate_otp"),
body: {
   "role_id":3.toString(),
   "unverified_user_id":unverified_user_id,
});
return jsonDecode(response.body)["success"];

}


static Future<bool> sendInviteTOUser(String mail) async{
  SharedPreferences pref=await SharedPreferences.getInstance();
final response=await http.post(Uri.parse("${baseurl}send_invite"),
body: {
 "recipient_email":mail,
 "sender_user_id":(pref.getInt("userid")).toString(),
});
Get.rawSnackbar(title: "Invite Friend",message:  jsonDecode(response.body)["message"],backgroundColor: Colors.amber.shade300);
return jsonDecode(response.body)["success"];

}






static Future<LeaderBoardPojo> fetchLeaderBoard(int userid)async{

  final response=await http.post(Uri.parse("${baseurl}fetch_top_ranks"),
body: {
  "user_id":userid.toString(),
});
print(response.body);

return LeaderBoardPojo.fromJson(jsonDecode(response.body));

}
static Future<void> calculatePoints(int userid)async{
  final response=await http.post(Uri.parse("${baseurl}calculate_current_leaderboard_score"),
body: {
  "user_id":userid.toString(),
});

print(response.body);

}
static Future<void> updateName(int userid,String name,String lname)async{
  final response=await http.post(Uri.parse("${baseurl}update_user_profile"),
body: {
  "user_id":userid.toString(),
  "fname":name,
  "lname":lname,
});

print(response.body);

}
static Future<void> updateDob(int userid,String dob)async{
  final response=await http.post(Uri.parse("${baseurl}update_user_profile"),
body: {
  "user_id":userid.toString(),
  "dob":dob,
});

print(response.body);

}
static Future<void> contactNo(int userid,String contact)async{
  final response=await http.post(Uri.parse("${baseurl}update_user_profile"),
body: {
  "user_id":userid.toString(),
  "phone":contact,
});

print(response.body);

}

static Future<void> updateGender(int userid,String gender)async{
  final response=await http.post(Uri.parse("${baseurl}update_user_profile"),
body: {
  "user_id":userid.toString(),
  "gender":gender,
});

print(response.body);

}


static Future<void> updateCountry(int userid,String country)async{
  final response=await http.post(Uri.parse("${baseurl}update_user_profile"),
body: {
  "user_id":userid.toString(),
  "country":country,
});

print(response.body);

}



static Future<List<int>> getBookMarkIds()async{
  SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
  List<int> bookmarksIds=[];
  final response=await http.post(Uri.parse("${baseurl}fetch_bookmark_ids"),
body: {
  "user_id":sharedPreferences.getInt("userid").toString(),
});
bookmarksIds=[...jsonDecode(response.body)];

return bookmarksIds;
}


static Future<List<RewardsPojo>> getRewards()async{
  SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
  List<RewardsPojo> rewards=[];
  final response=await http.post(Uri.parse("${baseurl}fetch_all_user_reward_points_log"),
body: {
  "user_id":sharedPreferences.getInt("userid").toString(),
});


for(Map<String,dynamic> i in jsonDecode(response.body)){
  rewards.add(RewardsPojo.fromJson(i));
}
print(response.body);

return rewards;
}



static Future<bool> assignranktouser()async{
  final response=await http.get(Uri.parse("${baseurl}assign_rank_to_user"));
print(response.body);
return true;

}




static Future<String> getProfileCompleteInfo() async{
  SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
  final response=await http.post(Uri.parse("${baseurl}profile_complete_check"),body: {
    "user_id":sharedPreferences.getInt("userid").toString(),
  });

  print(response.body);
  return jsonDecode(response.body)["total_percentage"];

}
static Future<AuthorsBioPojo> fetchAuthorsBio(int authorid,String authorslug) async{
  SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
  AuthorsBioPojo authorsBioPojo;
  final response=await http.post(Uri.parse("${baseurl}fetch_single_author_profile"),body: {
 "author_slug":authorslug
});
authorsBioPojo= AuthorsBioPojo.fromJson(jsonDecode(response.body));
print(response.body);
return authorsBioPojo;
}
static Future<void> folluwAuthor(int authorid,String name) async{
  SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
  AuthorsBioPojo authorsBioPojo;
  final response=await http.post(Uri.parse("${baseurl}follow_author"),body: {
 "author_id":"${authorid}",
  "follower_id":"${sharedPreferences.getInt("userid")??0}"
});
print(response.body);
Get.rawSnackbar(title: "You Started following ${name}",message: jsonDecode(response.body)["message"],backgroundColor: Colors.amber.shade300,icon: Icon(Icons.verified));
}
static Future<void> unFolluwAuthor(int authorid,String name) async{
  SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
  AuthorsBioPojo authorsBioPojo;
  final response=await http.post(Uri.parse("${baseurl}unfollow_author"),body: {
 "author_id":"${authorid}",
  "follower_id":"${sharedPreferences.getInt("userid")??0}"
});
print("unfollow");
Get.rawSnackbar(title: "You Unfollowed ${name}",message: jsonDecode(response.body)["message"],backgroundColor: Colors.redAccent.shade200,icon: Icon(Icons.verified));
}


static Future<bool> updateProfilepicture(File _imageFile) async{
SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
var formData = http.MultipartRequest('POST', Uri.parse('${baseurl}add_profile_pic'));
formData.fields.addAll({
"user_id":sharedPreferences.getInt("userid").toString(),
});

formData.files.add(await http.MultipartFile.fromPath(
  'image',
  _imageFile.path,
));

 var response = await formData.send();
Get.rawSnackbar(title: "Profiel updated",message: jsonDecode(await response.stream.bytesToString())["message"],backgroundColor: Colors.greenAccent,icon: Icon(Icons.verified));
return (response.statusCode==200);


}




static Future<List<messageDart>> FetchAuthorsChats(int Authorid)async{
List<messageDart> messages=[];
print(Authorid);
  SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
final response=await http.post(Uri.parse("${baseurl}fetch_author_messages"),body: {
   "author_id": "${Authorid}",
   "user_id": "${sharedPreferences.getInt("userid")}"
});

print(response.body);
for(Map<String,dynamic> i in jsonDecode(response.body)){
messages.add(messageDart.fromJson(i));
}

return messages;
}

static Future<void> SendMessagetoAuthor(int Authorid,String Message,String date)async{
print(Message);
  SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
final response=await http.post(Uri.parse("${baseurl}send_message"),body: {
  "message_type":"1",
   "author_id": "${Authorid}",
   "user_id": "${sharedPreferences.getInt("userid")}",
   "sender_id": "${sharedPreferences.getInt("userid")}",
   "content": Message
});

print(response.body);


}



static Future<List<DataOfArticles>> getRelatedArtcles(int id)async{

List<DataOfArticles> articles=[];
final response=await http.post(Uri.parse("${baseurl}get_related_content"),body: {
   "category_id": "${id}"
});



for(Map<String,dynamic> i in jsonDecode(response.body)["data"]){
  articles.add(DataOfArticles.fromJson(i));
}

return articles;

}


static Future<List<AuthorswhomTexted>> FetchAuthorsMessaged()async{
List<AuthorswhomTexted> textedauthos=[];
  SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
final response=await http.post(Uri.parse("${baseurl}fetch_chatrooms_for_user"),body: {
   "user_id": "${sharedPreferences.getInt("userid")}",
});


for(Map<String,dynamic> i in jsonDecode(response.body)){
 textedauthos.add(AuthorswhomTexted.fromJson(i));
}

return textedauthos;



}
static Future<List<AuthorswhomTexted>> FetuchFollwedAuthors()async{
List<AuthorswhomTexted> textedauthos=[];
  SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
final response=await http.post(Uri.parse("${baseurl}get_followed_authors"),body: {
   "follower_id": "${sharedPreferences.getInt("userid")}",
});

print(response.body);

for(Map<String,dynamic> i in jsonDecode(response.body)){
 textedauthos.add(AuthorswhomTexted.fromJson(i));
}

return textedauthos;



}
static Future<void> FeedbackforArticle(int articleid,int heplfulArticle)async{
List<AuthorswhomTexted> textedauthos=[];
  SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
final response=await http.post(Uri.parse("${baseurl}add_feedback"),body: {
  "article_id": "${articleid}",
  "is_helpful":"${heplfulArticle}"
  });

print(response.body);

Get.rawSnackbar(title: "Thankyou for the Review",message: jsonDecode(response.body)["message"],backgroundColor: Colors.greenAccent,icon: Icon(Icons.reviews_outlined));

}


static Future<void> UpdateUserName(String Name)async{

  SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
final response=await http.post(Uri.parse("${baseurl}update_username"),body: {
  "user_id": "${sharedPreferences.getInt("userid")}",
  "username":"${Name}"
  });

print(response.body);

Get.rawSnackbar(title: "Thankyou for the Review",message: jsonDecode(response.body)["message"],backgroundColor: Colors.greenAccent,icon: Icon(Icons.reviews_outlined));





}


static Future<void> AddRewardPoints(int points)async{

  SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
final response=await http.post(Uri.parse("${baseurl}add_reward_points"),body: {
  "user_id": "${sharedPreferences.getInt("userid")}",
"points":"${points}",

  });

print(response.body);

Get.rawSnackbar(title: "Congratulation!!!",message: jsonDecode(response.body)["message"],backgroundColor: Colors.greenAccent,icon: Icon(Icons.reviews_outlined));





}









static Future<bool> sendImageMessage(File _imageFile,int Authorid) async{
SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
var formData = http.MultipartRequest('POST', Uri.parse('${baseurl}send_message'));
formData.fields.addAll({

   "author_id": "${Authorid}",
   "user_id": "${sharedPreferences.getInt("userid")}",
   "sender_id": "${sharedPreferences.getInt("userid")}",
   "message_type":"2",
   "content": "",
});

formData.files.add(await http.MultipartFile.fromPath(
  'image',
  _imageFile.path,
));

 var response = await formData.send();
Get.rawSnackbar(title: "Message Sent",message: jsonDecode(await response.stream.bytesToString())["message"],backgroundColor: Colors.greenAccent,icon: Icon(Icons.verified));
return (response.statusCode==200);


}


}