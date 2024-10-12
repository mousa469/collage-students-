class StudentModel {
  String? email;
  String? name;
  String? university;
  String? phoneNumber;
  String? fatherPhoneNumber;
  String? address;

  StudentModel({
    this.email,
    this.name,
    this.university,
    this.phoneNumber,
    this.fatherPhoneNumber,
    this.address,
  });

  factory StudentModel.info(map) {
    return StudentModel(
      email: map["email"] == null ? null : map["email"],
      name: map["name"] == null ? null : map["name"],
      university: map["university"] == null ? null : map["university"],
      phoneNumber: map["phoneNumber"] == null ? null : map["phoneNumber"],
      fatherPhoneNumber: map["fatherPhoneNumber"] == null ? null : map["fatherPhoneNumber"],
      address: map["address"] == null ? null : map["address"],
    );
  }
}
