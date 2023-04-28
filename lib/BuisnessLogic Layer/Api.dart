import 'dart:convert';
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smart_builder_web/models/OwnerProfileModel.dart';

import '../models/OwnerAboutModel.dart';
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



  Future<String> PostApiUserSignUp(String firstName,String lastName,String email,String password,String role) async {
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
        "role":role.toString(),
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
   Future<String> updateUser(String id,String password) async {
     final response = await http.put(
       Uri.parse('http://localhost:3000/smart-builders/UserSignUp/$id'),
       headers: <String, String>{
         'Content-Type': 'application/json; charset=UTF-8',
       },
       body: jsonEncode(<String, String>{
         'password': password,
       }),
     );

     if (response.statusCode == 200) {
       // If the server did return a 200 OK response,
       // then parse the JSON.
       return "200";
     } else {
       // If the server did not return a 200 OK response,
       // then throw an exception.
       throw Exception('Failed to update album.');
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

   Future<String> InsertCoverPhoto(PlatformFile coverFile,String email) async {
     final request = http.MultipartRequest(
       'POST',
       Uri.parse('http://localhost:3000/smart-builders/OwnerProfileCoverPhoto'),
     );
     print("Api cover cnic name : "+coverFile.name);
     var coverImageFileName=coverFile!.name;
     var coverImageBytes = coverFile!.bytes;
     var coverImage = http.MultipartFile.fromBytes(
       'uploadCoverPhoto',
       coverImageBytes!,
       filename: coverImageFileName,
     );
     request.files.add(coverImage);
     request.fields['email'] = email;

     var response = await request.send();

     if (response.statusCode == 200) {
       print('Data inserted Sucessfully !');
       return '200';
     } else {
       print('Error uploading image: ${response.reasonPhrase}');
       return '100';
     }
   }
   Future<List<OwnerProfileModel>> getCoverPhotoData ()async{ //create function in list type becoze we get data and set in _product array
     var response = await http.get(Uri.parse('http://localhost:3000/smart-builders/OwnerProfileCoverPhoto'), headers: {'Cache-Control': 'no-cache'},);

     List<OwnerProfileModel> getOwnerProfileDataList=[];
    //the scope of the array is Inside the function
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
   //---------------------------Edit Cover Photo Data----------------------//

   //------------------------------------------------------------------------//
   Future<String> UpdateCoverPhotoData(String id,PlatformFile coverFile,) async {
     var request = http.MultipartRequest(
       'PUT',
       Uri.parse('http://localhost:3000/smart-builders/CoverEmail/$id'),
     );

     // Add image file to request
     print("Api cover file name : "+coverFile.name);
    // debugPrint("Api cover bytes : "+coverFile.bytes.toString());
     var coverImageFileName=coverFile!.name;
     var coverImageBytes = coverFile!.bytes;
     var coverImage = http.MultipartFile.fromBytes(
       'uploadCoverPhoto',
       coverImageBytes!,
       filename: coverImageFileName,
     );
     request.files.add(coverImage);
     var response = await request.send();
     if (response.statusCode == 200) {
       print('Data inserted Sucessfully !');

       return '200';
     } else {
       print('Error uploading image: ${response.reasonPhrase}');
       return '100';
     }
   }

   Future<String> UpdateProfilePhoto(String id,PlatformFile profileFile) async {
     var request = http.MultipartRequest(
       'PUT',
       Uri.parse('http://localhost:3000/smart-builders/OwnerProfile/$id'),
     );

     // Add image file to request
     print("Api cover profile name : "+profileFile.name);
     // debugPrint("Api cover bytes : "+coverFile.bytes.toString());
     var profileImageFileName=profileFile!.name;
     var profileImageBytes = profileFile!.bytes;
     var profileImage = http.MultipartFile.fromBytes(
       'uploadPhoto',
       profileImageBytes!,
       filename: profileImageFileName,
     );
     request.files.add(profileImage);
     var response = await request.send();
     if (response.statusCode == 200) {
       print('Data inserted Sucessfully !');

       return '200';
     } else {
       print('Error uploading image: ${response.reasonPhrase}');
       return '100';
     }
   }
   Future<String> InsertOwnerAbout(String email,String about) async {
     final response = await http.post(
       Uri.parse('http://localhost:3000/smart-builders/OwnerProfileAbout'),
       headers: <String, String>{
         'Content-Type': 'application/json; charset=UTF-8',
       },
       body: jsonEncode(<String, String>{
         "ownerEmail": email.toString(),
         "ownerAbout": about.toString(),
       }),
     );

     if (response.statusCode ==200) {
       debugPrint("APi is Working");
       return '200';
     } else {
       // If the server did not return a 201 CREATED response,
       // then throw an exception.
       throw Exception('Failed to Owner About. Api');
     }
   }
   Future<String> OwnerAboutFindByEmail (String email)async{ //create function in list type becoze we get data and set in _product array
     var response = await http.get(Uri.parse('http://localhost:3000/smart-builders/OwnerProfileAbout/$email'));
     //the scope of the array is Inside the function
     if(response.statusCode==200) {
       debugPrint("Api is Working !");
       var prJson=json.decode(response.body);
      Map mapResponse = json.decode(
           response.body);
      String ownerAbout=mapResponse['data']['ownerAbout'];
      print(ownerAbout);
       return ownerAbout.toString();
       }
     else{
       return "";
       debugPrint("Api is not Working !");}

   }
   Future<List<OwnerAboutModel>> getOwnerAbout ()async{ //create function in list type becoze we get data and set in _product array
     var response = await http.get(Uri.parse('http://localhost:3000/smart-builders/OwnerProfileAbout'));
     List<OwnerAboutModel> ownerAbout=[]; //the scope of the array is Inside the function
     if(response.statusCode==200) {
       debugPrint("Api is Working !");
       var prJson=json.decode(response.body);
       final jsonArrayData = prJson['data']; //Mistake Identify Here

       for(var jsonData in jsonArrayData){
         ownerAbout.add(OwnerAboutModel.fromJson(jsonData));//set json data in productlist
       }}
     else{ debugPrint("Api is not Working !");}
     return ownerAbout;
   }

   Future<String> InsertOwnerSubmitProposals(String email,String to,String projectTitle,String projectType,String workMonths,String projectBudget,String plotFrontSideWidth,String plotBackSideWidth,String plotLeftSideLength,String plotRightSideLength,
       String actualPlotSize,String floors,String city,String plotLocation,String describeYourProject,
       PlatformFile projectFile,String proposalsCreatedTime,String proposalsSavedDate) async {
    if(projectFile!=null){
     final request = http.MultipartRequest(
       'POST',
       Uri.parse("http://localhost:3000/smart-builders/OwnerSubmitProposals"),
     );
     print("Api cover cnic name : "+projectFile.name);
     var coverImageFileName=projectFile!.name;
     var coverImageBytes = projectFile!.bytes;
     var coverImage = http.MultipartFile.fromBytes(
       'projectFile',
       coverImageBytes!,
       filename: coverImageFileName,
     );
     request.files.add(coverImage);

     request.fields['email']= email.toString();
     request.fields['to']=to.toString();
     request.fields['projectTitle']=projectTitle.toString();
     request.fields['projectType']=projectType.toString();
     request.fields['projectBudget']=projectBudget.toString();
     request.fields['workMonths']=workMonths.toString();
     request.fields["plotWidthA"]=plotFrontSideWidth.toString();
     request.fields["plotWidthB"]=plotBackSideWidth.toString();
     request.fields["plotLengthA"]=plotLeftSideLength.toString();
     request.fields["plotLengthB"]=plotRightSideLength.toString();
     // a left side b right side
     request.fields["actualPlotSize"]=actualPlotSize.toString();
     request.fields["floors"]=floors.toString();

     request.fields["city"]=city.toString();
     request.fields["plotLocation"]=plotLocation.toString();
     request.fields["proposalCreatedTime"]=proposalsCreatedTime.toString();
     request.fields["proposalSavedDate"]=proposalsSavedDate.toString();
     var response = await request.send();


     if (response.statusCode ==200) {
       debugPrint("APi is Working");
       return '200';
     } else {
       // If the server did not return a 201 CREATED response,
       // then throw an exception.
       throw Exception("Api is Failed");
     }

   }else{
      final response = await http.post(
        Uri.parse('http://localhost:3000/smart-builders/OwnerSubmitProposals'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          "email": email.toString(),
          "to": to.toString(),
          "projectTitle":projectTitle.toString(),
          "projectType":projectType.toString(),
          "workMonths":workMonths.toString(),
          "plotWidthA":plotFrontSideWidth.toString(),
          "plotWidthB":plotBackSideWidth.toString(),
          "plotLengthA":plotLeftSideLength.toString(),
          "plotLengthB":plotRightSideLength.toString(),
          "actualPlotSize":actualPlotSize.toString(),
          "floors":floors.toString(),
          "city":city.toString(),
          "plotLocation":plotLocation.toString(),
          "describeYourProject":describeYourProject.toString(),
          "proposalsCreatedTime":proposalsCreatedTime.toString(),
          "proposalSavedDate":proposalsSavedDate.toString(),
        }),
      );

      if (response.statusCode ==200) {
        debugPrint("APi is Working");
        return '200';
      } else {
        // If the server did not return a 201 CREATED response,
        // then throw an exception.
        throw Exception('Failed to Owner About. Api');
      }
    }
    return "100";
  }
   Future<String> InsertOwnerSubmitProposals_(String email,String to,String projectTitle,String projectType,String workMonths,String projectBudget,String plotFrontSideWidth,String plotBackSideWidth,String plotLeftSideLength,String plotRightSideLength,
       String actualPlotSize,String floors,String city,String plotLocation,String describeYourProject,
      String proposalsCreatedTime,String proposalsSavedDate) async {
     final response = await http.post(
       Uri.parse('http://localhost:3000/smart-builders/OwnerSubmitProposals'),
       headers: <String, String>{
         'Content-Type': 'application/json; charset=UTF-8',
       },
       body: jsonEncode(<String, String>{
         "email": email.toString(),
         "to": to.toString(),
         "projectTitle":projectTitle.toString(),
         "projectType":projectType.toString(),
         "workMonths":workMonths.toString(),
         "plotWidthA":plotFrontSideWidth.toString(),
         "plotWidthB":plotBackSideWidth.toString(),
         "plotLengthA":plotLeftSideLength.toString(),
         "plotLengthB":plotRightSideLength.toString(),
         "actualPlotSize":actualPlotSize.toString(),
         "floors":floors.toString(),
         "city":city.toString(),
         "plotLocation":plotLocation.toString(),
         "describeYourProject":describeYourProject.toString(),
         "proposalsCreatedTime":proposalsCreatedTime.toString(),
         "proposalSavedDate":proposalsSavedDate.toString(),
       }),
     );

     if (response.statusCode ==200) {
       debugPrint("APi is Working");
       return '200';
     } else {
// If the server did not return a 201 CREATED response,
// then throw an exception.
       throw Exception('Failed to Owner About. Api');
     }
   }
}


