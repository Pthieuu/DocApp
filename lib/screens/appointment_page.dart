// // import 'package:abc/utils/config.dart';
// // import 'package:flutter/material.dart';
// //
// // class AppointmentPage extends StatefulWidget {
// //   const AppointmentPage({Key? key}) : super(key: key);
// //
// //
// //   @override
// //   State<AppointmentPage> createState() => _AppointmentPageState();
// // }
// //
// // enum FilterStatus{upcoming, complete, cancel}
// //
// // class _AppointmentPageState extends State<AppointmentPage> {
// //   FilterStatus status = FilterStatus.upcoming;
// //   Alignment _aligment = Alignment.centerLeft;
// //   List<dynamic> schedules = [
// //     {
// //       "doctor_name":"Pham Trung Hieu",
// //       "doctor_profile":"assets/doctor_2.jpg",
// //       "category":"Dental",
// //       "status": FilterStatus.upcoming,
// //     },
// //     {
// //       "doctor_name":"Canh Nguyen",
// //       "doctor_profile":"assets/doctor_3.jpg",
// //       "category":"Cardiology",
// //       "status": FilterStatus.complete,
// //     },
// //     {
// //       "doctor_name":"Quoc Anh",
// //       "doctor_profile":"assets/doctor_4.jpg",
// //       "category":"Respiration",
// //       "status": FilterStatus.complete,
// //     },
// //     {
// //       "doctor_name":"Jenny Huynh",
// //       "doctor_profile":"assets/doctor_5.jpg",
// //       "category":"General",
// //       "status": FilterStatus.cancel,
// //     }
// //   ];
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     List<dynamic> filteredSchedules = schedules.where((var schedule) {
// //       // switch(schedule['status']){
// //       //   case 'upcoming' :
// //       //     schedule['status'] = FilterStatus.upcoming;
// //       //     break;
// //       //   case 'complete' :
// //       //     schedule['status'] = FilterStatus.complete;
// //       //     break;
// //       //   case 'cancel' :
// //       //     schedule['status'] = FilterStatus.cancel;
// //       //     break;
// //       // }
// //       return schedule['status'] == status;
// //     }).toList();
// //     return SafeArea(
// //         child: Padding(
// //             padding: const EdgeInsets.only(left: 20, top: 20, right: 20),
// //           child: Column(
// //             crossAxisAlignment: CrossAxisAlignment.stretch,
// //             children:  <Widget>[
// //               const Text(
// //                 'Appointment Schedule',
// //                 textAlign: TextAlign.center,
// //                 style: TextStyle(
// //                   fontSize: 18,
// //                   fontWeight: FontWeight.bold
// //                 ),
// //               ),
// //               Config.spaceSmall,
// //               Stack(
// //                 children: [
// //                   Container(
// //                     width: double.infinity,
// //                     height: 40,
// //                     decoration: BoxDecoration(
// //                       color: Colors.white,
// //                       borderRadius: BorderRadius.circular(20),
// //                     ),
// //                     child: Row(
// //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                       children: [
// //                         for(FilterStatus filterstatus in FilterStatus.values)
// //                           Expanded(
// //                             child: GestureDetector(
// //                               onTap: () {
// //                                 setState(() {
// //                                   if(filterstatus == FilterStatus.upcoming){
// //                                     status = FilterStatus.upcoming;
// //                                     _aligment = Alignment.centerLeft;
// //                                   }else if(filterstatus == FilterStatus.complete) {
// //                                     status = FilterStatus.complete;
// //                                     _aligment = Alignment.center;
// //                                   }else if(filterstatus == FilterStatus.cancel) {
// //                                     status = FilterStatus.cancel;
// //                                     _aligment = Alignment.centerRight;
// //                                   }
// //                                 });
// //                               },
// //                               child: Center(child: Text(filterstatus.name),),
// //                             ))
// //
// //                       ],
// //                     ),
// //                   ),
// //                   AnimatedAlign(
// //                       alignment: _aligment,
// //                       duration: const Duration(milliseconds: 200),
// //                     child: Container(
// //                       height: 40,
// //                       width: 100,
// //                       decoration: BoxDecoration(
// //                         color: Config.primaryColor,
// //                         borderRadius: BorderRadius.circular(20)
// //                       ),
// //                       child: Center(
// //                         child: Text(
// //                           status.name,
// //                           style: const TextStyle(
// //                             color: Colors.white,
// //                             fontWeight: FontWeight.bold,
// //                           ),
// //                         ),
// //                       ),
// //                     ),
// //                   )
// //                 ],
// //               ),
// //               Config.spaceSmall,
// //               Expanded(
// //                   child: ListView.builder(
// //                       itemCount: filteredSchedules.length,
// //                       itemBuilder: ((context, index){
// //                         var _schedule = filteredSchedules[index];
// //                         bool isLastElement = filteredSchedules.length + 1 == index;
// //                         return Card(
// //                           shape: RoundedRectangleBorder(
// //                             side: const BorderSide(
// //                                 color: Colors.grey
// //                             ),
// //                             borderRadius: BorderRadius.circular(20)
// //                           ),
// //                           margin:
// //                           !isLastElement ? const EdgeInsets.only(bottom: 20)
// //                               : EdgeInsets.zero,
// //                           child: Padding(
// //                             padding: const EdgeInsets.all(15),
// //                             child: Column(
// //                               crossAxisAlignment: CrossAxisAlignment.stretch,
// //                               children: [
// //                                 Row(
// //                                   children: [
// //                                     CircleAvatar(
// //                                       backgroundImage: AssetImage(_schedule['doctor_profile']),
// //                                     ),
// //                                     const SizedBox(width: 10,),
// //                                     Column(
// //                                       crossAxisAlignment: CrossAxisAlignment.start,
// //                                       children: [
// //                                         Text(
// //                                           _schedule['doctor_name'],
// //                                           style: const TextStyle(
// //                                             color: Colors.black,
// //                                             fontWeight: FontWeight.w700
// //                                           ),
// //                                         ),
// //                                         const SizedBox(height: 5,),
// //                                         Text(
// //                                           _schedule['category'],
// //                                           style: const TextStyle(
// //                                               color: Colors.grey,
// //                                               fontSize: 12,
// //                                               fontWeight: FontWeight.w600
// //                                           ),
// //                                         ),
// //                                       ],
// //                                     )
// //                                   ],
// //                                 ),
// //                                 const SizedBox(height: 15,),
// //                                 const ScheduleCard(),
// //                                 const SizedBox(height: 15,),
// //                                 Row(
// //                                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                                   children: [
// //                                     Expanded(child: OutlinedButton(
// //                                       onPressed: () {},
// //                                       child: const Text(
// //                                         'Cancel',
// //                                         style: TextStyle(color: Config.primaryColor),
// //                                       ),
// //                                     ),
// //                                     ),
// //                                     const SizedBox(width: 20,),
// //                                     Expanded(
// //                                       child: OutlinedButton(
// //                                         style: OutlinedButton.styleFrom(
// //                                           backgroundColor: Config.primaryColor
// //                                         ),
// //                                       onPressed: () {},
// //                                       child: const Text(
// //                                         'Reschedule',
// //                                         style: TextStyle(color: Colors.white),
// //                                       ),
// //                                     ),
// //                                     ),
// //                                   ],
// //                                 )
// //                               ],
// //                             ),
// //                           ),
// //                         );
// //                       }
// //                   ),
// //               ),
// //               ),
// //             ],
// //           ),
// //         ),
// //     );
// //   }
// // }
// //
// // class ScheduleCard extends StatefulWidget {
// //   const ScheduleCard({Key? key}) : super(key: key);
// //
// //   @override
// //   State<ScheduleCard> createState() => _ScheduleCardState();
// // }
// //
// // class _ScheduleCardState extends State<ScheduleCard> {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Container(
// //       decoration: BoxDecoration(
// //           color: Colors.grey.shade200,
// //           borderRadius: BorderRadius.circular(10)
// //       ),
// //       width: double.infinity,
// //       padding: const EdgeInsets.all(20),
// //       child: Row(
// //         crossAxisAlignment: CrossAxisAlignment.center,
// //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //         children: <Widget>[
// //           Icon(
// //             Icons.calendar_today,
// //             color: Config.primaryColor,
// //             size: 15,
// //           ),
// //           SizedBox(width: 5,),
// //           Text(
// //             'Monday, 05/20/2024',
// //             style: const TextStyle(
// //               color: Config.primaryColor,
// //             ),
// //           ),
// //           SizedBox(width: 20,),
// //           Icon(
// //             Icons.access_alarm,
// //             color: Config.primaryColor,
// //             size: 17,
// //           ),
// //           SizedBox(width: 5,),
// //           Flexible(child: Text('2:00 PM', style:
// //           TextStyle(color: Config.primaryColor,
// //           ),))
// //         ],
// //       ),
// //     );
// //   }
// // }
// import 'package:abc/utils/config.dart';
// import 'package:flutter/material.dart';
//
// class AppointmentPage extends StatefulWidget {
//   const AppointmentPage({Key? key}) : super(key: key);
//
//
//   @override
//   State<AppointmentPage> createState() => _AppointmentPageState();
// }
//
// enum FilterStatus{upcoming, complete, cancel}
//
// class _AppointmentPageState extends State<AppointmentPage> {
//   FilterStatus status = FilterStatus.upcoming;
//   Alignment _aligment = Alignment.centerLeft;
//   List<dynamic> schedules = [
//     {
//       "doctor_name":"Pham Trung Hieu",
//       "doctor_profile":"assets/doctor_2.jpg",
//       "category":"Dental",
//       "status": FilterStatus.upcoming,
//     },
//     {
//       "doctor_name":"Canh Nguyen",
//       "doctor_profile":"assets/doctor_3.jpg",
//       "category":"Cardiology",
//       "status": FilterStatus.complete,
//     },
//     {
//       "doctor_name":"Quoc Anh",
//       "doctor_profile":"assets/doctor_4.jpg",
//       "category":"Respiration",
//       "status": FilterStatus.complete,
//     },
//     {
//       "doctor_name":"Jenny Huynh",
//       "doctor_profile":"assets/doctor_5.jpg",
//       "category":"General",
//       "status": FilterStatus.cancel,
//     }
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     List<dynamic> filteredSchedules = schedules.where((var schedule) {
//       // switch(schedule['status']){
//       //   case 'upcoming' :
//       //     schedule['status'] = FilterStatus.upcoming;
//       //     break;
//       //   case 'complete' :
//       //     schedule['status'] = FilterStatus.complete;
//       //     break;
//       //   case 'cancel' :
//       //     schedule['status'] = FilterStatus.cancel;
//       //     break;
//       // }
//       return schedule['status'] == status;
//     }).toList();
//     return SafeArea(
//       child: Padding(
//         padding: const EdgeInsets.only(left: 20, top: 20, right: 20),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children:  <Widget>[
//             const Text(
//               'Appointment Schedule',
//               textAlign: TextAlign.center,
//               style: TextStyle(
//                   fontSize: 18,
//                   fontWeight: FontWeight.bold
//               ),
//             ),
//             Config.spaceSmall,
//             Stack(
//               children: [
//                 Container(
//                   width: double.infinity,
//                   height: 40,
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(20),
//                   ),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       for(FilterStatus filterstatus in FilterStatus.values)
//                         Expanded(
//                             child: GestureDetector(
//                               onTap: () {
//                                 setState(() {
//                                   if(filterstatus == FilterStatus.upcoming){
//                                     status = FilterStatus.upcoming;
//                                     _aligment = Alignment.centerLeft;
//                                   }else if(filterstatus == FilterStatus.complete) {
//                                     status = FilterStatus.complete;
//                                     _aligment = Alignment.center;
//                                   }else if(filterstatus == FilterStatus.cancel) {
//                                     status = FilterStatus.cancel;
//                                     _aligment = Alignment.centerRight;
//                                   }
//                                 });
//                               },
//                               child: Center(child: Text(filterstatus.name),),
//                             ))
//
//                     ],
//                   ),
//                 ),
//                 AnimatedAlign(
//                   alignment: _aligment,
//                   duration: const Duration(milliseconds: 200),
//                   child: Container(
//                     height: 40,
//                     width: 100,
//                     decoration: BoxDecoration(
//                         color: Config.primaryColor,
//                         borderRadius: BorderRadius.circular(20)
//                     ),
//                     child: Center(
//                       child: Text(
//                         status.name,
//                         style: const TextStyle(
//                           color: Colors.white,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ),
//                   ),
//                 )
//               ],
//             ),
//             Config.spaceSmall,
//             Expanded(
//               child: ListView.builder(
//                 itemCount: filteredSchedules.length,
//                 itemBuilder: ((context, index){
//                   var _schedule = filteredSchedules[index];
//                   bool isLastElement = filteredSchedules.length + 1 == index;
//                   return Card(
//                     shape: RoundedRectangleBorder(
//                         side: const BorderSide(
//                             color: Colors.grey
//                         ),
//                         borderRadius: BorderRadius.circular(20)
//                     ),
//                     margin:
//                     !isLastElement ? const EdgeInsets.only(bottom: 20)
//                         : EdgeInsets.zero,
//                     child: Padding(
//                       padding: const EdgeInsets.all(15),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.stretch,
//                         children: [
//                           Row(
//                             children: [
//                               CircleAvatar(
//                                 backgroundImage: AssetImage(_schedule['doctor_profile']),
//                               ),
//                               const SizedBox(width: 10,),
//                               Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text(
//                                     _schedule['doctor_name'],
//                                     style: const TextStyle(
//                                         color: Colors.black,
//                                         fontWeight: FontWeight.w700
//                                     ),
//                                   ),
//                                   const SizedBox(height: 5,),
//                                   Text(
//                                     _schedule['category'],
//                                     style: const TextStyle(
//                                         color: Colors.grey,
//                                         fontSize: 12,
//                                         fontWeight: FontWeight.w600
//                                     ),
//                                   ),
//                                 ],
//                               )
//                             ],
//                           ),
//                           const SizedBox(height: 15,),
//                           const ScheduleCard(),
//                           const SizedBox(height: 15,),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Expanded(child: OutlinedButton(
//                                 onPressed: () {},
//                                 child: const Text(
//                                   'Cancel',
//                                   style: TextStyle(color: Config.primaryColor),
//                                 ),
//                               ),
//                               ),
//                               const SizedBox(width: 20,),
//                               Expanded(
//                                 child: OutlinedButton(
//                                   style: OutlinedButton.styleFrom(
//                                       backgroundColor: Config.primaryColor
//                                   ),
//                                   onPressed: () {},
//                                   child: const Text(
//                                     'Reschedule',
//                                     style: TextStyle(color: Colors.white),
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           )
//                         ],
//                       ),
//                     ),
//                   );
//                 }
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class ScheduleCard extends StatefulWidget {
//   const ScheduleCard({Key? key}) : super(key: key);
//
//   @override
//   State<ScheduleCard> createState() => _ScheduleCardState();
// }
//
// class _ScheduleCardState extends State<ScheduleCard> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//           color: Colors.grey.shade200,
//           borderRadius: BorderRadius.circular(10)
//       ),
//       width: double.infinity,
//       padding: const EdgeInsets.all(20),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: <Widget>[
//           Icon(
//             Icons.calendar_today,
//             color: Config.primaryColor,
//             size: 15,
//           ),
//           SizedBox(width: 5,),
//           Text(
//             'Monday, 05/20/2024',
//             style: const TextStyle(
//               color: Config.primaryColor,
//             ),
//           ),
//           SizedBox(width: 20,),
//           Icon(
//             Icons.access_alarm,
//             color: Config.primaryColor,
//             size: 17,
//           ),
//           SizedBox(width: 5,),
//           Flexible(child: Text('2:00 PM', style:
//           TextStyle(color: Config.primaryColor,
//           ),))
//         ],
//       ),
//     );
//   }
// }
// import 'package:doctor_appointment_app/providers/dio_provider.dart';
// import 'package:doctor_appointment_app/utils/config.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

import '../providers/dio_provider.dart';
import '../utils/config.dart';

class AppointmentPage extends StatefulWidget {
  const AppointmentPage({Key? key}) : super(key: key);

  @override
  State<AppointmentPage> createState() => _AppointmentPageState();
}

//enum for appointment status
enum FilterStatus { upcoming, complete, cancel }

class _AppointmentPageState extends State<AppointmentPage> {
  FilterStatus status = FilterStatus.upcoming; //initial status
  Alignment _alignment = Alignment.centerLeft;
  List<dynamic> schedules = [];

  //get appointments details
  // Future<void> getAppointments() async {
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();
  //   final token = prefs.getString('token') ?? '';
  //   final appointment = await DioProvider().getAppointments(token);
  //   if (appointment != 'Error') {
  //     setState(() {
  //       schedules = json.decode(appointment);
  //       print(schedules);
  //     });
  //   }
  // }
  //
  // @override
  // void initState() {
  //   getAppointments();
  //   super.initState();
  // }
  Future<void> getAppointments() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token') ?? '';
    final appointment = await DioProvider().getAppointments(token);

    if (appointment is List) {
      setState(() {
        schedules = appointment;
        print(schedules);
      });
    } else {
      // Xử lý lỗi hoặc phản hồi không mong đợi
      print('Error: $appointment');
    }
  }

  @override
  void initState() {
    super.initState();
    getAppointments();
  }

  @override
  Widget build(BuildContext context) {
    List<dynamic> filteredSchedules = schedules.where((var schedule) {
      switch (schedule['status']) {
        case 'upcoming':
          schedule['status'] = FilterStatus.upcoming;
          break;
        case 'complete':
          schedule['status'] = FilterStatus.complete;
          break;
        case 'cancel':
          schedule['status'] = FilterStatus.cancel;
          break;
      }
      return schedule['status'] == status;
    }).toList();

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(left: 20, top: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const Text(
              'Appointment Schedule',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Config.spaceSmall,
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Đây là các tab lọc
                      for (FilterStatus filterStatus in FilterStatus.values)
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                if (filterStatus == FilterStatus.upcoming) {
                                  status = FilterStatus.upcoming;
                                  _alignment = Alignment.centerLeft;
                                } else if (filterStatus == FilterStatus.complete) {
                                  status = FilterStatus.complete;
                                  _alignment = Alignment.center;
                                } else if (filterStatus == FilterStatus.cancel) {
                                  status = FilterStatus.cancel;
                                  _alignment = Alignment.centerRight;
                                }
                              });
                            },
                            child: Center(
                              child: Text(filterStatus.name),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
                AnimatedAlign(
                  alignment: _alignment,
                  duration: const Duration(milliseconds: 200),
                  child: Container(
                    width: 100,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Config.primaryColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Text(
                        status.name,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Config.spaceSmall,
            Expanded(
              child: ListView.builder(
                itemCount: filteredSchedules.length,
                itemBuilder: ((context, index) {
                  var schedule = filteredSchedules[index];
                  bool isLastElement = filteredSchedules.length + 1 == index;
                  return Card(
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(
                        color: Colors.grey,
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    margin: !isLastElement
                        ? const EdgeInsets.only(bottom: 20)
                        : EdgeInsets.zero,
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                backgroundImage: NetworkImage(
                                    "http://10.0.2.2:8000${schedule['doctor_profile']}"),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    schedule['doctor_name'] ?? 'N/A',
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    schedule['category'] ?? 'N/A',
                                    style: const TextStyle(
                                      color: Colors.grey,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          ScheduleCard(
                            // date: schedule['date'] ?? 'N/A',
                            // day: schedule['day'] ?? 'N/A',
                            // time: schedule['time'] ?? 'N/A',
                            date: schedule['date'] ,
                            day: schedule['day']  ,
                            time: schedule['time'] ,
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: OutlinedButton(
                                  onPressed: () {},
                                  child: const Text(
                                    'Cancel',
                                    style: TextStyle(color: Config.primaryColor),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Expanded(
                                child: OutlinedButton(
                                  style: OutlinedButton.styleFrom(
                                    backgroundColor: Config.primaryColor,
                                  ),
                                  onPressed: () {},
                                  child: const Text(
                                    'Reschedule',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }

}

// class ScheduleCard extends StatelessWidget {
//   const ScheduleCard(
//       {Key? key, required this.date, required this.day, required this.time})
//       : super(key: key);
//   final String date;
//   final String day;
//   final String time;
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         color: Colors.grey.shade200,
//         borderRadius: BorderRadius.circular(10),
//       ),
//       width: double.infinity,
//       padding: const EdgeInsets.all(20),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: <Widget>[
//           const Icon(
//             Icons.calendar_today,
//             color: Config.primaryColor,
//             size: 15,
//           ),
//           const SizedBox(
//             width: 5,
//           ),
//           Text(
//             '$day, $date',
//             style: const TextStyle(
//               color: Config.primaryColor,
//             ),
//           ),
//           const SizedBox(
//             width: 20,
//           ),
//           const Icon(
//             Icons.access_alarm,
//             color: Config.primaryColor,
//             size: 17,
//           ),
//           const SizedBox(
//             width: 5,
//           ),
//           Flexible(
//               child: Text(
//                 time,
//                 style: const TextStyle(
//                   color: Config.primaryColor,
//                 ),
//               ))
//         ],
//       ),
//     );
//   }
// }
class ScheduleCard extends StatelessWidget {
  const ScheduleCard({
    Key? key,
    required this.date,
    required this.day,
    required this.time,
  }) : super(key: key);

  final String date;
  final String day;
  final String time;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(10),
      ),
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          const Icon(
            Icons.calendar_today,
            color: Config.primaryColor,
            size: 15,
          ),
          const SizedBox(
            width: 5,
          ),
          Text(
            '$day, $date',
            style: const TextStyle(
              color: Config.primaryColor,
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          const Icon(
            Icons.access_alarm,
            color: Config.primaryColor,
            size: 17,
          ),
          const SizedBox(
            width: 5,
          ),
          Flexible(
            child: Text(
              time,
              style: const TextStyle(
                color: Config.primaryColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
