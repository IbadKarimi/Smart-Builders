import 'dart:convert';
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smart_builder_web/Presentation%20Layer/Screens/HomePage/MaterialStores/MaterialStoresImages/RetailerCreateProfile.dart';
import 'package:smart_builder_web/models/OwnerProfileModel.dart';
import 'package:smart_builder_web/models/OwnerSubmitProposalsModel.dart';
import 'package:smart_builder_web/models/ProWorkExperience.dart';

import '../models/AdminModel.dart';
import '../models/MaterialStoresModel.dart';
import '../models/OfferModel.dart';
import '../models/OwnerAboutModel.dart';
import '../models/OwnerAcceptedProposalModel.dart';
import '../models/OwnerSignUpModel.dart';
import 'package:http/http.dart' as http;

import '../models/ProEducationHistory.dart';
import '../models/ProfessionalsProfileModel.dart';
import '../models/ProfessionalsSkillsModels.dart';
import '../models/ProjectPortfolioModel.dart';
import '../models/RetailerProfileModel.dart';

class ApiService {
  Uint8List defaultImageBytes = Uint8List(8);
  String? deFalultImageName;

  Future<List<OwnerSignUpModel>> getUserList() async {
    //create function in list type becoze we get data and set in _product array
    var response = await http
        .get(Uri.parse('https://smartbuilderserver.vercel.app/smart-builders/UserSignUp'));
    List<OwnerSignUpModel> userlist =
        []; //the scope of the array is Inside the function
    if (response.statusCode == 200) {
      debugPrint("Api is Working !");
      var prJson = json.decode(response.body);
      final jsonArrayData = prJson['data']; //Mistake Identify Here

      for (var jsonData in jsonArrayData) {
        userlist.add(
            OwnerSignUpModel.fromJson(jsonData)); //set json data in productlist
      }
    } else {
      debugPrint("Api is not Working !");
    }
    return userlist;
  }

  Future<String> PostApiUserSignUp(String firstName, String lastName,
      String email, String password, String role) async {
    final response = await http.post(
      Uri.parse('https://smartbuilderserver.vercel.app/smart-builders/UserSignUp'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        "firstName": firstName.toString(),
        "lastName": lastName.toString(),
        "email": email.toString(),
        "password": password.toString(),
        "role": role.toString(),
      }),
    );

    if (response.statusCode == 200) {
      debugPrint("APi is Working");
      return '200';
    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      throw Exception('Failed to USer Sign-Up. Api');
    }
  }

  Future<String> updateUser(String id, String password) async {
    final response = await http.put(
      Uri.parse('https://smartbuilderserver.vercel.app/smart-builders/UserSignUp/$id'),
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

  Future<String> createOwnerProfile(
      String firstName,
      String lastName,
      String currentUserEmail,
      String occupation,
      String country,
      String city,
      String zipPostalCode,
      String streetAddress,
      String phoneNo,
      String cnincNo,
      String ntnNo,
      PlatformFile coverFile,
      PlatformFile cnicFile,
      String timeNow) async {
    var request = http.MultipartRequest(
      'POST',
      Uri.parse('https://smartbuilderserver.vercel.app/smart-builders/createOwnerProfile'),
    );

    // Add image file to request
    //  print("Api cover file name : "+coverFile.name);
    //  debugPrint("Api cover bytes : "+coverFile.bytes.toString());
    var coverImageFileName = coverFile!.name;
    var coverImageBytes = coverFile!.bytes;
    var coverImage = http.MultipartFile.fromBytes(
      'uploadPhoto',
      coverImageBytes!,
      filename: coverImageFileName,
    );
    request.files.add(coverImage);

    print("Api cover cnic name : " + cnicFile.name);
    var cnicImageFileName = cnicFile!.name;
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
    request.fields['country'] = country;
    request.fields['city'] = city;
    request.fields['zipPostalCode'] = zipPostalCode;
    request.fields['streetAddress'] = streetAddress;
    request.fields['phoneNo'] = phoneNo;
    request.fields['cnicNo'] = cnincNo;
    request.fields['ntnNo'] = ntnNo;
    request.fields['timeNow'] = timeNow;

    var response = await request.send();
    if (response.statusCode == 200) {
      print('Data inserted Sucessfully !');

      return '200';
    } else {
      print('Error uploading image: ${response.reasonPhrase}');
      return '100';
    }
  }

  Future<String> createOwnerProfileDefaultImage(
      String firstName,
      String lastName,
      String currentUserEmail,
      String occupation,
      String country,
      String city,
      String zipPostalCode,
      String streetAddress,
      String phoneNo,
      String cnincNo,
      String ntnNo,
      final ByteData data,
      PlatformFile cnicFile,
      String timeNow) async {
    var request = http.MultipartRequest(
      'POST',
      Uri.parse('https://smartbuilderserver.vercel.app/smart-builders/createOwnerProfile'),
    );
    //  final ByteData data = await rootBundle.load('Logo/Avatar.png');
    defaultImageBytes = data.buffer.asUint8List();
    deFalultImageName = 'avatar.png';
    //   print('Default Image name : $deFalultImageName');
    //  print('Default Image bytes: $defaultImageBytes');

    // Add image file to request

    var coverImage = http.MultipartFile.fromBytes(
      'uploadPhoto',
      defaultImageBytes!,
      filename: deFalultImageName,
    );
    request.files.add(coverImage);

    print("Api cover cnic name : " + cnicFile.name);
    var cnicImageFileName = cnicFile!.name;
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
    request.fields['country'] = country;
    request.fields['city'] = city;
    request.fields['zipPostalCode'] = zipPostalCode;
    request.fields['streetAddress'] = streetAddress;
    request.fields['phoneNo'] = phoneNo;
    request.fields['cnicNo'] = cnincNo;
    request.fields['ntnNo'] = ntnNo;
    request.fields['timeNow'] = timeNow;

    var response = await request.send();
    if (response.statusCode == 200) {
      print('Data inserted Sucessfully !');

      return '200';
    } else {
      print('Error uploading image: ${response.reasonPhrase}');
      return '100';
    }
  }

  Future<List<OwnerProfileModel>> getOwnerProfile() async {
    //create function in list type becoze we get data and set in _product array
    var response = await http
        .get(Uri.parse('https://smartbuilderserver.vercel.app/smart-builders/getOwnerProfile'));
    List<OwnerProfileModel> getOwnerProfileDataList =
        []; //the scope of the array is Inside the function
    if (response.statusCode == 200) {
      debugPrint("Api is Working !");
      var prJson = json.decode(response.body);
      final jsonArrayData = prJson['data']; //Mistake Identify Here

      for (var jsonData in jsonArrayData) {
        getOwnerProfileDataList.add(OwnerProfileModel.fromJson(
            jsonData)); //set json data in productlist
      }
    } else {
      debugPrint("Api is not Working !");
    }
    return getOwnerProfileDataList;
  }

  Future<String> InsertCoverPhoto(PlatformFile coverFile, String email) async {
    final request = http.MultipartRequest(
      'POST',
      Uri.parse('https://smartbuilderserver.vercel.app/smart-builders/OwnerProfileCoverPhoto'),
    );
    print("Api cover cnic name : " + coverFile.name);
    var coverImageFileName = coverFile!.name;
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

  Future<List<OwnerProfileModel>> getCoverPhotoData() async {
    //create function in list type becoze we get data and set in _product array
    var response = await http.get(
      Uri.parse('https://smartbuilderserver.vercel.app/smart-builders/OwnerProfileCoverPhoto'),
      headers: {'Cache-Control': 'no-cache'},
    );

    List<OwnerProfileModel> getOwnerProfileDataList = [];
    //the scope of the array is Inside the function
    if (response.statusCode == 200) {
      debugPrint("Api is Working !");

      var prJson = json.decode(response.body);
      final jsonArrayData = prJson['data']; //Mistake Identify Here

      for (var jsonData in jsonArrayData) {
        getOwnerProfileDataList.add(OwnerProfileModel.fromJson(
            jsonData)); //set json data in productlist
      }
    } else {
      debugPrint("Api is not Working !");
    }
    return getOwnerProfileDataList;
  }
  //---------------------------Edit Cover Photo Data----------------------//

  //------------------------------------------------------------------------//
  Future<String> UpdateCoverPhotoData(
    String id,
    PlatformFile coverFile,
  ) async {
    var request = http.MultipartRequest(
      'PUT',
      Uri.parse('https://smartbuilderserver.vercel.app/smart-builders/CoverEmail/$id'),
    );

    // Add image file to request
    print("Api cover file name : " + coverFile.name);
    // debugPrint("Api cover bytes : "+coverFile.bytes.toString());
    var coverImageFileName = coverFile!.name;
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

  Future<String> UpdateProfilePhoto(String id, PlatformFile profileFile) async {
    var request = http.MultipartRequest(
      'PUT',
      Uri.parse('https://smartbuilderserver.vercel.app/smart-builders/OwnerProfile/$id'),
    );

    // Add image file to request
    print("Api cover profile name : " + profileFile.name);
    // debugPrint("Api cover bytes : "+coverFile.bytes.toString());
    var profileImageFileName = profileFile!.name;
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

  Future<String> UpdateProProfilePhoto(
      String id, PlatformFile profileFile) async {
    var request = http.MultipartRequest(
      'PUT',
      Uri.parse(
          'https://smartbuilderserver.vercel.app/smart-builders/ProfessionalsProfile/$id'),
    );

    // Add image file to request
    print("Api cover profile name : " + profileFile.name);
    // debugPrint("Api cover bytes : "+coverFile.bytes.toString());
    var profileImageFileName = profileFile!.name;
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

  Future<String> InsertAbout(String email, String about) async {
    final response = await http.post(
      Uri.parse('https://smartbuilderserver.vercel.app/smart-builders/OwnerProfileAbout'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        "email": email.toString(),
        "about": about.toString(),
      }),
    );

    if (response.statusCode == 200) {
      debugPrint("APi is Working");
      return '200';
    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      throw Exception('Failed to Owner About. Api');
    }
  }

  Future<String> OwnerAboutFindByEmail(String email) async {
    //create function in list type becoze we get data and set in _product array
    var response = await http.get(Uri.parse(
        'https://smartbuilderserver.vercel.app/smart-builders/OwnerProfileAbout/$email'));
    //the scope of the array is Inside the function
    if (response.statusCode == 200) {
      debugPrint("Api is Working !");
      var prJson = json.decode(response.body);
      Map mapResponse = json.decode(response.body);
      String ownerAbout = mapResponse['data']['ownerAbout'];
      print(ownerAbout);
      return ownerAbout.toString();
    } else {
      return "";
      debugPrint("Api is not Working !");
    }
  }

  Future<List<OwnerAboutModel>> getAbout() async {
    //create function in list type becoze we get data and set in _product array
    var response = await http.get(
        Uri.parse('https://smartbuilderserver.vercel.app/smart-builders/OwnerProfileAbout'));
    List<OwnerAboutModel> ownerAbout =
        []; //the scope of the array is Inside the function
    if (response.statusCode == 200) {
      debugPrint("Api is Working !");
      var prJson = json.decode(response.body);
      final jsonArrayData = prJson['data']; //Mistake Identify Here

      for (var jsonData in jsonArrayData) {
        ownerAbout.add(
            OwnerAboutModel.fromJson(jsonData)); //set json data in productlist
      }
    } else {
      debugPrint("Api is not Working of About !");
    }
    return ownerAbout;
  }

  Future<String> InsertOwnerSubmitProposals(
      String selectedContractorCity,
      String firstName,
      String lastName,
      String ownerCity,
      String country,
      String profilePhoto,
      String email,
      String to,
      String projectTitle,
      String projectType,
      String workMonths,
      String projectBudget,
      String plotFrontSideWidth,
      String plotBackSideWidth,
      String plotLeftSideLength,
      String plotRightSideLength,
      String actualPlotSize,
      String floors,
      String groundFloor,
      String city,
      String plotLocation,
      String describeYourProject,
      PlatformFile projectFile,
      String proposalsCreatedTime,
      String proposalsSavedDate) async {
    if (projectFile != null) {
      final request = http.MultipartRequest(
        'POST',
        Uri.parse("https://smartbuilderserver.vercel.app/smart-builders/OwnerSubmitProposals"),
      );
      print("Api cover cnic name : " + projectFile.name);
      var coverImageFileName = projectFile!.name;
      var coverImageBytes = projectFile!.bytes;
      var coverImage = http.MultipartFile.fromBytes(
        'projectFile',
        coverImageBytes!,
        filename: coverImageFileName,
      );
      request.files.add(coverImage);

      request.fields['email'] = email.toString();
      request.fields['ownerFirstName'] = firstName.toString();
      request.fields['ownerLastName'] = lastName.toString();
      request.fields["ownerCity"] = ownerCity.toString();
      request.fields["ownerCountry"] = country.toString();
      request.fields["ownerProfilePicUrl"] = profilePhoto.toString();
      request.fields['to'] = to.toString();
      request.fields['projectTitle'] = projectTitle.toString();
      request.fields['projectType'] = projectType.toString();
      request.fields['projectBudget'] = projectBudget.toString();
      request.fields['workMonths'] = workMonths.toString();
      request.fields["plotWidthA"] = plotFrontSideWidth.toString();
      request.fields["plotWidthB"] = plotBackSideWidth.toString();
      request.fields["plotLengthA"] = plotLeftSideLength.toString();
      request.fields["plotLengthB"] = plotRightSideLength.toString();
      // a left side b right side
      request.fields["actualPlotSize"] = actualPlotSize.toString();
      request.fields["floors"] = floors.toString();
      request.fields["groundFloor"] = groundFloor.toString();

      request.fields["city"] = city.toString();
      request.fields["describeYourProject"] = describeYourProject.toString();
      request.fields["plotLocation"] = plotLocation.toString();
      request.fields["proposalCreatedTime"] = proposalsCreatedTime.toString();
      request.fields["proposalSavedDate"] = proposalsSavedDate.toString();
      request.fields["selectedContractorCity"] =
          selectedContractorCity.toString();
      var response = await request.send();

      if (response.statusCode == 200) {
        debugPrint("APi is Working");
        return '200';
      } else {
        // If the server did not return a 201 CREATED response,
        // then throw an exception.
        throw Exception("Api is Failed");
      }
    }
    return "100";
  }

  Future<String> InsertOwnerSubmitProposals_(
      String selectedContractorCity,
      String firstName,
      String lastName,
      String ownerCity,
      String country,
      String profilePhoto,
      String email,
      String to,
      String projectTitle,
      String projectType,
      String workMonths,
      String projectBudget,
      String plotFrontSideWidth,
      String plotBackSideWidth,
      String plotLeftSideLength,
      String plotRightSideLength,
      String actualPlotSize,
      String floors,
      String groundFloor,
      String city,
      String plotLocation,
      String describeYourProject,
      String proposalsCreatedTime,
      String proposalsSavedDate) async {
    final response = await http.post(
      Uri.parse('https://smartbuilderserver.vercel.app/smart-builders/OwnerSubmitProposals'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        "email": email.toString(),
        "ownerFirstName": firstName.toString(),
        "ownerLastName": lastName.toString(),
        "ownerCity": ownerCity.toString(),
        "ownerCountry": country.toString(),
        "ownerProfilePicUrl": profilePhoto.toString(),
        "to": to.toString(),
        "projectTitle": projectTitle.toString(),
        "projectType": projectType.toString(),
        "workMonths": workMonths.toString(),
        "projectBudget": projectBudget.toString(),
        "plotWidthA": plotFrontSideWidth.toString(),
        "plotWidthB": plotBackSideWidth.toString(),
        "plotLengthA": plotLeftSideLength.toString(),
        "plotLengthB": plotRightSideLength.toString(),
        "actualPlotSize": actualPlotSize.toString(),
        "floors": floors.toString(),
        "groundFloor": groundFloor.toString(),
        "city": city.toString(),
        "plotLocation": plotLocation.toString(),
        "describeYourProject": describeYourProject.toString(),
        "proposalCreatedTime": proposalsCreatedTime.toString(),
        "proposalSavedDate": proposalsSavedDate.toString(),
        "selectedContractorCity": selectedContractorCity.toString(),
      }),
    );

    if (response.statusCode == 200) {
      debugPrint("APi is Working");
      return '200';
    } else {
// If the server did not return a 201 CREATED response,
// then throw an exception.
      throw Exception('Failed to Owner Submit proposal. Api');
    }
  }

  Future<List<OwnerSubmitProposalsModel>> getOwnerSubmitProposal() async {
    //create function in list type becoze we get data and set in _product array
    var response = await http.get(
        Uri.parse('https://smartbuilderserver.vercel.app/smart-builders/OwnerSubmitProposals'));

    List<OwnerSubmitProposalsModel> getOwnerProposalList =
        []; //the scope of the array is Inside the function

    if (response.statusCode == 200) {
      debugPrint("Api is Working !");
      var prJson = json.decode(response.body);
      final jsonArrayData = prJson['data']; //Mistake Identify Here

      for (var jsonData in jsonArrayData) {
        getOwnerProposalList.add(OwnerSubmitProposalsModel.fromJson(
            jsonData)); //set json data in productlist
      }
    } else {
      debugPrint("Api is not Working !");
    }
    return getOwnerProposalList;
  }

  Future<String> createProfessionalsProfile(
      String title,
      String firstName,
      String lastName,
      String currentUserEmail,
      String companyName,
      String country,
      String city,
      String zipPostalCode,
      String streetAddress,
      String phoneNo,
      String cnincNo,
      String ntnNo,
      String licenseNo,
      String permitNo,
      PlatformFile profileFile,
      PlatformFile cnicFile,
      String timeNow) async {
    var request = http.MultipartRequest(
      'POST',
      Uri.parse('https://smartbuilderserver.vercel.app/smart-builders/ProfessionalsProfile'),
    );

    // Add image file to request
    //  print("Api cover file name : "+coverFile.name);
    //  debugPrint("Api cover bytes : "+coverFile.bytes.toString());
    var profileImageFileName = profileFile!.name;
    var profileImageBytes = profileFile!.bytes;
    var profileImage = http.MultipartFile.fromBytes(
      'uploadPhoto',
      profileImageBytes!,
      filename: profileImageFileName,
    );
    request.files.add(profileImage);

    print("Api cover cnic name : " + cnicFile.name);
    var cnicImageFileName = cnicFile!.name;
    var cnicImageBytes = cnicFile!.bytes;
    var cnicImage = http.MultipartFile.fromBytes(
      'uploadCnicPhoto',
      cnicImageBytes!,
      filename: cnicImageFileName,
    );
    request.files.add(cnicImage);

    // Add other form data (if any)'
    request.fields['title'] = title;
    request.fields['firstName'] = firstName;
    request.fields['lastName'] = lastName;
    request.fields['email'] = currentUserEmail;
    request.fields['companyName'] = companyName;
    request.fields['country'] = country;
    request.fields['city'] = city;
    request.fields['zipPostalCode'] = zipPostalCode;
    request.fields['streetAddress'] = streetAddress;
    request.fields['phoneNo'] = phoneNo;
    request.fields['cnicNo'] = cnincNo;
    request.fields['ntnNo'] = ntnNo;
    request.fields['permitNo'] = permitNo;
    request.fields['licenseNo'] = licenseNo;
    request.fields['timeNow'] = timeNow;

    var response = await request.send();
    if (response.statusCode == 200) {
      print('Data inserted Sucessfully !');

      return '200';
    } else {
      print('Error uploading image: ${response.reasonPhrase}');
      return '100';
    }
  }

  Future<String> createProfessionalsProfileDefaultImage(
      String title,
      String firstName,
      String lastName,
      String currentUserEmail,
      String companyName,
      String country,
      String city,
      String zipPostalCode,
      String streetAddress,
      String phoneNo,
      String cnincNo,
      String ntnNo,
      String licenseNo,
      String permitNo,
      final ByteData data,
      PlatformFile cnicFile,
      String timeNow) async {
    var request = http.MultipartRequest(
      'POST',
      Uri.parse('https://smartbuilderserver.vercel.app/smart-builders/ProfessionalsProfile'),
    );
    //  final ByteData data = await rootBundle.load('Logo/Avatar.png');
    defaultImageBytes = data.buffer.asUint8List();
    deFalultImageName = 'avatar.png';
    //   print('Default Image name : $deFalultImageName');
    //  print('Default Image bytes: $defaultImageBytes');

    // Add image file to request

    var coverImage = http.MultipartFile.fromBytes(
      'uploadPhoto',
      defaultImageBytes!,
      filename: deFalultImageName,
    );
    request.files.add(coverImage);

    print("Api cover cnic name : " + cnicFile.name);
    var cnicImageFileName = cnicFile!.name;
    var cnicImageBytes = cnicFile!.bytes;
    var cnicImage = http.MultipartFile.fromBytes(
      'uploadCnicPhoto',
      cnicImageBytes!,
      filename: cnicImageFileName,
    );
    request.files.add(cnicImage);

    // Add other form data (if any)
    request.fields['title'] = firstName;
    request.fields['firstName'] = firstName;
    request.fields['lastName'] = lastName;
    request.fields['email'] = currentUserEmail;
    request.fields['companyName'] = companyName;
    request.fields['country'] = country;
    request.fields['city'] = city;
    request.fields['zipPostalCode'] = zipPostalCode;
    request.fields['streetAddress'] = streetAddress;
    request.fields['phoneNo'] = phoneNo;
    request.fields['cnicNo'] = cnincNo;
    request.fields['ntnNo'] = ntnNo;
    request.fields['permitNo'] = permitNo;
    request.fields['licenseNo'] = licenseNo;
    request.fields['timeNow'] = timeNow;

    var response = await request.send();
    if (response.statusCode == 200) {
      print('Data inserted Sucessfully !');

      return '200';
    } else {
      print('Error uploading image: ${response.reasonPhrase}');
      return '100';
    }
  }

  Future<List<ProfessionalsProfileModel>> getProProfile() async {
    //create function in list type becoze we get data and set in _product array
    var response = await http.get(
        Uri.parse('https://smartbuilderserver.vercel.app/smart-builders/ProfessionalsProfile'));

    List<ProfessionalsProfileModel> getProProfileDataList =
        []; //the scope of the array is Inside the function

    if (response.statusCode == 200) {
      debugPrint("Api is Working !");
      var prJson = json.decode(response.body);
      final jsonArrayData = prJson['data']; //Mistake Identify Here

      for (var jsonData in jsonArrayData) {
        getProProfileDataList.add(ProfessionalsProfileModel.fromJson(
            jsonData)); //set json data in productlist
      }
    } else {
      debugPrint("Api is not Working !");
    }
    return getProProfileDataList;
  }

  Future<String> InsertProCoverPhoto(
      PlatformFile coverFile, String email) async {
    final request = http.MultipartRequest(
      'POST',
      Uri.parse('https://smartbuilderserver.vercel.app/smart-builders/ProCoverPhoto'),
    );
    print("Api cover cnic name : " + coverFile.name);
    var coverImageFileName = coverFile!.name;
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

  Future<List<ProfessionalsProfileModel>> getProCoverPhotoData() async {
    //create function in list type becoze we get data and set in _product array
    var response = await http.get(
      Uri.parse('https://smartbuilderserver.vercel.app/smart-builders/ProCoverPhoto'),
      headers: {'Cache-Control': 'no-cache'},
    );

    List<ProfessionalsProfileModel> getProProfileDataList = [];
    //the scope of the array is Inside the function
    if (response.statusCode == 200) {
      debugPrint("Api is Working !");

      var prJson = json.decode(response.body);
      final jsonArrayData = prJson['data']; //Mistake Identify Here

      for (var jsonData in jsonArrayData) {
        getProProfileDataList.add(ProfessionalsProfileModel.fromJson(
            jsonData)); //set json data in productlist
      }
    } else {
      debugPrint("Api is not Working !");
    }
    return getProProfileDataList;
  }

  //--------------------------------Work Experience---------------------------//
  Future<List<ProWorkExperienceModel>> getProWorkExperience() async {
    //create function in list type becoze we get data and set in _product array
    var response = await http
        .get(Uri.parse('https://smartbuilderserver.vercel.app/smart-builders/WorkExperinece'));
    List<ProWorkExperienceModel> userlist =
        []; //the scope of the array is Inside the function
    if (response.statusCode == 200) {
      debugPrint("Api is Working !");
      var prJson = json.decode(response.body);
      print(response.body.toString());
      final jsonArrayData = prJson['data']; //Mistake Identify Here

      for (var jsonData in jsonArrayData) {
        userlist.add(ProWorkExperienceModel.fromJson(
            jsonData)); //set json data in productlist
      }
    } else {
      debugPrint("Working Experience api is not working !");
    }
    return userlist;
  }

  Future<String> InsertProWorkExperience(
      String email, String title, String companyName, String experience) async {
    final response = await http.post(
      Uri.parse('https://smartbuilderserver.vercel.app/smart-builders/WorkExperinece'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        "email": email.toString(),
        "title": title.toString(),
        "companyName": companyName.toString(),
        "experience": experience.toString(),
      }),
    );

    if (response.statusCode == 200) {
      debugPrint("APi is Working");
      return '200';
    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      throw Exception('Failed to USer Sign-Up. Api');
    }
  }

  //------------------------Education History-----------------------------------//
  Future<List<ProEducationHistoryModel>> getProEducationHistory() async {
    //create function in list type becoze we get data and set in _product array
    var response = await http.get(
        Uri.parse('https://smartbuilderserver.vercel.app/smart-builders/EducationHistory'));
    List<ProEducationHistoryModel> userlist =
        []; //the scope of the array is Inside the function
    if (response.statusCode == 200) {
      debugPrint("Api is Working !");
      var prJson = json.decode(response.body);

      final jsonArrayData = prJson['data']; //Mistake Identify Here

      for (var jsonData in jsonArrayData) {
        userlist.add(ProEducationHistoryModel.fromJson(
            jsonData)); //set json data in productlist
      }
    } else {
      debugPrint("Education history api is not working !");
    }
    return userlist;
  }

  Future<String> InsertProEducationHistory(String email, String school,
      String qualification, String startYear, String endYear) async {
    final response = await http.post(
      Uri.parse('https://smartbuilderserver.vercel.app/smart-builders/EducationHistory'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        "email": email.toString(),
        "school": school.toString(),
        "qualification": qualification.toString(),
        "startYear": startYear.toString(),
        "endYear": endYear.toString(),
      }),
    );

    if (response.statusCode == 200) {
      debugPrint("APi is Working");
      return '200';
    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      throw Exception('Failed to Insert eudcation history  Api');
    }
  }

  Future<String> InsertProSkills(String email, String skills) async {
    final response = await http.post(
      Uri.parse('https://smartbuilderserver.vercel.app/smart-builders/ProfessionalsSkills'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        "email": email.toString(),
        "skills": skills.toString(),
      }),
    );

    if (response.statusCode == 200) {
      debugPrint("APi is Working");
      return '200';
    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      throw Exception('Failed to Insert eudcation history  Api');
    }
  }

  Future<List<ProSkillsModel>> getProSkills() async {
    //create function in list type becoze we get data and set in _product array
    var response = await http.get(
        Uri.parse('https://smartbuilderserver.vercel.app/smart-builders/ProfessionalsSkills'));
    List<ProSkillsModel> userlist =
        []; //the scope of the array is Inside the function
    if (response.statusCode == 200) {
      debugPrint("Api is Working !");
      var prJson = json.decode(response.body);
      //  print(response.body.toString());
      final jsonArrayData = prJson['data']; //Mistake Identify Here

      for (var jsonData in jsonArrayData) {
        userlist.add(
            ProSkillsModel.fromJson(jsonData)); //set json data in productlist
      }
    } else {
      debugPrint("Skills api is not working !");
    }
    return userlist;
  }

  Future<String> InsertAcceptedProposals(
      String senderEmail,
      String accepterEmail,
      String firstName,
      String lastName,
      String ownerCity,
      String country,
      String profilePhoto,
      String proFirstName,
      String proLastName,
      String proCity,
      String proCountry,
      String proProfilePhoto,
      String projectStatus,
      String projectTitle,
      String projectType,
      String workMonths,
      String projectBudget,
      String plotFrontSideWidth,
      String plotBackSideWidth,
      String plotLeftSideLength,
      String plotRightSideLength,
      String actualPlotSize,
      String floors,
      String groundFloor,
      String city,
      String plotLocation,
      String describeYourProject,
      String projectFile,
      String proposalsAcceptedTime,
      String proposalsAcceptedDate) async {
    final response = await http.post(
      Uri.parse('https://smartbuilderserver.vercel.app/smart-builders/AcceptedProposal'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        "senderEmail": senderEmail.toString(),
        "accepterEmail": accepterEmail.toString(),
        "ownerFirstName": firstName.toString(),
        "ownerLastName": lastName.toString(),
        "ownerCity": ownerCity.toString(),
        "ownerCountry": country.toString(),
        "ownerProfilePicUrl": profilePhoto.toString(),
        "proFirstName": proFirstName.toString(),
        "proLastName": proLastName.toString(),
        "proCity": proCity.toString(),
        "proCountry": proCountry.toString(),
        "proProfilePicUrl": proProfilePhoto.toString(),
        "projectStatus": projectStatus.toString(),
        "projectTitle": projectTitle.toString(),
        "projectType": projectType.toString(),
        "workMonths": workMonths.toString(),
        "projectBudget": projectBudget.toString(),
        "plotWidthA": plotFrontSideWidth.toString(),
        "plotWidthB": plotBackSideWidth.toString(),
        "plotLengthA": plotLeftSideLength.toString(),
        "plotLengthB": plotRightSideLength.toString(),
        "actualPlotSize": actualPlotSize.toString(),
        "floors": floors.toString(),
        "groundFloor": groundFloor.toString(),
        "city": city.toString(),
        "plotLocation": plotLocation.toString(),
        "describeYourProject": describeYourProject.toString(),
        "proposalAcceptedTime": proposalsAcceptedTime.toString(),
        "proposalAcceptedDate": proposalsAcceptedDate.toString(),
      }),
    );

    if (response.statusCode == 200) {
      debugPrint("APi is Working");
      return '200';
    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.

      throw Exception("Api accepted proposal is Failed");
    }
    return "100";
  }

  Future<List<ProAcceptedProposalsModel>> getAcceptedProposal() async {
    //create function in list type becoze we get data and set in _product array
    var response = await http.get(
        Uri.parse('https://smartbuilderserver.vercel.app/smart-builders/AcceptedProposal'));

    List<ProAcceptedProposalsModel> getAceptedProposalList =
        []; //the scope of the array is Inside the function

    if (response.statusCode == 200) {
      debugPrint("Api is Working !");
      var prJson = json.decode(response.body);
      final jsonArrayData = prJson['data']; //Mistake Identify Here

      for (var jsonData in jsonArrayData) {
        getAceptedProposalList.add(ProAcceptedProposalsModel.fromJson(
            jsonData)); //set json data in productlist
      }
    } else {
      debugPrint("Api is not Working !");
    }
    return getAceptedProposalList;
  }

  Future<String> updateProposalStatus(
      String id,
      String status,
      String proEmail,
      String proFirstName,
      String proLastName,
      String proCity,
      String proCountry,
      String proProfilePhoto) async {
    final response = await http.put(
      Uri.parse(
          'https://smartbuilderserver.vercel.app/smart-builders/OwnerSubmitProposals/$id'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'status': status,
        'proEmail': proEmail,
        'proFirstName': proFirstName,
        'proLastName': proLastName,
        'proCity': proCity,
        'proCountry': proCountry,
        'proProfilePicUrl': proProfilePhoto,
      }),
    );

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,r
      // then parse the JSON.
      return "200";
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to update proposal.');
    }
  }

  Future<String> UpdateOffer(
      String id,
      String status,
      String proEmail,
      String proFirstName,
      String proLastName,
      String proCity,
      String proCountry,
      String proProfilePhoto,
      String offer,
      String offerStatus,
      String offerSavedDate) async {
    final response = await http.put(
      Uri.parse(
          'https://smartbuilderserver.vercel.app/smart-builders/OwnerSubmitProposals/$id'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'status': status,
        'proEmail': proEmail,
        'proFirstName': proFirstName,
        'proLastName': proLastName,
        'proCity': proCity,
        'proCountry': proCountry,
        'proProfilePicUrl': proProfilePhoto,
        'offer': offer,
        'offerSavedDate': offerSavedDate,
        'offerStatus': offerStatus,
      }),
    );

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,r
      // then parse the JSON.
      return "200";
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to add offer api.');
    }
  }

  Future<String> updateStatus(
    String id,
    String status,
  ) async {
    final response = await http.put(
      Uri.parse(
          'https://smartbuilderserver.vercel.app/smart-builders/OwnerSubmitProposals/$id'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'status': status,
      }),
    );

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,r
      // then parse the JSON.
      return "200";
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to update status.');
    }
  }

  Future<String> SetOffer(
    String id,
    String offerStatus,
  ) async {
    final response = await http.put(
      Uri.parse(
          'https://smartbuilderserver.vercel.app/smart-builders/OwnerSubmitProposals/$id'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'offerStatus': offerStatus,
      }),
    );

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,r
      // then parse the JSON.
      return "200";
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to update status.');
    }
  }

  Future<String> InsertOffer(
      String proposalId,
      String ownerEmail,
      String projectTitle,
      String proEmail,
      String proFirstName,
      String proLastName,
      String proCity,
      String proCountry,
      String proProfilePicUrl,
      String offer,
      String offerStatus,
      String offerCreatedTime,
      String offerSavedDate) async {
    final response = await http.post(
      Uri.parse('https://smartbuilderserver.vercel.app/smart-builders/OfferProposals'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'proposalId': proposalId,
        'projectTitle': projectTitle,
        'proEmail': proEmail,
        'proFirstName': proFirstName,
        'proLastName': proLastName,
        'proCity': proCity,
        'proCountry': proCountry,
        'proProfilePicUrl': proProfilePicUrl,
        'offer': offer,
        'offerCreatedTime': offerCreatedTime,
        'offerSavedDate': offerSavedDate,
        'offerStatus': offerStatus,
        'ownerEmail':ownerEmail,
      }),
    );

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,r
      // then parse the JSON.
      return "200";
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to Insert offer api.');
    }
  }

  Future<List<OfferProposalsModel>> getOfferProposal() async {
    //create function in list type becoze we get data and set in _product array
    var response = await http
        .get(Uri.parse('https://smartbuilderserver.vercel.app/smart-builders/OfferProposals'));

    List<OfferProposalsModel> getOfferProposalList =
        []; //the scope of the array is Inside the function

    if (response.statusCode == 200) {
      debugPrint("Api is Working !");
      var prJson = json.decode(response.body);
      final jsonArrayData = prJson['data']; //Mistake Identify Here

      for (var jsonData in jsonArrayData) {
        getOfferProposalList.add(OfferProposalsModel.fromJson(
            jsonData)); //set json data in productlist
      }
    } else {
      debugPrint("Get Api getOffer is not Working !");
    }
    return getOfferProposalList;
  }

  Future<String> UpdateOfferStatus(String id, String offerStatus,String offerAcceptedTime,String OfferAcceptedDate) async {
    final response = await http.put(Uri.parse('https://smartbuilderserver.vercel.app/smart-builders/OfferProposals/$id'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'offerStatus': offerStatus,
        'offerAcceptedTime':offerAcceptedTime,
        "offerAcceptedDate":OfferAcceptedDate,

      }),
    );

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,r
      // then parse the JSON.
      return "200";
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to add pro Offer Status api.');
    }
  }


  Future<String> createRetailerProfile(
      String email,
      String firstName,
      String lastName,
      String shopName,
      String country,
      String city,
      String phoneNo,
      PlatformFile uploadPhoto,

     ) async {
    var request = http.MultipartRequest(
      'POST',
      Uri.parse('https://smartbuilderserver.vercel.app/smart-builders/RetailerProfile'),
    );

    // Add image file to request
    //  print("Api cover file name : "+coverFile.name);
    //  debugPrint("Api cover bytes : "+coverFile.bytes.toString());
    var uploadPhotoFileName = uploadPhoto!.name;
    var uploadPhotoBytes = uploadPhoto!.bytes;
    var uploadProfilePhoto = http.MultipartFile.fromBytes(
      'profilePhoto',
      uploadPhotoBytes!,
      filename: uploadPhotoFileName,
    );
    request.files.add(uploadProfilePhoto);



    request.fields['email'] = email;
    request.fields['firstName'] = firstName;
    request.fields['lastName'] = lastName;

    request.fields['shopName'] = shopName;
    request.fields['country'] = country;
    request.fields['city'] = city;
    request.fields['phoneNo'] = phoneNo;



    var response = await request.send();
    if (response.statusCode == 200) {
      print('Data inserted Sucessfully !');

      return '200';
    } else {
      print('Error uploading image: ${response.reasonPhrase}');
      return '100';
    }
  }
  Future<String> UpdateRetailerProfilePhoto(
      String id,
      PlatformFile proFilePhoto,
      ) async {
    var request = http.MultipartRequest(
      'PUT',
      Uri.parse('https://smartbuilderserver.vercel.app/smart-builders/RetailerProfile/$id'),
    );


    // debugPrint("Api cover bytes : "+coverFile.bytes.toString());
    var proFilePhotoName = proFilePhoto!.name;
    var proFilePhotoBytes = proFilePhoto!.bytes;
    var _proFilePhoto = http.MultipartFile.fromBytes(
      'profilePhoto',
      proFilePhotoBytes!,
      filename: proFilePhotoName,
    );
    request.files.add(_proFilePhoto);
    var response = await request.send();
    if (response.statusCode == 200) {
      print('Update Data Sucessfully !');

      return '200';
    } else {
      print('Error uploading image: ${response.reasonPhrase}');
      return '100';
    }
  }


  Future<List<RetailerProfileModel>> getRetailerProfile() async {
    //create function in list type becoze we get data and set in _product array
    var response = await http
        .get(Uri.parse('https://smartbuilderserver.vercel.app/smart-builders/RetailerProfile'));

    List<RetailerProfileModel> getRetailerProfileList =
    []; //the scope of the array is Inside the function

    if (response.statusCode == 200) {
      debugPrint("Api is Working !");
      var prJson = json.decode(response.body);
      final jsonArrayData = prJson['data']; //Mistake Identify Here

      for (var jsonData in jsonArrayData) {
        getRetailerProfileList.add(RetailerProfileModel.fromJson(
            jsonData)); //set json data in productlist
      }
    } else {
      debugPrint("Get Api getOffer is not Working !");
    }
    return getRetailerProfileList;
  }
  Future<String> RetailerProfileDefaultImage(
      String email,
      String firstName,
      String lastName,
      String shopName,
      String country,
      String city,
      String phoneNo,
      final ByteData data,
    ) async {
    var request = http.MultipartRequest(
      'POST',
      Uri.parse('https://smartbuilderserver.vercel.app/smart-builders/RetailerProfile'),
    );
    //  final ByteData data = await rootBundle.load('Logo/Avatar.png');
    defaultImageBytes = data.buffer.asUint8List();
    deFalultImageName = 'avatar.png';
    //   print('Default Image name : $deFalultImageName');
    //  print('Default Image bytes: $defaultImageBytes');

    // Add image file to request

    var profileImage = http.MultipartFile.fromBytes(
      'profilePhoto',
      defaultImageBytes!,
      filename: deFalultImageName,
    );
    request.files.add(profileImage);


    // Add other form data (if any)
    request.fields['email'] = email;
    request.fields['firstName'] = firstName;
    request.fields['lastName'] = lastName;

    request.fields['shopName'] = shopName;
    request.fields['country'] = country;
    request.fields['city'] = city;

    var response = await request.send();
    if (response.statusCode == 200) {
      print('Data inserted Sucessfully !');

      return '200';
    } else {
      print('Error uploading image: ${response.reasonPhrase}');
      return '100';
    }
  }

  Future<String> UpdateRetailerCoverPhoto(String id, PlatformFile profileFile) async {
    var request = http.MultipartRequest(
      'PUT',
      Uri.parse('https://smartbuilderserver.vercel.app/smart-builders/RetailerProfileCover/$id'),
    );

    // Add image file to request
    print("Api cover profile name : " + profileFile.name);
    // debugPrint("Api cover bytes : "+coverFile.bytes.toString());
    var profileImageFileName = profileFile!.name;
    var profileImageBytes = profileFile!.bytes;
    var profileImage = http.MultipartFile.fromBytes(
      'coverPhoto',
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

  //============================Material rate=========================//
  Future<List<MaterialRateModel>> getMaterialRate() async {
    //create function in list type becoze we get data and set in _product array
    var response = await http
        .get(Uri.parse('https://smartbuilderserver.vercel.app/smart-builders/MaterialRate'));
    List<MaterialRateModel> userlist =
    []; //the scope of the array is Inside the function
    if (response.statusCode == 200) {
      debugPrint("Api is Working !");
      var prJson = json.decode(response.body);
      final jsonArrayData = prJson['data']; //Mistake Identify Here

      for (var jsonData in jsonArrayData) {
        userlist.add(
            MaterialRateModel.fromJson(jsonData)); //set json data in productlist
      }
    } else {
      debugPrint("Api is not Working !");
    }
    return userlist;
  }

  Future<String> InsertMaterialRate( String email, String materialName, String amount,String unit,String date) async {
    final response = await http.post(
      Uri.parse('https://smartbuilderserver.vercel.app/smart-builders/MaterialRate'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        "email": email.toString(),
        "materialName": materialName.toString(),
        "amount": amount.toString(),
        "unit": unit.toString(),
        "date": date.toString(),
      }),
    );

    if (response.statusCode == 200) {
      debugPrint("APi is Working");
      return '200';
    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      throw Exception('Failed to USer Sign-Up. Api');
    }
  }


  Future<String> updateStoreAddress(String id, String storeAddress,String latitude,String longitude) async {
    final response = await http.put(
      Uri.parse('https://smartbuilderserver.vercel.app/smart-builders/RetailerProfileUpdateStoreAdress/$id'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'latitude': latitude,
        'longitude':longitude,
        'storeAddress':storeAddress,
      }),
    );

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return "200";
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to update store Adress.');
    }
  }



  Future<String> deleteMaterialRates(String id) async {
    var url = Uri.parse('https://smartbuilderserver.vercel.app/smart-builders/MaterialRate/$id'); // Replace with your API endpoint

    var response = await http.delete(url);

    if (response.statusCode == 200) {
      return '200';
      print('Data deleted successfully');
    } else {
      print('Failed to delete data. Error: ${response.statusCode}');
      return '100';
    }
  }



  Future<String> UpdateAdminProfilePhoto(
      String id,
      PlatformFile proFilePhoto,
      ) async {
    var request = http.MultipartRequest(
      'PUT',
      Uri.parse('https://smartbuilderserver.vercel.app/smart-builders/AdminProfile/$id'),
    );


    // debugPrint("Api cover bytes : "+coverFile.bytes.toString());
    var proFilePhotoName = proFilePhoto!.name;
    var proFilePhotoBytes = proFilePhoto!.bytes;
    var _proFilePhoto = http.MultipartFile.fromBytes(
      'profilePhoto',
      proFilePhotoBytes!,
      filename: proFilePhotoName,
    );
    request.files.add(_proFilePhoto);
    var response = await request.send();
    if (response.statusCode == 200) {
      print('Update Data Sucessfully !');

      return '200';
    } else {
      print('Error uploading image: ${response.reasonPhrase}');
      return '100';
    }
  }


  Future<List<AdminProfileModel>> getAdminProfile() async {
    //create function in list type becoze we get data and set in _product array
    var response = await http
        .get(Uri.parse('https://smartbuilderserver.vercel.app/smart-builders/AdminProfile'));

    List<AdminProfileModel> getAdminProfileList =
    []; //the scope of the array is Inside the function

    if (response.statusCode == 200) {
      debugPrint("Api is Working !");
      var prJson = json.decode(response.body);
      final jsonArrayData = prJson['data']; //Mistake Identify Here

      for (var jsonData in jsonArrayData) {
        getAdminProfileList.add(AdminProfileModel.fromJson(
            jsonData)); //set json data in productlist
      }
    } else {
      debugPrint("Get Api  is not Working !");
    }
    return getAdminProfileList;
  }

  Future<String> UpdateAdminCoverPhoto(String id, PlatformFile profileFile) async {
    var request = http.MultipartRequest(
      'PUT',
      Uri.parse('https://smartbuilderserver.vercel.app/smart-builders/AdminProfileCover/$id'),
    );

    // Add image file to request
    print("Api cover profile name : " + profileFile.name);
    // debugPrint("Api cover bytes : "+coverFile.bytes.toString());
    var profileImageFileName = profileFile!.name;
    var profileImageBytes = profileFile!.bytes;
    var profileImage = http.MultipartFile.fromBytes(
      'coverPhoto',
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


  Future<String> InsertProjectPortfolio( String email, String firstName, String lastName,String city,String country,String address,String projectTitle,String construct,  PlatformFile houseFile,PlatformFile ownerPic) async {
    var request = http.MultipartRequest(
      'POST',
      Uri.parse('https://smartbuilderserver.vercel.app/smart-builders/ProjectPortfolio'),
    );

    // Add image file to request
    //  print("Api cover file name : "+coverFile.name);
    //  debugPrint("Api cover bytes : "+coverFile.bytes.toString());
    var coverImageFileName = houseFile!.name;
    var coverImageBytes = houseFile!.bytes;
    var houseFileImage = http.MultipartFile.fromBytes(
      'housePhoto',
      coverImageBytes!,
      filename: coverImageFileName,
    );
    request.files.add(houseFileImage);

    var ownerPicImageFileName = ownerPic!.name;
    var ownerPicImageBytes = ownerPic!.bytes;
    var proFileImage = http.MultipartFile.fromBytes(
      'profilePhoto',
      ownerPicImageBytes!,
      filename: ownerPicImageFileName,
    );
    request.files.add(proFileImage);



    // Add other form data (if any)
    request.fields['firstName'] = firstName;
    request.fields['lastName'] = lastName;
    request.fields['email'] = email;

    request.fields['country'] = country;
    request.fields['city'] = city;
    request.fields['projectTitle'] = projectTitle;
    request.fields['construct'] = city;
    request.fields['address'] =address;



    var response = await request.send();
    if (response.statusCode == 200) {
      debugPrint("APi is Working");
      return '200';
    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      throw Exception('Failed to USer Sign-Up. Api');
    }
  }


  Future<List<ProjectPortfolioModel>> getProjectPortfolio() async {
    //create function in list type becoze we get data and set in _product array
    var response = await http
        .get(Uri.parse('https://smartbuilderserver.vercel.app/smart-builders/ProjectPortfolio'));

    List<ProjectPortfolioModel> getProjectPortfolioModelList =
    []; //the scope of the array is Inside the function

    if (response.statusCode == 200) {
      debugPrint("Api is Working !");
      var prJson = json.decode(response.body);
      final jsonArrayData = prJson['data']; //Mistake Identify Here

      for (var jsonData in jsonArrayData) {
        getProjectPortfolioModelList.add(ProjectPortfolioModel.fromJson(
            jsonData)); //set json data in productlist
      }
    } else {
      debugPrint("Get Api  is not Working !");
    }
    return getProjectPortfolioModelList;
  }



}
