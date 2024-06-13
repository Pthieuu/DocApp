import 'dart:convert';

import 'package:dio/dio.dart';

import 'package:shared_preferences/shared_preferences.dart';

class DioProvider {

  Future<dynamic> getToken(String email, String password) async {
    // try {
    var dio = Dio();
    dio.options.headers['Content-Type'] = 'application/json';
    var response = await dio.post('http://10.0.2.2:8000/api/login',
        data: {'email': email, 'password': password});
    if (response.statusCode == 200) {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('token', response.data);
      return true;
    } else {
      return false;
    }
    // } catch (error) {
    //   return error;
    // }
  }


  //get user data
  Future<dynamic> getUser(String token) async {
    try {
      var dio = Dio();
      dio.options.headers['content-Type'] = 'application/json';
      var user = await dio.get('http://10.0.2.2:8000/api/user',
          options: Options(headers: {'Authorization': 'Bearer $token'})
      );
      print(user);
      if (user.statusCode == 200 && user.data != '') {
        return user.data;
      }
    } catch (error) {
      return error;
    }
  }

  //đăng kí user mới
  Future<dynamic> registerUser(String username, String email,
      String password) async {
    try {
      var dio = Dio();
      dio.options.headers['content-Type'] = 'application/json';
      var user = await dio.post('http://10.0.2.2:8000/api/register',
          //Nếu như đăng kí thành công thì sẽ trả veef user data
          data: {'name': username, 'email': email, 'password': password});
      print(user.statusCode);
      if (user.statusCode == 200 && user.data != '') {
        return true;
      } else {
        return false;
      }
    } catch (error) {
      return false;
    }
  }

  Future<dynamic> bookAppointment(
      String date, String day, String time, int doctor, String token) async {
    try {
      var dio = Dio();
      dio.options.headers['Authorization'] = 'Bearer $token'; // Add token to header
      dio.options.headers['content-Type'] = 'application/json'; // Specify content type as JSON

      var response = await dio.post('http://10.0.2.2:8000/api/booking',
          data: {
            'date': date,
            'day': day,
            'time': time,
            'doctor_id': doctor
          }
      );


      print(response.data);
      print(response.realUri);
      print(response.statusCode);

      if (response.statusCode == 200 && response.data != '') {
        return response.data; // Return the response data if the booking is successful
      } else {
        return 'Error: ${response.statusCode} - ${response.data}';
      }
    } catch (error) {
      return 'Error: $error';
    }
  }

  // Future<dynamic> getAppointments(String token) async {
  //   try {
  //     var dio = Dio();
  //     dio.options.headers['Authorization'] = 'Bearer $token'; // Thêm token vào header
  //     dio.options.headers['content-Type'] = 'application/json'; // Chỉ định loại nội dung là JSON
  //
  //     var response = await dio.get(
  //       'http://10.0.2.2:8000/api/appointments',
  //     );
  //
  //     print('Raw response: ${response.data}'); // In ra phản hồi thô để kiểm tra
  //
  //     if (response.statusCode == 200 && response.data != '') {
  //       if (response.data is String) {
  //         // Nếu phản hồi là chuỗi, cố gắng chuyển đổi thành JSON
  //         try {
  //           var jsonData = jsonDecode(response.data);
  //           return jsonData;
  //         } catch (e) {
  //           return 'Error parsing JSON: $e';
  //         }
  //       } else {
  //         // Nếu phản hồi đã là JSON hợp lệ
  //         return response.data;
  //       }
  //     } else {
  //       return 'Error: ${response.statusCode} - ${response.data}';
  //     }
  //   } catch (error) {
  //     return 'Error: $error';
  //   }
  // }





  Future<dynamic> getAppointments(String token) async {
  try {
    final Dio _dio = Dio();
  _dio.options.headers['Authorization'] = 'Bearer $token'; // Thêm token vào header
  _dio.options.headers['content-Type'] = 'application/json'; // Chỉ định loại nội dung là JSON

  var response = await _dio.get(
  'http://10.0.2.2:8000/api/appointments',
  );

  print('Raw response: ${response.data}'); // In ra phản hồi thô để kiểm tra

  if (response.statusCode == 200 && response.data != '') {
  if (response.data is List || response.data is Map<String, dynamic>) {
  return response.data;
  } else {
  return 'Unexpected format: ${response.data}';
  }
  } else {
  return 'Error: ${response.statusCode} - ${response.data}';
  }
  } catch (error) {
  return 'Error: $error';
  }
  }

  Future<dynamic> stroreReviews(
      String reviews, double ratings, int id, int doctor, String token) async {
    try {
      var dio = Dio();
      dio.options.headers['Authorization'] = 'Bearer $token'; // Add token to header
      dio.options.headers['content-Type'] = 'application/json'; // Specify content type as JSON

      var response = await dio.post('http://10.0.2.2:8000/api/reviews',
          data: {
            'ratings': ratings,
            'reviews': reviews,
            'appointment_id': id,
            'doctor_id': doctor
          }
      );


      print(response.data);
      print(response.realUri);
      print(response.statusCode);

      if (response.statusCode == 200 && response.data != '') {
        return response.data; // Return the response data if the booking is successful
      } else {
        return 'Error: ${response.statusCode} - ${response.data}';
      }
    } catch (error) {
      return 'Error: $error';
    }
  }
  }





