class RewardsPojo {
  int? userRewardPointsLogId;
  int? userId;
  String? username;
  String? date;
  int? leaderboardPointId;
  String? activity;
  int? pointsEarned;
  String? comments;
  int? activeStatusId;
  int? createdBy;
  String? createdByString;
  String? createdAt;
  int? updatedBy;
  String? updatedByString;
  String? updatedAt;

  RewardsPojo(
      {this.userRewardPointsLogId,
      this.userId,
      this.username,
      this.date,
      this.leaderboardPointId,
      this.activity,
      this.pointsEarned,
      this.comments,
      this.activeStatusId,
      this.createdBy,
      this.createdByString,
      this.createdAt,
      this.updatedBy,
      this.updatedByString,
      this.updatedAt});

  RewardsPojo.fromJson(Map<String, dynamic> json) {
    userRewardPointsLogId = json['user_reward_points_log_id'];
    userId = json['user_id'];
    username = json['username'];
    date = json['date'];
    leaderboardPointId = json['leaderboard_point_id'];
    activity = json['activity '];
    pointsEarned = json['points_earned'];
    comments = json['comments'];
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
    data['user_reward_points_log_id'] = this.userRewardPointsLogId;
    data['user_id'] = this.userId;
    data['username'] = this.username;
    data['date'] = this.date;
    data['leaderboard_point_id'] = this.leaderboardPointId;
    data['activity '] = this.activity;
    data['points_earned'] = this.pointsEarned;
    data['comments'] = this.comments;
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