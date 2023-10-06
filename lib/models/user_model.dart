class UserModel {
  List<Results>? results;

  UserModel({this.results});

  UserModel.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      results = <Results>[];
      json['results'].forEach((v) {
        results!.add(Results.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (results != null) {
      data['results'] = results!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Results {
  String? objectId;
  String? name;
  int? age;
  String? emial; 
  int? cpf;
  String? profilephoto; // Add this property for the image path
  int? phone;
  String? createdAt;
  String? updatedAt;

  Results({
    this.objectId,
    this.name,
    this.age,
    this.emial, 
    this.cpf,
    this.profilephoto, // Add this property for the image path
    this.phone,
    this.createdAt,
    this.updatedAt,
  });

  Results.fromJson(Map<String, dynamic> json) {
    objectId = json['objectId'];
    name = json['name'];
    age = json['age'];
    emial = json['emial']; // Typo here, should be 'email'
    cpf = json['cpf'];
    profilephoto = json['profilephoto']; // Add this property for the image path
    phone = json['phone'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['objectId'] = objectId;
    data['name'] = name;
    data['age'] = age;
    data['email'] = emial; // Typo here, should be 'email'
    data['cpf'] = cpf;
    data['profilephoto'] = profilephoto; // Add this property for the image path
    data['phone'] = phone;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}
