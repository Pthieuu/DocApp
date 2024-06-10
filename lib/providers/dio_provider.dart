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


  Future<dynamic> bookAppointment(String date, String day, String time,
      int doctor, String token) async {
    try {
      var dio = Dio();
      dio.options.headers['content-Type'] = 'application/json';
      dio.options.headers['Authorization'] = 'Bearer $token'; //Thêm token vào header

      var response = await dio.post('http://10.0.2.2:8000/api/book',
          data: {
            'date': date,
            'day': day,
            'time': time,
            'doctor_id': doctor
          }
      );
      if (response.statusCode == 200 && response.data != 'data') {
        return response.statusCode;
      } else {
        return 'Error';
      }
    } catch (error) {
      return error;
    }
  }


}
