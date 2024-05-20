class UserDetailsPojo {
  int? userProfileId;
  int? userId;
  String? username;
  String? fullname;
  String? email;
  int? phone;
  int? currentScore;
  int? currentRank;
  int? currentTierId;
  String? tierName;
  String? profilePic;
  String? country;
  String? gender;
  String? dob;
  String? languagePreference;
  String? subscriptionPlan;
  int? activeStatusId;
  int? createdBy;
  String? createdByString;
  String? createdAt;
  String? updatedBy;
  String? updatedByString;
  String? updatedAt;

  UserDetailsPojo(
      {this.userProfileId,
      this.userId,
      this.username,
      this.fullname,
      this.email,
      this.phone,
      this.currentScore,
      this.currentRank,
      this.currentTierId,
      this.tierName,
      this.profilePic,
      this.country,
      this.gender,
      this.dob,
      this.languagePreference,
      this.subscriptionPlan,
      this.activeStatusId,
      this.createdBy,
      this.createdByString,
      this.createdAt,
      this.updatedBy,
      this.updatedByString,
      this.updatedAt});

  UserDetailsPojo.fromJson(Map<String, dynamic> json) {
    userProfileId = json['user_profile_id'];
    userId = json['user_id'];
    username = json['username'];
    fullname = json['fullname'];
    email = json['email'];
    phone = json['phone'];
    currentScore = json['current_score'];
    currentRank = json['current_rank'];
    currentTierId = json['current_tier_id '];
    tierName = json['tier_name'];
    profilePic = json['profile_pic'];
    country = json['country'];
    gender = json['gender'];
    dob = json['dob'];
    languagePreference = json['language_preference'];
    subscriptionPlan = json['subscription_plan'];
    activeStatusId = json['active_status_id'];
    createdBy = json['created_by'];
    createdByString = json['created_by_string'];
    createdAt = json['created_at'];
    updatedBy = json['updated_by'];
    updatedByString = json['updated_by_string'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_profile_id'] = this.userProfileId;
    data['user_id'] = this.userId;
    data['username'] = this.username;
    data['fullname'] = this.fullname;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['current_score'] = this.currentScore;
    data['current_rank'] = this.currentRank;
    data['current_tier_id '] = this.currentTierId;
    data['tier_name'] = this.tierName;
    data['profile_pic'] = this.profilePic;
    data['country'] = this.country;
    data['gender'] = this.gender;
    data['dob'] = this.dob;
    data['language_preference'] = this.languagePreference;
    data['subscription_plan'] = this.subscriptionPlan;
    data['active_status_id'] = this.activeStatusId;
    data['created_by'] = this.createdBy;
    data['created_by_string'] = this.createdByString;
    data['created_at'] = this.createdAt;
    data['updated_by'] = this.updatedBy;
    data['updated_by_string'] = this.updatedByString;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}