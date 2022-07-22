// ignore_for_file: unnecessary_this, unnecessary_new, prefer_collection_literals

class User {
  String? userId;
  String? email;
  String? name;
  String? number;
  String? password;
  String? address;
  String? otp;
  String? cart;

  User(
      {this.userId,
      this.email,
      this.name,
      this.number,
      this.password,
      this.address,
      this.otp,
      this.cart});

  User.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    email = json['email'];
    name = json['name'];
    number = json['number'];
    password = json['password'];
    address = json['address'];
    otp = json['otp'];
     cart = json['cart'].toString();
  }

  // set cart(String cart) {}

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['email'] = this.email;
    data['name'] = this.name;
    data['number'] = this.number;
    data['password'] = this.password;
    data['address'] = this.address;
    data['otp'] = this.otp;
    data['cart'] = cart.toString();
    return data;
  }
}
