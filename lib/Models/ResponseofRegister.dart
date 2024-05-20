class responseofRegister {
  bool? success;
  String? message;
  int? unverifiedUserId;

  responseofRegister({this.success, this.message, this.unverifiedUserId});

  responseofRegister.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    unverifiedUserId = json['unverified_user_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    data['unverified_user_id'] = this.unverifiedUserId;
    return data;
  }
}