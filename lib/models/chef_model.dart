class ChefModel {
  String email;
  bool isActive;
  bool isChef;
  String logoUrl;
  String mobileNumber;
  String skills;
  String userName;
  String chefId;

  ChefModel(
      {this.email,
      this.isActive,
      this.isChef,
      this.logoUrl,
      this.mobileNumber,
      this.skills,
      this.userName,
      this.chefId});

  ChefModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    isActive = json['isActive'];
    isChef = json['isChef'];
    logoUrl = json['logoUrl'];
    mobileNumber = json['mobileNumber'];
    skills = json['skills'];
    userName = json['userName'];
    chefId = json['chefId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['isActive'] = this.isActive;
    data['isChef'] = this.isChef;
    data['logoUrl'] = this.logoUrl;
    data['mobileNumber'] = this.mobileNumber;
    data['skills'] = this.skills;
    data['userName'] = this.userName;
    data['chefId'] = this.chefId;
    return data;
  }
}
