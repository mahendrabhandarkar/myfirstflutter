class Users{
  String? name;
  String? age;
  String? religion;
  String? country;
  String? status;
  String? profile;
  String? uid;
  String? id;
  Users({this.name, this.age, this.religion, this.country, this.status,this.profile,this.uid, this.id});
  
  Users.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    age= json['age'];
    religion= json['religion'];
    country= json['country'];
    status= json['status'];
    profile= json['profile'];
    uid= json['uid'];
    id=json['id'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['name'] = name;
    data['age'] = age;
    data['religion'] = religion;
    data['country'] = country;
    data['status'] = status;
    data['profile'] = profile;
    data['uid'] = uid;
    return data;
  }
}