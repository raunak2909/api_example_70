class UserDataModel {
  int? limit;
  int? skip;
  int? total;
  List<UserModel>? users;

  UserDataModel(
      {required this.total,
      required this.limit,
      required this.skip,
      required this.users});

  factory UserDataModel.fromJson(Map<String, dynamic> json){
    List<UserModel> mUsers = [];
    for (Map<String, dynamic> eachUser in json['users']) {
      mUsers.add(UserModel.fromJson(eachUser));
    }

    return UserDataModel(
        total: json['total'],
        limit: json['limit'],
        skip: json['skip'],
        users: mUsers);
  }
}

class UserModel {
  AddressModel? address;
  int? age;
  String? birthDate;
  String? bloodGroup;
  String? domain;
  String? ein;
  String? email;
  String? eyeColor;
  String? firstName;
  String? gender;
  String? image;
  String? ip;
  String? lastName;
  String? macAddress;
  String? maidenName;
  String? password;
  String? phone;
  String? ssn;
  String? university;
  String? userAgent;
  String? username;
  num? weight;
  int? id;
  int? height;
  BankModel? bank;
  CompanyModel? company;
  CryptoModel? crypto;
  HairModel? hair;

  UserModel(
      {required this.address,
      required this.age,
      required this.birthDate,
      required this.bloodGroup,
      required this.domain,
      required this.ein,
      required this.email,
      required this.eyeColor,
      required this.firstName,
      required this.gender,
      required this.image,
      required this.ip,
      required this.lastName,
      required this.macAddress,
      required this.maidenName,
      required this.password,
      required this.phone,
      required this.ssn,
      required this.university,
      required this.userAgent,
      required this.username,
      required this.weight,
      required this.id,
      required this.height,
      required this.bank,
      required this.company,
      required this.crypto,
      required this.hair});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        address: AddressModel.fromJson(json['address']),
        age: json['age'],
        birthDate: json['birthDate'],
        bloodGroup: json['bloodGroup'],
        domain: json['domain'],
        ein: json['ein'],
        email: json['email'],
        eyeColor: json['eyeColor'],
        firstName: json['firstName'],
        gender: json['gender'],
        image: json['image'],
        ip: json['ip'],
        lastName: json['lastName'],
        macAddress: json['macAddress'],
        maidenName: json['maidenName'],
        password: json['password'],
        phone: json['phone'],
        ssn: json['ssn'],
        university: json['university'],
        userAgent: json['userAgent'],
        username: json['username'],
        weight: json['weight'],
        id: json['id'],
        height: json['height'],
        bank: BankModel.fromJson(json['bank']),
        company: CompanyModel.fromJson(json['company']),
        crypto: CryptoModel.fromJson(json['crypto']),
        hair: HairModel.fromJson(json['hair']));
  }
}

class HairModel {
  String? color;
  String? type;

  HairModel({required this.color, required this.type});

  factory HairModel.fromJson(Map<String, dynamic> json) {
    return HairModel(color: json['color'], type: json['type']);
  }
}

class CryptoModel {
  String? coin;
  String? network;
  String? wallet;

  CryptoModel(
      {required this.network, required this.coin, required this.wallet});

  factory CryptoModel.fromJson(Map<String, dynamic> json) {
    return CryptoModel(
        network: json['network'], coin: json['coin'], wallet: json['wallet']);
  }
}

class CompanyModel {
  AddressModel? address;
  String? department;
  String? name;
  String? title;

  CompanyModel(
      {required this.address,
      required this.department,
      required this.name,
      required this.title});

  factory CompanyModel.fromJson(Map<String, dynamic> json) {
    return CompanyModel(
        address: AddressModel.fromJson(json['address']),
        department: json['department'],
        name: json['name'],
        title: json['title']);
  }
}

class BankModel {
  String? cardExpire;
  String? cardNumber;
  String? cardType;
  String? currency;
  String? iban;

  BankModel(
      {required this.cardExpire,
      required this.cardNumber,
      required this.cardType,
      required this.currency,
      required this.iban});

  factory BankModel.fromJson(Map<String, dynamic> json) {
    return BankModel(
        cardExpire: json['cardExpire'],
        cardNumber: json['cardNumber'],
        cardType: json['cardType'],
        currency: json['currency'],
        iban: json['iban']);
  }
}

class AddressModel {
  String? address;
  String? city;
  String? postalCode;
  String? state;
  CoordinatesModel? coordinates;

  AddressModel(
      {required this.state,
      required this.address,
      required this.city,
      required this.coordinates,
      required this.postalCode});

  factory AddressModel.fromJson(Map<String, dynamic> json) {
    return AddressModel(
        state: json['state'],
        address: json['address'],
        city: json['city'],
        coordinates: CoordinatesModel.fromJson(json['coordinates']),
        postalCode: json['postalCode']);
  }
}

class CoordinatesModel {
  double? lat;
  double? lng;

  CoordinatesModel({required this.lat, required this.lng});

  factory CoordinatesModel.fromJson(Map<String, dynamic> json) {
    return CoordinatesModel(lat: json['lat'], lng: json['lng']);
  }
}
