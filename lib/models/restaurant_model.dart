class RestaurantModel {
  String address;
  String companyActivity;
  String companyName;
  String email;
  bool isActive;
  bool isRestaurant;
  String logoUrl;
  String mobileNumber;
  String userName;
  String restId;

  RestaurantModel({
    this.address,
    this.companyActivity,
    this.companyName,
    this.email,
    this.isActive,
    this.isRestaurant,
    this.logoUrl,
    this.mobileNumber,
    this.userName,
    this.restId,
  });

  RestaurantModel.fromJson(Map<String, dynamic> json) {
    address = json['address'];
    companyActivity = json['companyActivity'];
    companyName = json['companyName'];
    email = json['email'];
    isActive = json['isActive'];
    isRestaurant = json['isRestaurant'];
    logoUrl = json['logoUrl'];
    mobileNumber = json['mobileNumber'];
    userName = json['userName'];
    restId = json['restId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['address'] = this.address;
    data['companyActivity'] = this.companyActivity;
    data['companyName'] = this.companyName;
    data['email'] = this.email;
    data['isActive'] = this.isActive;
    data['isRestaurant'] = this.isRestaurant;
    data['logoUrl'] = this.logoUrl;
    data['mobileNumber'] = this.mobileNumber;
    data['userName'] = this.userName;
    data['restId'] = this.restId;
    return data;
  }
}
