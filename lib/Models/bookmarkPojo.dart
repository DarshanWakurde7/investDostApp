class Bookmarkpojo {
  int? id;
  String? title;
  int? isPublished;
  int? isSponsored;
  int? isFreeArtical;
  String? featuredImgPath;
  String? content;
  int? categoryId;
  List<String>? tagId;
  int? viewCount;
  String? createdBy;
  int? updatedBy;
  String? categoryString;
  String? createdByString;
  String? updatedByString;
  String? parentCategoryString;
  int? parentCategoryId;

  Bookmarkpojo(
      {this.id,
      this.title,
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
      this.categoryString,
      this.createdByString,
      this.updatedByString,
      this.parentCategoryString,
      this.parentCategoryId});

  Bookmarkpojo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    isPublished = json['is_published'];
    isSponsored = json['is_sponsored'];
    isFreeArtical = json['is_free_artical'];
    featuredImgPath = json['featured_img_path'];
    content = json['content'];
    categoryId = json['category_id'];
    tagId = json['tag_id'].cast<String>();
    viewCount = json['view_count'];
    createdBy = json['created_by'];
    updatedBy = json['updated_by'];
    categoryString = json['category_string'];
    createdByString = json['created_by_string'];
    updatedByString = json['updated_by_string'];
    parentCategoryString = json['parent_category_string'];
    parentCategoryId = json['parent_category_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
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
    data['category_string'] = this.categoryString;
    data['created_by_string'] = this.createdByString;
    data['updated_by_string'] = this.updatedByString;
    data['parent_category_string'] = this.parentCategoryString;
    data['parent_category_id'] = this.parentCategoryId;
    return data;
  }
}