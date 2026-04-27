import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shop/utils/formatters/formatter.dart';

class UserModel {
  final String id;
  String firstName;
  String lastName;
  final String username;
  final String email;
  final String phoneNumber;
  final String ProfilePicture;

  UserModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.username,
    required this.email,
    required this.phoneNumber,
    required this.ProfilePicture,
  });

  //Helper funtion to get the full name
  String get fullnName => '$firstName $lastName';

  //Helper function to formate phone Number
  String get formattedPhoneNo => FFormatter.formatePhoneNumber(phoneNumber);

  //static function to split full name into firstname and last name
  // ignore: strict_top_level_inference
  static List<String> nameParts(fullName) => fullName.split(' ');

  //fucntion to generate a username form full name
  static String generateUsername(fullname) {
    List<String> nameParts = fullname.split('');
    String firsttName = nameParts[0].toLowerCase();
    String lastName = nameParts.length > 1 ? nameParts[1].toLowerCase() : "";

    String camelCaseUsername = "$firsttName$lastName";
    String usernameWithPrefixes = "cwt_$camelCaseUsername";

    return usernameWithPrefixes;
  }

  //function to create an empty usere model
  static UserModel empty() => UserModel(
    id: '',
    firstName: '',
    lastName: '',
    username: '',
    email: '',
    phoneNumber: '',
    ProfilePicture: '',
  );

  //convert model to json structure for storing data in firebase
  Map<String, dynamic> toJson() {
    return {
      'FirstName': firstName,
      'LastName': lastName,
      'Username': username,
      'Email': email,
      'PhoneNumber': phoneNumber,
      'ProfilePicture': ProfilePicture,
    };
  }

  //factory methor to create a usermodel from a firebase document snapshot
  factory UserModel.fromSnapshot(
    DocumentSnapshot<Map<String, dynamic>> document,
  ) {
    if (document.data() != null) {
      final data = document.data()!;
      return UserModel(
        id: document.id,
        firstName: data['FirstName'] ?? '',
        lastName: data['LastName'] ?? '',
        username: data['UserName'] ?? '',
        email: data['Email'] ?? '',
        phoneNumber: data['PhoneNumber'] ?? '',
        ProfilePicture: data['ProfilePicture'] ?? '',
      );
    } else {
      return UserModel.empty();
    }
  }
}
