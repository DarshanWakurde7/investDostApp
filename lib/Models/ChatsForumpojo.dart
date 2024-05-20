/* 
// Example Usage
Map<String, dynamic> map = jsonDecode(<myJSONString>);
var myRootNode = Root.fromJson(map);
*/ 
class Child {
    int? id;
    String? message;
    String? profilepic;
    String? name;
    List<Child?>? children;

    Child({this.id, this.message, this.name, this.profilepic,this.children}); 

    Child.fromJson(Map<String, dynamic> json) {
        id = json['id'];
        message = json['message'];
        name = json['name'];
        profilepic=json['profile_pic'];

        if (json['children'] != null) {
         children = <Child>[];
         json['children'].forEach((v) {
         children!.add(Child.fromJson(v));
        });
      }
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = Map<String, dynamic>();
        data['id'] = id;
        data['message'] = message;
        data['name'] = name;
        data['profile_pic']=profilepic;
        data['children'] =children != null ? children!.map((v) => v?.toJson()).toList() : null;
        return data;
    }
}

class Root {
    int? id;
    String? message;
    String? name;
    String? profilepic;
    List<Child?>? children;

    Root({this.id, this.message, this.name,this.profilepic ,this.children,}); 

    Root.fromJson(Map<String, dynamic> json) {
        id = json['id'];
        message = json['message'];
        name = json['name'];
        profilepic=json['profile_pic'];
        if (json['children'] != null) {
         children = <Child>[];
         json['children'].forEach((v) {
         children!.add(Child.fromJson(v));
        });
      }
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = Map<String, dynamic>();
        data['id'] = id;
        data['message'] = message;
        data['name'] = name;
        data['profile_pic']=profilepic;
        data['children'] =children != null ? children!.map((v) => v?.toJson()).toList() : null;
        return data;
    }
}

