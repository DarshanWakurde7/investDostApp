class GetLatestArticle {
  int? id;
  String? title;
  String? content;
  String? excerpt;
  int? authorId;
  List<String>? tagId;
  int? sectionId;
  int? categoryId;
  int? languageId;
  String? publishDate;
  int? isFreeArtical;
  int? isPublished;
  String? featuredImgPath;
  String? slug;
  String? metaDescription;
  int? viewCount;
  String? createdBy;
  String? createdAt;
  int? updatedBy;
  String? updatedAt;
  String? categoryString;
  String? createdByString;
  String? updatedByString;
  String? parentCategoryString;
  String? parentCategoryId;

  GetLatestArticle(
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
      this.featuredImgPath,
      this.slug,
      this.metaDescription,
      this.viewCount,
      this.createdBy,
      this.createdAt,
      this.updatedBy,
      this.updatedAt,
      this.categoryString,
      this.createdByString,
      this.updatedByString,
      this.parentCategoryString,
      this.parentCategoryId});

  GetLatestArticle.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    content = json['content'];
    excerpt = json['excerpt'];
    authorId = json['author_id'];
    tagId = json['tag_id'].cast<String>();
    sectionId = json['section_id'];
    categoryId = json['category_id'];
    languageId = json['language_id'];
    publishDate = json['publish_date'];
    isFreeArtical = json['is_free_artical'];
    isPublished = json['is_published'];
    featuredImgPath = json['featured_img_path'];
    slug = json['slug'];
    metaDescription = json['meta_description'];
    viewCount = json['view_count'];
    createdBy = json['created_by'];
    createdAt = json['created_at'];
    updatedBy = json['updated_by'];
    updatedAt = json['updated_at'];
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
    data['featured_img_path'] = this.featuredImgPath;
    data['slug'] = this.slug;
    data['meta_description'] = this.metaDescription;
    data['view_count'] = this.viewCount;
    data['created_by'] = this.createdBy;
    data['created_at'] = this.createdAt;
    data['updated_by'] = this.updatedBy;
    data['updated_at'] = this.updatedAt;
    data['category_string'] = this.categoryString;
    data['created_by_string'] = this.createdByString;
    data['updated_by_string'] = this.updatedByString;
    data['parent_category_string'] = this.parentCategoryString;
    data['parent_category_id'] = this.parentCategoryId;
    return data;
  }
}
