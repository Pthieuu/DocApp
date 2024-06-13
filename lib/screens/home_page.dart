// import 'dart:convert';
//
// import 'package:abc/components/appointment_card.dart';
// import 'package:abc/components/doctor_card.dart';
// import 'package:abc/providers/dio_provider.dart';
// import 'package:abc/utils/config.dart';
// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// class HomePage extends StatefulWidget {
//   const HomePage({Key? key}) : super(key: key);
//
//   @override
//   State<HomePage> createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//   Map<String, dynamic> user = {};
//   List<Map<String, dynamic>> meCat = [
//     {
//       "icon": FontAwesomeIcons.userDoctor,
//       "category": "General",
//     },
//     {
//       "icon": FontAwesomeIcons.heartPulse,
//       "category": "Cardiology",
//     },
//     {
//       "icon": FontAwesomeIcons.lungs,
//       "category": "Respirations",
//     },
//     {
//       "icon": FontAwesomeIcons.hand,
//       "category": "Dermatology",
//     },
//     {
//       "icon": FontAwesomeIcons.personPregnant,
//       "category": "Gynecology",
//     },
//     {
//       "icon": FontAwesomeIcons.teeth,
//       "category": "Dental",
//     },
//   ];
//
//   Future<void> getData() async {
//     final SharedPreferences prefs = await SharedPreferences.getInstance();
//     final token = prefs.getString('token') ?? '';
//
//     if(token.isNotEmpty && token != ''){
//       final response = await DioProvider().getUser(token);
//         if(response != null){
//           setState(() {
//             user = json.decode(response);
//             print(user);
//           });
//         }
//     }
//   }
//
//   @override
//   void initState() {
//     getData();
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     Config().init(context);
//     return Scaffold(
//       body: Padding(
//         padding: EdgeInsets.symmetric(
//           horizontal: 15,
//           vertical: 15,
//         ),
//         child: SafeArea(
//           child: SingleChildScrollView(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.start,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: <Widget>[
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: const <Widget>[
//                     Text(
//                       'Amanda',
//                       style: TextStyle(
//                         fontSize: 24,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     SizedBox(
//                       child: CircleAvatar(
//                         radius: 30,
//                         backgroundImage: AssetImage('assets/profile1.jpg'),
//                       ),
//                     )
//                   ],
//                 ),
//                 Config.spaceMedium,
//                 // Category listing
//                 const Text(
//                   'Category',
//                   style: TextStyle(
//                     fontSize: 16,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 Config.spaceSmall,
//                 SizedBox(
//                   height: Config.heightSize * 0.05,
//                   child: ListView(
//                     scrollDirection: Axis.horizontal,
//                     children: List<Widget>.generate(meCat.length, (index) {
//                       return Card(
//                         margin: const EdgeInsets.only(right: 20),
//                         color: Config.primaryColor,
//                         child: Padding(
//                           padding: const EdgeInsets.symmetric(
//                             horizontal: 15,
//                             vertical: 10,
//                           ),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceAround,
//                             children: <Widget>[
//                               FaIcon(
//                                 meCat[index]['icon'],
//                                 color: Colors.white,
//                               ),
//                               const SizedBox(width: 20),
//                               Text(
//                                 meCat[index]['category'],
//                                 style: const TextStyle(
//                                   fontSize: 16,
//                                   color: Colors.white,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       );
//                     }),
//                   ),
//                 ),
//                 Config.spaceSmall,
//                 const Text(
//                   'Appointment Today',
//                   style: TextStyle(
//                     fontSize: 16,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 Config.spaceSmall,
//                 // Display appointment card here
//                 AppointmentCard(),
//                 Config.spaceSmall,
//                 const Text(
//                   'Top Doctors',
//                   style: TextStyle(
//                     fontSize: 16,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 Config.spaceSmall,
//                 Column(
//                   children: List.generate(10, (index) {
//                     return const DoctorCard(
//                       route: 'doc_details',
//                     );
//                   }),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// import 'dart:convert';
//
// import 'package:abc/components/appointment_card.dart';
// import 'package:abc/components/doctor_card.dart';
// import 'package:abc/providers/dio_provider.dart';
// import 'package:abc/utils/config.dart';
// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// class HomePage extends StatefulWidget {
//   const HomePage({Key? key}) : super(key: key);
//
//   @override
//   State<HomePage> createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//   Map<String, dynamic> user = {};
//   List<Map<String, dynamic>> meCat = [
//     {
//       "icon": FontAwesomeIcons.userDoctor,
//       "category": "General",
//     },
//     {
//       "icon": FontAwesomeIcons.heartPulse,
//       "category": "Cardiology",
//     },
//     {
//       "icon": FontAwesomeIcons.lungs,
//       "category": "Respirations",
//     },
//     {
//       "icon": FontAwesomeIcons.hand,
//       "category": "Dermatology",
//     },
//     {
//       "icon": FontAwesomeIcons.personPregnant,
//       "category": "Gynecology",
//     },
//     {
//       "icon": FontAwesomeIcons.teeth,
//       "category": "Dental",
//     },
//   ];
//
//   // Future<void> getData() async {
//   //   final SharedPreferences prefs = await SharedPreferences.getInstance();
//   //   final token = prefs.getString('token') ?? '';
//   //
//   //   if (token.isNotEmpty && token != '') {
//   //     final response = await DioProvider().getUser(token);
//   //     if (response != null) {
//   //       setState(() {
//   //         if (response is String) {
//   //           user = json.decode(response);
//   //           print(user);
//   //
//   //
//   //         } else if (response is Map<String, dynamic>) {
//   //           user = response;
//   //         }
//   //       });
//   //     }
//   //   }
//   // }
//     Future<void> getData() async {
//     final SharedPreferences prefs = await SharedPreferences.getInstance();
//     final token = prefs.getString('token') ?? '';
//
//     if (token.isNotEmpty && token != '') {
//       final response = await DioProvider().getUser(token);
//       if (response != null) {
//         setState(() {
//           if (response is String) {
//             user = json.decode(response) as Map<String, dynamic>;
//           } else if (response is Map<String, dynamic>) {
//             user = response;
//           }
//         });
//       }
//     }
//   }
//
//   @override
//   void initState() {
//     getData();
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     Config().init(context);
//     return Scaffold(
//       body: user.isEmpty ?
//           const Center(
//             child: CircularProgressIndicator(),
//           )
//       : Padding(
//         padding: const EdgeInsets.symmetric(
//           horizontal: 15,
//           vertical: 15,
//         ),
//         child: SafeArea(
//           child: SingleChildScrollView(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.start,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: <Widget>[
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children:  <Widget>[
//                     Text(
//                       user['name'] ,
//                       style: const TextStyle(
//                         fontSize: 24,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     const SizedBox(
//                       child: CircleAvatar(
//                         radius: 30,
//                         backgroundImage: AssetImage('assets/profile1.jpg'),
//                       ),
//                     )
//                   ],
//                 ),
//                 Config.spaceMedium,
//                 const Text(
//                   'Category',
//                   style: TextStyle(
//                     fontSize: 16,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 Config.spaceSmall,
//                 SizedBox(
//                   height: Config.heightSize * 0.05,
//                   child: ListView(
//                     scrollDirection: Axis.horizontal,
//                     children: List<Widget>.generate(meCat.length, (index) {
//                       return Card(
//                         margin: const EdgeInsets.only(right: 20),
//                         color: Config.primaryColor,
//                         child: Padding(
//                           padding: const EdgeInsets.symmetric(
//                             horizontal: 15,
//                             vertical: 10,
//                           ),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceAround,
//                             children: <Widget>[
//                               FaIcon(
//                                 meCat[index]['icon'],
//                                 color: Colors.white,
//                               ),
//                               const SizedBox(width: 20),
//                               Text(
//                                 meCat[index]['category'],
//                                 style: const TextStyle(
//                                   fontSize: 16,
//                                   color: Colors.white,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       );
//                     }),
//                   ),
//                 ),
//                 Config.spaceSmall,
//                 const Text(
//                   'Appointment Today',
//                   style: TextStyle(
//                     fontSize: 16,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 Config.spaceSmall,
//                 const AppointmentCard(),
//                 Config.spaceSmall,
//                 const Text(
//                   'Top Doctors',
//                   style: TextStyle(
//                     fontSize: 16,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 Config.spaceSmall,
//                 Column(
//                   children: List.generate(user['doctor'].length, (index) {
//                     return DoctorCard(
//                       route: 'doc_details',
//                       doctor: user['doctor'][index],
//                     );
//                   }),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// import 'dart:convert';
//
// import 'package:abc/components/appointment_card.dart';
// import 'package:abc/components/doctor_card.dart';
// import 'package:abc/providers/dio_provider.dart';
// import 'package:abc/utils/config.dart';
// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// class HomePage extends StatefulWidget {
//   const HomePage({Key? key}) : super(key: key);
//
//   @override
//   State<HomePage> createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//   Map<String, dynamic> user = {};
//   List<Map<String, dynamic>> meCat = [
//     {
//       "icon": FontAwesomeIcons.userDoctor,
//       "category": "General",
//     },
//     {
//       "icon": FontAwesomeIcons.heartPulse,
//       "category": "Cardiology",
//     },
//     {
//       "icon": FontAwesomeIcons.lungs,
//       "category": "Respirations",
//     },
//     {
//       "icon": FontAwesomeIcons.hand,
//       "category": "Dermatology",
//     },
//     {
//       "icon": FontAwesomeIcons.personPregnant,
//       "category": "Gynecology",
//     },
//     {
//       "icon": FontAwesomeIcons.teeth,
//       "category": "Dental",
//     },
//   ];
//
//   Future<void> getData() async {
//     final SharedPreferences prefs = await SharedPreferences.getInstance();
//     final token = prefs.getString('token') ?? '';
//
//     if (token.isNotEmpty && token != '') {
//       final response = await DioProvider().getUser(token);
//       if (response != null) {
//         setState(() {
//           if (response is String) {
//             user = json.decode(response) as Map<String, dynamic>;
//           } else if (response is Map<String, dynamic>) {
//             user = response;
//           }
//         });
//       }
//     }
//   }
//
//   @override
//   void initState() {
//     getData();
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     Config().init(context);
//     return Scaffold(
//       body: user.isEmpty
//           ? const Center(
//         child: CircularProgressIndicator(),
//       )
//           : Padding(
//         padding: const EdgeInsets.symmetric(
//           horizontal: 15,
//           vertical: 15,
//         ),
//         child: SafeArea(
//           child: SingleChildScrollView(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.start,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: <Widget>[
//                 // Row(
//                 //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 //   children: <Widget>[
//                 //     Text(
//                 //       user['name'] ?? '',
//                 //       style: const TextStyle(
//                 //         fontSize: 24,
//                 //         fontWeight: FontWeight.bold,
//                 //       ),
//                 //     ),
//                 //     const SizedBox(
//                 //       child: CircleAvatar(
//                 //         radius: 30,
//                 //         backgroundImage: AssetImage('assets/profile1.jpg'),
//                 //       ),
//                 //     )
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children:  <Widget>[
//                     Text(
//                       user['name'] ?? '',
//                       style: const TextStyle(
//                         fontSize: 24,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     const SizedBox(
//                       child: CircleAvatar(
//                         radius: 30,
//                         backgroundImage: AssetImage('assets/profile1.jpg'),
//                       ),
//                     )
//                   ],
//                 ),
//                 Config.spaceMedium,
//                 const Text(
//                   'Category',
//                   style: TextStyle(
//                     fontSize: 16,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 Config.spaceSmall,
//                 SizedBox(
//                   height: Config.heightSize * 0.05,
//                   child: ListView(
//                     scrollDirection: Axis.horizontal,
//                     children: List<Widget>.generate(meCat.length, (index) {
//                       return Card(
//                         margin: const EdgeInsets.only(right: 20),
//                         color: Config.primaryColor,
//                         child: Padding(
//                           padding: const EdgeInsets.symmetric(
//                             horizontal: 15,
//                             vertical: 10,
//                           ),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceAround,
//                             children: <Widget>[
//                               FaIcon(
//                                 meCat[index]['icon'],
//                                 color: Colors.white,
//                               ),
//                               const SizedBox(width: 20),
//                               Text(
//                                 meCat[index]['category'] ?? 'Danh mục không xác định',
//                                 style: const TextStyle(
//                                   fontSize: 16,
//                                   color: Colors.white,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       );
//                     }),
//                   ),
//                 ),
//                 Config.spaceSmall,
//                 const Text(
//                   'Appointment Today',
//                   style: TextStyle(
//                     fontSize: 16,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 Config.spaceSmall,
//                 const AppointmentCard(),
//                 Config.spaceSmall,
//                 const Text(
//                   'Top Doctors',
//                   style: TextStyle(
//                     fontSize: 16,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 Config.spaceSmall,
//                 Column(
//                   children: List.generate(user['doctor'].length, (index) {
//                     return DoctorCard(
//                       route: 'doc_details',
//                       doctor: user['doctor'][index], // Passing the doctor object
//                     );
//                   }),
//                 ),
//
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// import 'dart:convert';
//
// import 'package:abc/components/appointment_card.dart';
// import 'package:abc/components/doctor_card.dart';
// import 'package:abc/providers/dio_provider.dart';
// import 'package:abc/utils/config.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:intl/intl.dart';
//
// class HomePage extends StatefulWidget {
//   const HomePage({Key? key}) : super(key: key);
//
//   @override
//   State<HomePage> createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//   Map<String, dynamic> user = {};
//   Map<String, dynamic> doctor = {};
//
//   List<Map<String, dynamic>> meCat = [
//     {
//       "icon": FontAwesomeIcons.userDoctor,
//       "category": "General",
//     },
//     {
//       "icon": FontAwesomeIcons.heartPulse,
//       "category": "Cardiology",
//     },
//     {
//       "icon": FontAwesomeIcons.lungs,
//       "category": "Respirations",
//     },
//     {
//       "icon": FontAwesomeIcons.hand,
//       "category": "Dermatology",
//     },
//     {
//       "icon": FontAwesomeIcons.personPregnant,
//       "category": "Gynecology",
//     },
//     {
//       "icon": FontAwesomeIcons.teeth,
//       "category": "Dental",
//     },
//   ];
//
//   // Future<void> getData() async {
//   //   final SharedPreferences prefs = await SharedPreferences.getInstance();
//   //   final token = prefs.getString('token') ?? '';
//   //
//   //   if (token.isNotEmpty) {
//   //     final response = await DioProvider().getUser(token);
//   //     if (response != null) {
//   //       setState(() {
//   //         if (response is String) {
//   //           user = json.decode(response) as Map<String, dynamic>;
//   //         } else if (response is Map<String, dynamic>) {
//   //           user = response;
//   //         }
//   //
//   //
//   //       });
//   //     }
//   //   }
//   // }
//
//   Future<void> getData() async {
//     final SharedPreferences prefs = await SharedPreferences.getInstance();
//     final token = prefs.getString('token') ?? '';
//
//     if (token.isNotEmpty) {
//       final response = await DioProvider().getUser(token);
//       if (response != null) {
//         setState(() {
//           if (response is String) {
//             user = json.decode(response) as Map<String, dynamic>;
//           } else if (response is Map<String, dynamic>) {
//             user = response;
//           }
//
//           // Lặp qua các dữ liệu bác sĩ và kiểm tra các cuộc hẹn
//           for (var doctorData in user['doctor']) {
//             if (doctorData['appointments'] != null) {
//               doctor = doctorData;
//               break; // Nếu tìm thấy một bác sĩ có cuộc hẹn thì thoát vòng lặp
//             }
//           }
//         });
//       }
//     }
//   }
//
//
//
//
//
//   @override
//   void initState() {
//     super.initState();
//     getData();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     Config().init(context);
//     return Scaffold(
//       body: user.isEmpty
//           ? const Center(
//         child: CircularProgressIndicator(),
//       )
//           : Padding(
//         padding: const EdgeInsets.symmetric(
//           horizontal: 15,
//           vertical: 15,
//         ),
//         child: SafeArea(
//           child: SingleChildScrollView(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.start,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: <Widget>[
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: <Widget>[
//                     Text(
//                       user['name'] ?? 'Jennyfer', // Default value
//                       style: const TextStyle(
//                         fontSize: 24,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     const SizedBox(
//                       child: CircleAvatar(
//                         radius: 30,
//                         backgroundImage: AssetImage('assets/profile1.jpg'),
//                       ),
//                     )
//                   ],
//                 ),
//                 Config.spaceMedium,
//                 const Text(
//                   'Category',
//                   style: TextStyle(
//                     fontSize: 16,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 Config.spaceSmall,
//                 SizedBox(
//                   height: Config.heightSize * 0.05,
//                   child: ListView(
//                     scrollDirection: Axis.horizontal,
//                     children: List<Widget>.generate(meCat.length, (index) {
//                       return Card(
//                         margin: const EdgeInsets.only(right: 20),
//                         color: Config.primaryColor,
//                         child: Padding(
//                           padding: const EdgeInsets.symmetric(
//                             horizontal: 15,
//                             vertical: 10,
//                           ),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceAround,
//                             children: <Widget>[
//                               FaIcon(
//                                 meCat[index]['icon'],
//                                 color: Colors.white,
//                               ),
//                               const SizedBox(width: 20),
//                               Text(
//                                 meCat[index]['category'] ?? 'Unknown Category', // Default value
//                                 style: const TextStyle(
//                                   fontSize: 16,
//                                   color: Colors.white,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       );
//                     }),
//                   ),
//                 ),
//                 Config.spaceSmall,
//                 const Text(
//                   'Appointment Today',
//                   style: TextStyle(
//                     fontSize: 16,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 Config.spaceSmall,
//             doctor.isNotEmpty ?   AppointmentCard(
//                  doctor: doctor,
//                  color: Config.primaryColor,
//                )
//                 : Container(
//               width: double.infinity,
//               decoration: BoxDecoration(
//                 color: Colors.grey.shade300,
//                 borderRadius: BorderRadius.circular(10),
//               ),
//               child: const Center(
//                 child: const Padding(
//                     padding: EdgeInsets.all(20),
//                   child: Text('No Appointment Today',
//                   style: TextStyle(
//                     fontSize: 16,
//                     fontWeight: FontWeight.w600,
//                   ),
//                   ),
//                 ),
//               ),
//             ),
//                 Config.spaceSmall,
//                 const Text(
//                   'Top Doctors',
//                   style: TextStyle(
//                     fontSize: 16,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 Config.spaceSmall,
//                 Column(
//                   children: List.generate(user['doctor']?.length ?? 0, (index) {
//                     return DoctorCard(
//                       route: 'doc_details',
//                       doctor: user['doctor'][index], // Ensure doctor is not null
//                     );
//                   }),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'dart:convert';

import 'package:abc/components/appointment_card.dart';
import 'package:abc/components/doctor_card.dart';
import 'package:abc/providers/dio_provider.dart';
import 'package:abc/utils/config.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Map<String, dynamic> user = {};
  Map<String, dynamic> doctor = {};

  List<Map<String, dynamic>> meCat = [
    {
      "icon": FontAwesomeIcons.userDoctor,
      "category": "General",
    },
    {
      "icon": FontAwesomeIcons.heartPulse,
      "category": "Cardiology",
    },
    {
      "icon": FontAwesomeIcons.lungs,
      "category": "Respirations",
    },
    {
      "icon": FontAwesomeIcons.hand,
      "category": "Dermatology",
    },
    {
      "icon": FontAwesomeIcons.personPregnant,
      "category": "Gynecology",
    },
    {
      "icon": FontAwesomeIcons.teeth,
      "category": "Dental",
    },
  ];

  Future<void> getData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token') ?? '';

    if (token.isNotEmpty) {
      final response = await DioProvider().getUser(token);
      if (response != null) {
        setState(() {
          if (response is String) {
            user = json.decode(response) as Map<String, dynamic>;
          } else if (response is Map<String, dynamic>) {
            user = response;
          }

          for(var doctorData in user['doctor']){
            if(doctorData['appointments'] != null){
              doctor = doctorData;
            }
          }
        });
      }
    }
  }





  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return Scaffold(
      body: user.isEmpty
          ? const Center(
        child: CircularProgressIndicator(),
      )
          : Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 15,
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      user['name'] ?? 'Jennyfer', // Default value
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      child: CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage('assets/profile1.jpg'),
                      ),
                    )
                  ],
                ),
                Config.spaceMedium,
                const Text(
                  'Category',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Config.spaceSmall,
                SizedBox(
                  height: Config.heightSize * 0.05,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: List<Widget>.generate(meCat.length, (index) {
                      return Card(
                        margin: const EdgeInsets.only(right: 20),
                        color: Config.primaryColor,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 15,
                            vertical: 10,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              FaIcon(
                                meCat[index]['icon'],
                                color: Colors.white,
                              ),
                              const SizedBox(width: 20),
                              Text(
                                meCat[index]['category'] ?? 'Unknown Category', // Default value
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
                  ),
                ),
                Config.spaceSmall,
                const Text(
                  'Appointment Today',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Config.spaceSmall,
                doctor.isNotEmpty ? AppointmentCard(
                   doctor: doctor,
                   color: Config.primaryColor,
                 )
                : Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Center(
                    child: Padding(padding:
                      EdgeInsets.all(20),
                      child: Text(
                        'No Appointment Today',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                )
                , //pass appointments details into here
                Config.spaceSmall,
                const Text(
                  'Top Doctors',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Config.spaceSmall,
                Column(
                  children: List.generate(user['doctor']?.length ?? 0, (index) {
                    return DoctorCard(
                      route: 'doc_details',
                      doctor: user['doctor'][index], // Ensure doctor is not null
                    );
                  }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
