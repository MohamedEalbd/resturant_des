class Resturant{
  int _id;
  String _name;
  String _img;
  String _desprection;
  String _price;

  Resturant(this._id,this._img, this._name, this._desprection, this._price);
  Resturant.map(dynamic obj){
    this._id = obj['id'];
    this._name = obj['name'];
    this._img= obj["img"];
    this._desprection = obj['desprection'];
    this._price = obj['price'];
  }
  int get id => _id;
  String get name => _name;
  String get img => _img;
  String get desprection => _desprection;
  String get price => _price;
   Map<String , dynamic > toMap() {
     var map = new Map<String, dynamic>();
     map['name'] = _name;
     map["img"] = _img;
     map['desprection'] = _desprection;
     map['price'] = _price;
     return map;
   }
   Resturant.fromMap(Map< String , dynamic>map){
    var map = new Map<String , dynamic>();
    this._id = map["id"];
    this._name = map["name"];
    this._img = map["img"];
    this._desprection = map["desprection"];
    this._price = map["price"];
   }
}