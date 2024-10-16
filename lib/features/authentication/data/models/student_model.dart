import 'package:students_collage/constants.dart';

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
      email: map[kEmail] == null ? null : map[kEmail],
      name: map[kName] == null ? null : map[kName],
      university: map[kUniversity] == null ? null : map[kUniversity],
      phoneNumber: map[kPhoneNumber] == null ? null : map[kPhoneNumber],
      fatherPhoneNumber:
          map[kFatherPhoneNumber] == null ? null : map[kFatherPhoneNumber],
      address: map[kAddress] == null ? null : map[kAddress],
    );
  }

 static  List<String> convertReceivedMapToList({required Map<String,dynamic> data}) {
    List<String> fromMap = [
      data[kName],
      data[kAddress],
      data[kUniversity],
      data[kPhoneNumber],
      data[kFatherPhoneNumber]
    ];
    return fromMap;
  }
}
