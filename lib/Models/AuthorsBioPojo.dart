class AuthorsBioPojo {
  int? authorId;
  int? userId;
  String? authorName;
  String? authorBio;
  int? followersCount;
  int? Post;
  String? attachmentIds;
  String? linkedinProfileLink;
  String? instagramProfileLink;
  String? facebookProfileLink;
  int? activeStatusId;
  int? createdBy;
  String? createdAt;
  String? updatedBy;
  String? updatedAt;
  String? createdByString;
  String? updatedByString;
  List<Articles>? articles;
  String? profilePic;

  AuthorsBioPojo(
      {this.authorId,
      this.userId,
      this.authorName,
      this.authorBio,
      this.followersCount,
      this.Post,
      this.attachmentIds,
      this.linkedinProfileLink,
      this.instagramProfileLink,
      this.facebookProfileLink,
      this.activeStatusId,
      this.createdBy,
      this.createdAt,
      this.updatedBy,
      this.updatedAt,
      this.createdByString,
      this.updatedByString,
      this.articles,
      this.profilePic});

  AuthorsBioPojo.fromJson(Map<String, dynamic> json) {
    authorId = json['author_id'];
    userId = json['user_id'];
    authorName = json['author_name'];
    authorBio = json['author_bio'];
    followersCount = json['followers_count'];
    Post = json['published_articles_count'];
    attachmentIds = json['attachment_ids'];
    linkedinProfileLink = json['linkedin_profile_link'];
    instagramProfileLink = json['instagram_profile_link'];
    facebookProfileLink = json['facebook_profile_link'];
    activeStatusId = json['active_status_id'];
    createdBy = json['created_by'];
    createdAt = json['created_at'];
    updatedBy = json['updated_by'];
    updatedAt = json['updated_at'];
    createdByString = json['created_by_string'];
    updatedByString = json['updated_by_string'];
    if (json['articles'] != null) {
      articles = <Articles>[];
      json['articles'].forEach((v) {
        articles!.add(new Articles.fromJson(v));
      });
    }
    profilePic = json['profile_pic'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['author_id'] = this.authorId;
    data['user_id'] = this.userId;
    data['author_name'] = this.authorName;
    data['author_bio'] = this.authorBio;
    data['followers_count'] = this.followersCount;
    data['published_articles_count'] = this.Post;
    data['attachment_ids'] = this.attachmentIds;
    data['linkedin_profile_link'] = this.linkedinProfileLink;
    data['instagram_profile_link'] = this.instagramProfileLink;
    data['facebook_profile_link'] = this.facebookProfileLink;
    data['active_status_id'] = this.activeStatusId;
    data['created_by'] = this.createdBy;
    data['created_at'] = this.createdAt;
    data['updated_by'] = this.updatedBy;
    data['updated_at'] = this.updatedAt;
    data['created_by_string'] = this.createdByString;
    data['updated_by_string'] = this.updatedByString;
    if (this.articles != null) {
      data['articles'] = this.articles!.map((v) => v.toJson()).toList();
    }
    data['profile_pic'] = this.profilePic;
    return data;
  }
}

class Articles {
  int? id;
  String? featuredImgPath;
  String? title;

  Articles({this.id, this.featuredImgPath});

  Articles.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    featuredImgPath = json['featured_img_path'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['featured_img_path'] = this.featuredImgPath;
    data['title'] = this.title;
    return data;
  }
}