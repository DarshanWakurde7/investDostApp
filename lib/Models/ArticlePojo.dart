class DataOfArticles {
  int? id;
  String? title;
  int? authorId;
  int? isPublished;
  int? isSponsored;
  int? isFreeArtical;
  String? featuredImgPath;
  String? content;
  int? categoryId;
  String? tagId;
  int? viewCount;
  String? createdBy;
  String? updatedBy;
  String? updatedAt;
  String? categoryString;
  String? createdByString;
  String? authorName;
  String? updatedByString;
  String? parentCategoryString;
  String? parentCategoryId;
  String? authorSlug;
  String? profilePic;
   List<String>? tagNames;

  DataOfArticles(
      {this.id,
      this.title,
      this.authorId,
      this.isPublished,
      this.isSponsored,
      this.isFreeArtical,
      this.featuredImgPath,
      this.content,
      this.categoryId,
      this.tagId,
      this.viewCount,
      this.createdBy,
      this.updatedBy,
      this.updatedAt,
      this.categoryString,
      this.createdByString,
      this.authorName,
      this.updatedByString,
      this.parentCategoryString,
      this.parentCategoryId,
      this.authorSlug,
      this.profilePic,
      this.tagNames});

  DataOfArticles.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    authorId = json['author_id'];
    isPublished = json['is_published'];
    isSponsored = json['is_sponsored'];
    isFreeArtical = json['is_free_artical'];
    featuredImgPath = json['featured_img_path'];
    content = json['content'];
    categoryId = json['category_id'];
    tagId = json['tag_id'];
 tagNames = json['tag_names'] != null ? List<String>.from(json['tag_names']) : null;
    viewCount = json['view_count'];
    createdBy = json['created_by'];
    updatedBy = json['updated_by'];
    updatedAt = json['updated_at'];
    categoryString = json['category_string'];
    createdByString = json['created_by_string'];
    authorName = json['author_name'];
    updatedByString = json['updated_by_string'];
    parentCategoryString = json['parent_category_string'];
    parentCategoryId = json['parent_category_id'];
    authorSlug = json['author_slug'];
    profilePic = json['profile_pic'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['author_id'] = this.authorId;
    data['is_published'] = this.isPublished;
    data['is_sponsored'] = this.isSponsored;
    data['is_free_artical'] = this.isFreeArtical;
    data['featured_img_path'] = this.featuredImgPath;
    data['content'] = this.content;
    data['category_id'] = this.categoryId;
    data['tag_id'] = this.tagId;
    data['view_count'] = this.viewCount;
    data['created_by'] = this.createdBy;
    data['updated_by'] = this.updatedBy;
    data['updated_at'] = this.updatedAt;
    data['category_string'] = this.categoryString;
    data['created_by_string'] = this.createdByString;
    data['author_name'] = this.authorName;
    data['updated_by_string'] = this.updatedByString;
    data['parent_category_string'] = this.parentCategoryString;
    data['parent_category_id'] = this.parentCategoryId;
    data['author_slug'] = this.authorSlug;
    data['profile_pic'] = this.profilePic;
data['tag_names'] = this.tagId;
    return data;
  }
}


