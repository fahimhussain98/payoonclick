
//
// class ApiServices {
//   Future<LoginModel?> loginwithModel(String userName, String password) async {
//     try {
//       var url = Uri.parse("http://api.payonclick.in/Vr1.0/74536/DJKIJF09320923JSDFOJDFLMSDS/KVLKMS09232309283KJSDJLWLEEJ203/api/UserLogin");
//
//       var response = await http.post(
//         url,
//         // headers: {
//         //   'Content-Type': 'application/json',
//         // },
//         body: jsonEncode({
//           "userName": userName,
//           "password": password,
//           "tokenKey": "1234",
//           "deviceInfo": "1234"
//         }),
//       );
//
//       if (response.statusCode == 200) {
//         print('Response body: ${response.body}');
//         return LoginModel.fromJson(jsonDecode(response.body));
//       } else {
//         print('Failed to login with status code: ${response.statusCode}');
//         print('Response body: ${response.body}');
//         return null;
//       }
//     } catch (e) {
//       print('Error: $e');
//       return null;
//     }
//   }
// }




// class ApiServices {
//   Future<LoginModel?> loginwithModel(String userName, String password) async {
//     var url = Uri.parse("http://api.payonclick.in/Vr1.0/74536/DJKIJF09320923JSDFOJDFLMSDS/KVLKMS09232309283KJSDJLWLEEJ203/api/UserLogin");
//
//     String basicAuth = 'Basic ' + base64Encode(utf8.encode('webtech#\$%^solution\$\$&&@@&^&july2k21:basic%%##@&&auth&#&#&#&@@#&pasWtS2021'));
//
//     try {
//       var response = await http.post(
//         url,
//         headers: {
//           'Authorization': userName,
//           'Content-Type': 'application/json',
//         },
//         body: jsonEncode({
//           "userName": userName,
//           "password": password,
//           "tokenKey": "1234",
//           "deviceInfo": "1234"
//         }),
//       );
//
//       if (response.statusCode == 200) {
//         return LoginModel.fromJson(jsonDecode(response.body));
//       } else {
//         print('Failed to login with status code: ${response.statusCode}');
//         print('Response body: ${response.body}');
//       }
//     } catch (e) {
//       print('Error: $e');
//     }
//     return null;
//   }
// }



import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:payoneclick/Api_Services/Api_models/AePS_WB_Model.dart';
import 'dart:convert';

import 'package:payoneclick/Api_Services/Api_models/Login_Model.dart';
import 'package:payoneclick/Api_Services/Api_models/MainWBModel.dart';
import 'package:payoneclick/Api_Services/Api_models/RechargeModel/DropDrownButtonModel.dart';



// class ApiServices {
//   void processUserID(String userID) {
//    //  this is getting userID from the loginAPI
//     print('yan aaygii apki user IDD userID: $userID',);
//   }
//
//     Future<LoginModel?> loginwithModel(String userName, String password) async {
//       var url = Uri.parse(
//           "http://api.payonclick.in/Vr1.0/74536/DJKIJF09320923JSDFOJDFLMSDS/KVLKMS09232309283KJSDJLWLEEJ203/api/UserLogin");
//
//       String basicAuth = 'webtech#\$%^solution\$\$&&@@&^&july2k21:basic%%##@&&auth&#&#&#&@@#&pasWtS2021';
//       String encodedAuth = 'Basic ' + base64Encode(utf8.encode(basicAuth));
//
//       try {
//         var response = await http.post(
//           url,
//           headers: {
//             'Authorization': encodedAuth,
//             'Content-Type': 'application/json',
//           },
//           body: jsonEncode({
//             "userName": userName,
//             "password": password,
//             "tokenKey": "1234",
//             "deviceInfo": "1234"
//           }),
//         );
//
//         if (response.statusCode == 200) {
//           return LoginModel.fromJson(jsonDecode(response.body));
//         } else {
//           print('Failed to login with status code: ${response.statusCode}');
//           print('Response body: ${response.body}');
//         }
//       } catch (e) {
//         print('Error: $e');
//       }
//       return null;
//     }
//
//
//     //this methode is for the MainWB
//     Future<MainWBModel?> fetchMainWB(String userID) async {//String userID
//       try {
//         var url1 = Uri.parse(
//             "http://api.payonclick.in/Vr1.0/74536/DJKIJF09320923JSDFOJDFLMSDS/KVLKMS09232309283KJSDJLWLEEJ203/api/GetUserBalance");
//         final headers = {
//           'Authorization': 'Basic ${base64Encode(utf8.encode(
//               'webtech#\$%^solution\$\$&&@@&^&july2k21:basic%%##@&&auth&#&#&#&@@#&pasWtS2021'))}',
//           'Content-Type': 'application/json',
//         };
//
//         final body = jsonEncode({
//           'userID': userID  ,            // userID,
//           // "AhCtz8JqpO6QLwx6KZDMvVunsKFHQMXB" ,                 //'AhCtz8JqpO6QLwx6KZDMvVunsKFHQMXB',this is not working plz update the new id //i'm tring
//           'tokenKey': '1234',
//           'deviceInfo': '1234',
//           'action': 'Login',
//           'balUserID': '0',
//         });
//
//         var response = await http.post(
//           url1,
//           headers: headers,
//           body: body,
//         );
//
//         if (response.statusCode == 200) {
//           return MainWBModel.fromJson(jsonDecode(response.body));
//         } else {
//           print('Failed to fetch data from the MainWBModel: ${response
//               .statusCode}');
//           print(
//               'Response body of the MainWBService response: ${response.body}');
//         }
//       } catch (e) {
//         print('Error from the MainWBService fetchMainWB function: $e');
//       }
//       return null;
//     }
//     //this methode for the AePS Wallet
//     Future<AePS_WBModel?> fetchAepsWB(String userID) async {
//       try {
//         var url1 = Uri.parse(
//             "http://api.payonclick.in/Vr1.0/74536/DJKIJF09320923JSDFOJDFLMSDS/KVLKMS09232309283KJSDJLWLEEJ203/api/GetUserAepsBalance");
//         final headers = {
//           'Authorization': 'Basic ${base64Encode(utf8.encode(
//               'webtech#\$%^solution\$\$&&@@&^&july2k21:basic%%##@&&auth&#&#&#&@@#&pasWtS2021'))}',
//           'Content-Type': 'application/json',
//         };
//         final body = jsonEncode({
//           'userID':   userID, //
//           'tokenKey': '1234',
//           'deviceInfo': '1234',
//           'action': 'Login',
//           'balUserID': '0',
//         });
//
//         var response = await http.post(
//           url1,
//           headers: headers,
//           body: body,
//         );
//
//         if (response.statusCode == 200) {
//           return AePS_WBModel.fromJson(jsonDecode(response.body));
//         } else {
//           print('Failed to fetch data from the MainWBModel: ${response
//               .statusCode}');
//           print(
//               'Response body of the MainWBService response: ${response.body}');
//         }
//       } catch (e) {
//         print('Error from the MainWBService fetchMainWB function: $e');
//       }
//       return null;
//     }
//
//   //this methode for the GetOperatorsList  in dropdownModel.
//   Future<DropDrownButtonModel?> getOperatorsList(String userID,String serviceID ,) async {//String userID
//     try {
//       var url = Uri.parse("http://api.payonclick.in/Vr1.0/74536/DJKIJF09320923JSDFOJDFLMSDS/KVLKMS09232309283KJSDJLWLEEJ203/api/GetOperatorsList");
//       final headers = {
//         'Authorization': 'Basic ${base64Encode(utf8.encode('webtech#\$%^solution\$\$&&@@&^&july2k21:basic%%##@&&auth&#&#&#&@@#&pasWtS2021'))}',
//         'Content-Type': 'application/json',
//       };
//       final body = jsonEncode({
//         'userID': userID ,                //"AhCtz8JqpO5dc6L51wwrflunsKFHQMXB"
//         'tokenKey': '1234',
//         'deviceInfo': '1234',
//         'serviceID': serviceID                             //'1',
//       });
//
//       var response = await http.post(url, headers: headers, body: body);
//
//       if (response.statusCode == 200) {
//         return DropDrownButtonModel.fromJson(jsonDecode(response.body));
//       } else {
//         print('Failed to fetch data: ${response.statusCode}');
//         print('Response body: ${response.body}');
//       }
//     } catch (e) {
//       print('Error: $e');
//     }
//     return null;
//   }
//
//
// }


//reduce the code redundancy
class ApiServices {

  final String _baseUrl = "http://api.payonclick.in/Vr1.0/74536/DJKIJF09320923JSDFOJDFLMSDS/KVLKMS09232309283KJSDJLWLEEJ203/api/";
  final String _basicAuth = 'webtech#\$%^solution\$\$&&@@&^&july2k21:basic%%##@&&auth&#&#&#&@@#&pasWtS2021';
  final String _tokenKey = '1234';
  final String _deviceInfo = '1234';

  Future<Map<String, dynamic>?> _postRequest(String endpoint, Map<String, dynamic> body) async {
    var url = Uri.parse(_baseUrl + endpoint);
    String encodedAuth = 'Basic ' + base64Encode(utf8.encode(_basicAuth));
    final headers = {
      'Authorization': encodedAuth,
      'Content-Type': 'application/json',
    };

    try {
      var response = await http.post(
        url,
        headers: headers,
        body: jsonEncode(body),
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        print('Failed to fetch data: ${response.statusCode}');
        print('Response body: ${response.body}');
      }
    } catch (e) {
      print('Error: $e');
    }
    return null;
  }

  Future<LoginModel?> loginwithModel(String userName, String password) async {
    var body = {
      "userName": userName,
      "password": password,
      "tokenKey": _tokenKey,
      "deviceInfo": _deviceInfo
    };

    var jsonResponse = await _postRequest("UserLogin", body);
    if (jsonResponse != null) {
      return LoginModel.fromJson(jsonResponse);
    }
    return null;
  }

  Future<MainWBModel?> fetchMainWB(String userID) async {
    var body = {
      'userID': userID,
      'tokenKey': _tokenKey,
      'deviceInfo': _deviceInfo,
      'action': 'Login',
      'balUserID': '0',
    };

    var jsonResponse = await _postRequest("GetUserBalance", body);
    if (jsonResponse != null) {
      return MainWBModel.fromJson(jsonResponse);
    }
    return null;
  }

  Future<AePS_WBModel?> fetchAepsWB(String userID) async {
    var body = {
      'userID': userID,
      'tokenKey': _tokenKey,
      'deviceInfo': _deviceInfo,
      'action': 'Login',
      'balUserID': '0',
    };

    var jsonResponse = await _postRequest("GetUserAepsBalance", body);
    if (jsonResponse != null) {
      return AePS_WBModel.fromJson(jsonResponse);
    }
    return null;
  }

  Future<DropDrownButtonModel?> getOperatorsList(String userID, String serviceID) async {
    var body = {
      'userID': userID,
      'tokenKey': _tokenKey,
      'deviceInfo': _deviceInfo,
      'serviceID': serviceID,
    };

    var jsonResponse = await _postRequest("GetOperatorsList", body);
    if (jsonResponse != null) {
      return DropDrownButtonModel.fromJson(jsonResponse);
    }
    return null;
  }




}




