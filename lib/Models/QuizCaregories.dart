class QuizData {
  int? id;
  String? categoryName;
  String? createdBy;
  String? createdAt;
  int? updatedBy;
  String? updatedAt;

  QuizData(
      {this.id,
      this.categoryName,
      this.createdBy,
      this.createdAt,
      this.updatedBy,
      this.updatedAt});

  QuizData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryName = json['category_name'];
    createdBy = json['created_by'];
    createdAt = json['created_at'];
    updatedBy = json['updated_by'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['category_name'] = this.categoryName;
    data['created_by'] = this.createdBy;
    data['created_at'] = this.createdAt;
    data['updated_by'] = this.updatedBy;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}


class QuizTitle{
  int? id;
  String? title;
  String? description;


  QuizTitle(
      {
        this.id,
        this.title,
        this.description

      });


}