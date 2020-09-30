class UserModel {
  int id;
  String username;
  String password;
  String hash;
  String email;
  String type;
  bool isActive;
  bool isDelete;
  String createdDate;
  String createdBy;
  String updatedDate;
  String updatedBy;

  UserModel(
      {this.id,
      this.username,
      this.password,
      this.hash,
      this.email,
      this.type,
      this.isActive,
      this.isDelete,
      this.createdDate,
      this.createdBy,
      this.updatedDate,
      this.updatedBy});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    password = json['password'];
    hash = json['hash'];
    email = json['email'];
    type = json['type'];
    isActive = json['isActive'];
    isDelete = json['isDelete'];
    createdDate = json['createdDate'];
    createdBy = json['createdBy'];
    updatedDate = json['updatedDate'];
    updatedBy = json['updatedBy'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['username'] = this.username;
    data['password'] = this.password;
    data['hash'] = this.hash;
    data['email'] = this.email;
    data['type'] = this.type;
    data['isActive'] = this.isActive;
    data['isDelete'] = this.isDelete;
    data['createdDate'] = this.createdDate;
    data['createdBy'] = this.createdBy;
    data['updatedDate'] = this.updatedDate;
    data['updatedBy'] = this.updatedBy;
    return data;
  }
}
