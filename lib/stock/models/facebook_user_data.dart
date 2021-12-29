class FacebookUserData {
  String? name;
  String? email;
  Picture? picture;
  String? id;

  FacebookUserData({this.name, this.email, this.picture, this.id});

  FacebookUserData.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    picture =
        json['picture'] != null ? Picture.fromJson(json['picture']) : null;
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['email'] = email;
    if (picture != null) {
      data['picture'] = picture!.toJson();
    }
    data['id'] = id;
    return data;
  }
}

class Picture {
  PictureData? data;

  Picture({this.data});

  Picture.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? PictureData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class PictureData {
  int? height;
  String? url;
  int? width;

  PictureData({this.height, this.url, this.width});

  PictureData.fromJson(Map<String, dynamic> json) {
    height = json['height'];
    url = json['url'];
    width = json['width'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['height'] = height;
    data['url'] = url;
    data['width'] = width;
    return data;
  }
}
