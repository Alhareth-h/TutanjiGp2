class RegularUserInfoModel {
  String? id;
  String? uid;
  String? name;
  String? email;
  String? password;
  String?phone;
  RegularUserInfoModel.fromJson(Map<String, dynamic> json, String this.id) {
    print('the dkdkdkdk $json');
    uid = json['uid'];
    name = json['name'];
    email = json['email'];
    phone=json['phone'];
    password=json['password'];
  }
}
