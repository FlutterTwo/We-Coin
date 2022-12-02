class ViewProfileModel {
  String? status;
  int? statusCode;
  String? message;
  Data? data;
  String? error;

  ViewProfileModel(
      {this.status, this.statusCode, this.message, this.data, this.error});

  ViewProfileModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    statusCode = json['statusCode'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    error = json['error'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['statusCode'] = this.statusCode;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['error'] = this.error;
    return data;
  }
}

class Data {
  int? id;
  int? roleId;
  String? type;
  String? fullName;
  String? firstName;
  String? lastName;
  String? phone;
  String? google2faSecret;
  String? email;
  String? country;
  String? city;
  String? state;
  String? address;
  String? phrase;
  int? addressVerified;
  int? identityVerified;
  String? status;
  String? passwordResetCode;
  String? rememberToken;
  Null? picture;
  String? createdAt;
  String? updatedAt;
  List<int>? userDetails;

  Data(
      {this.id,
      this.roleId,
      this.type,
      this.fullName,
      this.firstName,
      this.lastName,
      this.phone,
      this.google2faSecret,
      this.email,
      this.country,
      this.city,
      this.state,
      this.address,
      this.phrase,
      this.addressVerified,
      this.identityVerified,
      this.status,
      this.passwordResetCode,
      this.rememberToken,
      this.picture,
      this.createdAt,
      this.updatedAt,
      this.userDetails});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    roleId = json['role_id'];
    type = json['type'];
    fullName = json['full_name'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    phone = json['phone'];
    google2faSecret = json['google2fa_secret'];
    email = json['email'];
    country = json['country'];
    city = json['city'];
    state = json['state'];
    address = json['address'];
    phrase = json['phrase'];
    addressVerified = json['address_verified'];
    identityVerified = json['identity_verified'];
    status = json['status'];
    passwordResetCode = json['password_reset_code'];
    rememberToken = json['remember_token'];
    picture = json['picture'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    userDetails = json['user_details'].cast<int>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['role_id'] = this.roleId;
    data['type'] = this.type;
    data['full_name'] = this.fullName;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['phone'] = this.phone;
    data['google2fa_secret'] = this.google2faSecret;
    data['email'] = this.email;
    data['country'] = this.country;
    data['city'] = this.city;
    data['state'] = this.state;
    data['address'] = this.address;
    data['phrase'] = this.phrase;
    data['address_verified'] = this.addressVerified;
    data['identity_verified'] = this.identityVerified;
    data['status'] = this.status;
    data['password_reset_code'] = this.passwordResetCode;
    data['remember_token'] = this.rememberToken;
    data['picture'] = this.picture;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['user_details'] = this.userDetails;
    return data;
  }
}
