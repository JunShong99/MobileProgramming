class Cart {
  String? cartid;
  String? prname;
  //String? prqty;
  String? price;
  String? cartqty;
  String? prid;
  String? pricetotal;
  // String? cart_status;
  // String? receipt_id;
  // String? cart_date;

  Cart({
    this.cartid,
    this.prname,
    //this.prqty,
    this.price,
    this.cartqty,
    this.prid,
    this.pricetotal,
    // this.cart_status,
    // this.receipt_id,
    // this.cart_date,
  });

  Cart.fromJson(Map<String, dynamic> json) {
    cartid = json['cartid'];
    prname = json['prname'];
    //prqty = json['prqty'];
    price = json['price'];
    cartqty = json['cartqty'];
    prid = json['prid'];
    pricetotal = json['pricetotal'];
    // cart_status = json['cart_status'];
    // receipt_id = json['receipt_id'];
    // cart_date = json['cart_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['cartid'] = cartid;
    data['prname'] = prname;
    //data['prqty'] = prqty;
    data['price'] = price;
    data['cartqty'] = cartqty;
    data['prid'] = prid;
    data['pricetotal'] = pricetotal;
    // data['cart_status'] = cart_status;
    // data['receipt_id'] = receipt_id;
    // data['cart_date'] = cart_date;
    return data;
  }
}
