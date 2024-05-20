class QuizPojio {
  int? id;
  String? questionText;
  String? points;
  int? isActive;
  int? category;
  int? subCategory;
  String? evaluationType;
  String? shortTextAnswer;
  String? longTextAnswer;
  String? createdBy;
  String? createdAt;
  String? updatedBy;
  String? updatedAt;
  String? quizCategoryString;
  String? questionTypeString;
  String? quizSubCategoryString;
  String? createdByString;
  String? updatedByString;
  List<Options>? options;

  QuizPojio(
      {this.id,
      this.questionText,
      this.points,
      this.isActive,
      this.category,
      this.subCategory,
      this.evaluationType,
      this.shortTextAnswer,
      this.longTextAnswer,
      this.createdBy,
      this.createdAt,
      this.updatedBy,
      this.updatedAt,
      this.quizCategoryString,
      this.questionTypeString,
      this.quizSubCategoryString,
      this.createdByString,
      this.updatedByString,
      this.options});

  QuizPojio.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    questionText = json['question_text'];
    points = json['points'];
    isActive = json['is_active'];
    category = json['category'];
    subCategory = json['sub_category'];
    evaluationType = json['evaluation_type'];
    shortTextAnswer = json['short_text_answer'];
    longTextAnswer = json['long_text_answer'];
    createdBy = json['created_by'];
    createdAt = json['created_at'];
    updatedBy = json['updated_by'];
    updatedAt = json['updated_at'];
    quizCategoryString = json['quiz_category_string'];
    questionTypeString = json['question_type_string'];
    quizSubCategoryString = json['quiz_sub_category_string'];
    createdByString = json['created_by_string'];
    updatedByString = json['updated_by_string'];
    if (json['options'] != null) {
      options = <Options>[];
      json['options'].forEach((v) {
        options!.add(new Options.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['question_text'] = this.questionText;
    data['points'] = this.points;
    data['is_active'] = this.isActive;
    data['category'] = this.category;
    data['sub_category'] = this.subCategory;
    data['evaluation_type'] = this.evaluationType;
    data['short_text_answer'] = this.shortTextAnswer;
    data['long_text_answer'] = this.longTextAnswer;
    data['created_by'] = this.createdBy;
    data['created_at'] = this.createdAt;
    data['updated_by'] = this.updatedBy;
    data['updated_at'] = this.updatedAt;
    data['quiz_category_string'] = this.quizCategoryString;
    data['question_type_string'] = this.questionTypeString;
    data['quiz_sub_category_string'] = this.quizSubCategoryString;
    data['created_by_string'] = this.createdByString;
    data['updated_by_string'] = this.updatedByString;
    if (this.options != null) {
     for(Map<String,dynamic> i in data['options']){

              options!.add(Options.fromJson(i));
     }
    }
    return data;
  }
}

class Options {
  int? id;
  int? questionId;
  String? optionText;
  int? isCorrectOption;
  String? createdBy;
  String? createdAt;
  String? updatedBy;
  String? updatedAt;

  Options(
      {this.id,
      this.questionId,
      this.optionText,
      this.isCorrectOption,
      this.createdBy,
      this.createdAt,
      this.updatedBy,
      this.updatedAt});

  Options.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    questionId = json['question_id'];
    optionText = json['option_text'];
    isCorrectOption = json['is_correct_option'];
    createdBy = json['created_by'];
    createdAt = json['created_at'];
    updatedBy = json['updated_by'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['question_id'] = this.questionId;
    data['option_text'] = this.optionText;
    data['is_correct_option'] = this.isCorrectOption;
    data['created_by'] = this.createdBy;
    data['created_at'] = this.createdAt;
    data['updated_by'] = this.updatedBy;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}