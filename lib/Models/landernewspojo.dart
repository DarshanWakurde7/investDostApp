class Data {
  int? id;
  String? title;
  String? content;
  String? excerpt;
  int? authorId;
  String? tagId;
  int? sectionId;
  int? categoryId;
  int? languageId;
  String? publishDate;
  int? isFreeArtical;
  int? isPublished;
  int? isSponsored;
  String? featuredImgPath;
  String? thumbnailImgPath;
  String? slug;
  String? metaDescription;
  String? displayOrder;
  int? viewCount;
  int? isHelpful;
  String? createdBy;
  String? createdAt;
  String? updatedBy;
  String? updatedAt;
  int? bookmarkStatus;
  String? categoryString;
  String? createdByString;
  String? updatedByString;
  String? parentCategoryString;
  String? parentCategoryId;
  String? authorSlug;
  String? profilePic;

  Data(
      {this.id,
      this.title,
      this.content,
      this.excerpt,
      this.authorId,
      this.tagId,
      this.sectionId,
      this.categoryId,
      this.languageId,
      this.publishDate,
      this.isFreeArtical,
      this.isPublished,
      this.isSponsored,
      this.featuredImgPath,
      this.thumbnailImgPath,
      this.slug,
      this.metaDescription,
      this.displayOrder,
      this.viewCount,
      this.isHelpful,
      this.createdBy,
      this.createdAt,
      this.updatedBy,
      this.updatedAt,
      this.bookmarkStatus,
      this.categoryString,
      this.createdByString,
      this.updatedByString,
      this.parentCategoryString,
      this.parentCategoryId,
      this.authorSlug,
      this.profilePic});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    content = json['content'];
    excerpt = json['excerpt'];
    authorId = json['author_id'];
    tagId = json['tag_id'];
    sectionId = json['section_id'];
    categoryId = json['category_id'];
    languageId = json['language_id'];
    publishDate = json['publish_date'];
    isFreeArtical = json['is_free_artical'];
    isPublished = json['is_published'];
    isSponsored = json['is_sponsored'];
    featuredImgPath = json['featured_img_path'];
    thumbnailImgPath = json['thumbnail_img_path'];
    slug = json['slug'];
    metaDescription = json['meta_description'];
    displayOrder = json['display_order'];
    viewCount = json['view_count'];
    isHelpful = json['is_helpful'];
    createdBy = json['created_by'];
    createdAt = json['created_at'];
    updatedBy = json['updated_by'];
    updatedAt = json['updated_at'];
    bookmarkStatus = json['bookmark_status'];
    categoryString = json['category_string'];
    createdByString = json['created_by_string'];
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
    data['content'] = this.content;
    data['excerpt'] = this.excerpt;
    data['author_id'] = this.authorId;
    data['tag_id'] = this.tagId;
    data['section_id'] = this.sectionId;
    data['category_id'] = this.categoryId;
    data['language_id'] = this.languageId;
    data['publish_date'] = this.publishDate;
    data['is_free_artical'] = this.isFreeArtical;
    data['is_published'] = this.isPublished;
    data['is_sponsored'] = this.isSponsored;
    data['featured_img_path'] = this.featuredImgPath;
    data['thumbnail_img_path'] = this.thumbnailImgPath;
    data['slug'] = this.slug;
    data['meta_description'] = this.metaDescription;
    data['display_order'] = this.displayOrder;
    data['view_count'] = this.viewCount;
    data['is_helpful'] = this.isHelpful;
    data['created_by'] = this.createdBy;
    data['created_at'] = this.createdAt;
    data['updated_by'] = this.updatedBy;
    data['updated_at'] = this.updatedAt;
    data['bookmark_status'] = this.bookmarkStatus;
    data['category_string'] = this.categoryString;
    data['created_by_string'] = this.createdByString;
    data['updated_by_string'] = this.updatedByString;
    data['parent_category_string'] = this.parentCategoryString;
    data['parent_category_id'] = this.parentCategoryId;
    data['author_slug'] = this.authorSlug;
    data['profile_pic'] = this.profilePic;
    return data;
  }
}