class AuthorswhomTexted {
  int? authorId;
  String? authorName;
  String? authoruslug;
  String? authorProfilePic;

  AuthorswhomTexted({this.authorId, this.authorName, this.authorProfilePic});

  AuthorswhomTexted.fromJson(Map<String, dynamic> json) {
    authorId = json['author_id'];
    authorName = json['author_name'];
    authoruslug = json['author_slug'];
    authorProfilePic = json['author_profile_pic'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['author_id'] = this.authorId;
    data['author_name'] = this.authorName;
    data['author_slug'] = this.authoruslug;
    data['author_profile_pic'] = this.authorProfilePic;
    return data;
  }
}