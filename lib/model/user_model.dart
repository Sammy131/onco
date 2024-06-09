class UserModel {
  String? uid;
  String? email;
  String? firstName;
  String? secondName;

  String ageField;

  UserModel(
      {this.uid,
      this.email,
      this.firstName,
      this.secondName,
      required this.ageField});

  // receiving data from server
  factory UserModel.fromMap(map) {
    return UserModel(
        uid: map['uid'],
        email: map['email'],
        firstName: map['firstName'],
        secondName: map['secondName'],
        ageField: map['ageField']);
  }

  // sending data to our server
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'firstName': firstName,
      'secondName': secondName,
      'Age': ageField
    };
  }
}
