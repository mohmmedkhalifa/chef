class Ads {
  bool allowMail;
  bool allowShare;
  String description;
  String imageUrl;
  String title;
  String adId;
  String email;
  String adOwner;

  Ads({
    this.allowMail,
    this.allowShare,
    this.description,
    this.imageUrl,
    this.title,
    this.adOwner,
    this.email,
  });

  Ads.fromJson(Map<String, dynamic> json) {
    allowMail = json['allowMail'];
    allowShare = json['allowShare'];
    description = json['description'];
    imageUrl = json['imageUrl'];
    title = json['title'];
    adOwner = json['adOwner'];
    email = json['email'];
    adId = json['adId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['allowMail'] = this.allowMail;
    data['allowShare'] = this.allowShare;
    data['description'] = this.description;
    data['imageUrl'] = this.imageUrl;
    data['title'] = this.title;
    data['adId'] = this.adId;
    data['adOwner'] = this.adOwner;
    data['email'] = this.email;
    return data;
  }
}
