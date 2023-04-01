import 'dart:convert';
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smart_builder_web/models/OwnerProfileModel.dart';

import '../models/OwnerSignUpModel.dart';
import 'package:http/http.dart'as http;

class ApiService {
   Uint8List defaultImageBytes=Uint8List(8);
   String ?deFalultImageName;

  Future<List<OwnerSignUpModel>> getUserList ()async{ //create function in list type becoze we get data and set in _product array
    var response = await http.get(Uri.parse('http://localhost:3000/smart-builders/UserSignUp'));
    List<OwnerSignUpModel> userlist=[]; //the scope of the array is Inside the function
    if(response.statusCode==200) {
      debugPrint("Api is Working !");
      var prJson=json.decode(response.body);
      final jsonArrayData = prJson['data']; //Mistake Identify Here

      for(var jsonData in jsonArrayData){
        userlist.add(OwnerSignUpModel.fromJson(jsonData));//set json data in productlist
      }}
    else{ debugPrint("Api is not Working !");}
    return userlist;
  }



  Future<String> PostApiUserSignUp(String firstName,String lastName,String email,String password,String country) async {
    final response = await http.post(
      Uri.parse('http://localhost:3000/smart-builders/UserSignUp'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        "firstName": firstName.toString(),
        "lastName": lastName.toString(),
        "email": email.toString(),
        "password": password.toString(),
        "country": country.toString(),
      }),
    );

    if (response.statusCode ==200) {
      debugPrint("APi is Working");
      return '200';
    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      throw Exception('Failed to USer Sign-Up. Api');
    }
  }

  Future<String> createOwnerProfile( String firstName,String lastName,String currentUserEmail,String occupation,String country,String city,String zipPostalCode,
      String streetAddress,String phoneNo,String cnincNo,String ntnNo,PlatformFile coverFile,PlatformFile cnicFile,String timeNow) async {
    var request = http.MultipartRequest(
      'POST',
      Uri.parse('http://localhost:3000/smart-builders/createOwnerProfile'),
    );

    // Add image file to request
  //  print("Api cover file name : "+coverFile.name);
  //  debugPrint("Api cover bytes : "+coverFile.bytes.toString());
    var coverImageFileName=coverFile!.name;
    var coverImageBytes = coverFile!.bytes;
    var coverImage = http.MultipartFile.fromBytes(
      'uploadPhoto',
      coverImageBytes!,
      filename: coverImageFileName,
    );
    request.files.add(coverImage);

    print("Api cover cnic name : "+cnicFile.name);
    var cnicImageFileName=cnicFile!.name;
    var cnicImageBytes = cnicFile!.bytes;
    var cnicImage = http.MultipartFile.fromBytes(
      'uploadCnicPhoto',
      cnicImageBytes!,
      filename: cnicImageFileName,
    );
    request.files.add(cnicImage);

    // Add other form data (if any)
    request.fields['firstName'] = firstName;
    request.fields['lastName'] = lastName;
    request.fields['email'] = currentUserEmail;
    request.fields['occupation'] = occupation;
    request.fields['country']=country;
    request.fields['city']=city;
    request.fields['zipPostalCode']=zipPostalCode;
    request.fields['streetAddress']=streetAddress;
    request.fields['phoneNo']=phoneNo;
    request.fields['cnicNo']=cnincNo;
    request.fields['ntnNo']=ntnNo;
    request.fields['timeNow']=timeNow;

    var response = await request.send();
    if (response.statusCode == 200) {
      print('Data inserted Sucessfully !');

      return '200';
    } else {
      print('Error uploading image: ${response.reasonPhrase}');
      return '100';
    }
  }
   Future<String> createOwnerProfileDefaultImage( String firstName,String lastName,String currentUserEmail,String occupation,String country,String city,String zipPostalCode,
       String streetAddress,String phoneNo,String cnincNo,String ntnNo,final ByteData data,PlatformFile cnicFile,String timeNow) async {
     var request = http.MultipartRequest(
       'POST',
       Uri.parse('http://localhost:3000/smart-builders/createOwnerProfile'),
     );
   //  final ByteData data = await rootBundle.load('Logo/Avatar.png');
     defaultImageBytes = data.buffer.asUint8List();
     deFalultImageName = 'avatar.png';
  //   print('Default Image name : $deFalultImageName');
   //  print('Default Image bytes: $defaultImageBytes');

     // Add image file to request

     var coverImage = http.MultipartFile.fromBytes(
       'uploadPhoto',
       defaultImageBytes !,
       filename: deFalultImageName,
     );
     request.files.add(coverImage);

     print("Api cover cnic name : "+cnicFile.name);
     var cnicImageFileName=cnicFile!.name;
     var cnicImageBytes = cnicFile!.bytes;
     var cnicImage = http.MultipartFile.fromBytes(
       'uploadCnicPhoto',
       cnicImageBytes!,
       filename: cnicImageFileName,
     );
     request.files.add(cnicImage);

     // Add other form data (if any)
     request.fields['firstName'] = firstName;
     request.fields['lastName'] = lastName;
     request.fields['email'] = currentUserEmail;
     request.fields['occupation'] = occupation;
     request.fields['country']=country;
     request.fields['city']=city;
     request.fields['zipPostalCode']=zipPostalCode;
     request.fields['streetAddress']=streetAddress;
     request.fields['phoneNo']=phoneNo;
     request.fields['cnicNo']=cnincNo;
     request.fields['ntnNo']=ntnNo;
     request.fields['timeNow']=timeNow;

     var response = await request.send();
     if (response.statusCode == 200) {
       print('Data inserted Sucessfully !');

       return '200';
     } else {
       print('Error uploading image: ${response.reasonPhrase}');
       return '100';
     }
   }
   Future<List<OwnerProfileModel>> getOwnerProfile ()async{ //create function in list type becoze we get data and set in _product array
     var response = await http.get(Uri.parse('http://localhost:3000/smart-builders/getOwnerProfile'));
     List<OwnerProfileModel> getOwnerProfileDataList=[]; //the scope of the array is Inside the function
     if(response.statusCode==200) {
       debugPrint("Api is Working !");
       var prJson=json.decode(response.body);
       final jsonArrayData = prJson['data']; //Mistake Identify Here

       for(var jsonData in jsonArrayData){
         getOwnerProfileDataList.add(OwnerProfileModel.fromJson(jsonData));//set json data in productlist
       }}
     else{ debugPrint("Api is not Working !");}
     return getOwnerProfileDataList;
   }



}