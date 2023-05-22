
class MaterialRateModel {
String? email;
String? materialName;
String? amount;
String? unit;
String? date;
String? sId;
String? storeAddress;
String ?latitude;
String?longitude;

MaterialRateModel({this.email, this.materialName, this.amount, this.unit, this.date, this.sId});

MaterialRateModel.fromJson(Map<String, dynamic> json) {
email = json['email'];
materialName = json['materialName'];
amount = json['amount'];
unit = json['unit'];
date = json['date'];
sId = json['_id'];

storeAddress = json['storeAddress'];
latitude = json['latitude'];
longitude = json['longitude'];
}

Map<String, dynamic> toJson() {
final Map<String, dynamic> data = new Map<String, dynamic>();
data['email'] = this.email;
data['materialName'] = this.materialName;
data['amount'] = this.amount;
data['unit'] = this.unit;
data['date'] = this.date;
data['_id'] = this.sId;

data['storeAddress'] = this.storeAddress;
data['latitude '] = this.latitude ;
data['longitude'] = this.longitude;
return data;
}
}