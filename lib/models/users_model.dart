import 'dart:io';

enum userType { chef, restaurant,admin }

class AppUser {
  String userId;
  String companyName;
  String userName;
  String email;
  String password;
  String mobileNumber;
  String address;
  File logo;
  String logoUrl;
  String skills;
  String companyActivity;
  userType type;
  bool isActive;
  bool isAdmin;

  AppUser({
    this.companyActivity,
    this.companyName,
    this.email,
    this.logo,
    this.userName,
    this.mobileNumber,
    this.address,
    this.password,
    this.userId,
    this.type,
    this.skills,
    this.isActive = false,
    this.isAdmin,
  });

  factory AppUser.newUser(Map map) {
    bool isRestaurant = map['isRestaurant'] ?? false;
    bool isChef = map['isChef'] ?? false;
    if (isRestaurant) {
      return AppUser.restaurantUser(map);
    } else if (isChef) {
      return AppUser.chefUser(map);
    } else {
      return AppUser.admin(map);
    }
  }

  AppUser.restaurantUser(Map map) {
    this.userId = map['userId'];
    this.companyActivity = map['companyActivity'];
    this.userName = map['userName'];
    this.email = map['email'];
    this.password = map['password'] ?? '';
    this.mobileNumber = map['mobileNumber'];
    this.companyName = map['companyName'];
    this.logoUrl = map['logoUrl'];
    this.address = map['address'];
    this.type = userType.restaurant;
    this.isActive = map['isActive'];
  }

  AppUser.admin(Map map) {
    this.userId = map['userId'];
    this.isAdmin = map['isAdmin'];
    this.email = map['email'];
    this.userName = map['userName'];
    this.mobileNumber = map['mobileNumber'];
    this.type = userType.admin;
  }

  AppUser.chefUser(Map map) {
    this.userId = map['userId'];
    this.userName = map['userName'];
    this.email = map['email'];
    this.password = map['password'] ?? '';
    this.mobileNumber = map['mobileNumber'];
    this.type = userType.chef;
    this.logoUrl = map['logoUrl'];
    this.isActive = map['isActive'];
    this.skills = map['skills'];
  }

  toJson() {
    return type == userType.chef
        ? {
            'userName': this.userName,
            'email': this.email,
            'password': this.password,
            'mobileNumber': this.mobileNumber,
            'isChef': true,
            'logoUrl': this.logoUrl,
            'isActive': false,
            'skills': this.skills,
          }
        : {
            'userName': this.userName,
            'email': this.email,
            'password': this.password,
            'mobileNumber': this.mobileNumber,
            'companyName': this.companyName,
            'address': this.address,
            'logoUrl': this.logoUrl,
            'companyActivity': this.companyActivity,
            'isRestaurant': true,
            'isActive': false,
          };
  }
}
