class LeaderBoardPojo {
  List<RankList>? rankList;
  MyRank? myRank;

  LeaderBoardPojo({this.rankList, this.myRank});

  LeaderBoardPojo.fromJson(Map<String, dynamic> json) {
    if (json['rank_list'] != null) {
      rankList = <RankList>[];
      json['rank_list'].forEach((v) {
        rankList!.add(new RankList.fromJson(v));
      });
    }
    myRank =
        json['my_rank'] != null ? new MyRank.fromJson(json['my_rank']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.rankList != null) {
      data['rank_list'] = this.rankList!.map((v) => v.toJson()).toList();
    }
    if (this.myRank != null) {
      data['my_rank'] = this.myRank!.toJson();
    }
    return data;
  }
}

class RankList {
  int? userProfileId;
  int? userId;
  int? currentScore;
  int? currentRank;
  int? currentTierId;
  String? profile_pic;
  String? username;

  RankList(
      {this.userProfileId,
      this.userId,
      this.currentScore,
      this.currentRank,
      this.currentTierId,
      this.profile_pic,
      this.username});

  RankList.fromJson(Map<String, dynamic> json) {
    userProfileId = json['user_profile_id'];
    userId = json['user_id'];
    currentScore = json['current_score'];
    profile_pic = json['profile_pic'];
    currentRank = json['current_rank'];
    currentTierId = json['current_tier_id'];
    username = json['username'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_profile_id'] = this.userProfileId;
    data['user_id'] = this.userId;
    data['current_score'] = this.currentScore;
    data['current_rank'] = this.currentRank;
    data['current_tier_id'] = this.currentTierId;
    data['username'] = this.username;
    data['profile_pic'] = this.profile_pic;
    return data;
  }
}

class MyRank {
  int? userProfileId;
  int? userId;
  int? currentScore;
  int? currentRank;
  int? currentTierId;
  String? profilePic;
  String? username;

  MyRank(
      {this.userProfileId,
      this.userId,
      this.currentScore,
      this.currentRank,
      this.currentTierId,
      this.profilePic,
      this.username});

  MyRank.fromJson(Map<String, dynamic> json) {
    userProfileId = json['user_profile_id'];
    userId = json['user_id'];
    currentScore = json['current_score'];
    currentRank = json['current_rank'];
    currentTierId = json['current_tier_id'];
    profilePic = json['profile_pic'];
    username = json['username'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_profile_id'] = this.userProfileId;
    data['user_id'] = this.userId;
    data['current_score'] = this.currentScore;
    data['current_rank'] = this.currentRank;
    data['current_tier_id'] = this.currentTierId;
    data['profile_pic'] = this.profilePic;
    data['username'] = this.username;
    return data;
  }
}
