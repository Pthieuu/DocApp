// import 'package:abc/utils/config.dart';
// import 'package:flutter/material.dart';
//
// class AppointmentCard extends StatefulWidget {
//    AppointmentCard({Key? key, required this.doctor, required this.color}) : super(key: key);
//
//    final Map<String, dynamic> doctor;
//    final Color color;
//
//
//   @override
//   State<AppointmentCard> createState() => _AppointmentCardState();
// }
//
// class _AppointmentCardState extends State<AppointmentCard> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: double.infinity,
//       decoration: BoxDecoration(
//         color: widget.color,
//         borderRadius: BorderRadius.circular(10),
//       ),
//       child:  Material(
//         color: Colors.transparent,
//         child: Padding(
//             padding: EdgeInsets.all(20),
//           child: Column(
//             children:  <Widget>[
//               Row(
//                 children: [
//                   CircleAvatar(
//                     backgroundImage:
//                     NetworkImage(
//                         "http://10.0.2.2:8000${widget.doctor['doctor_profile']}"),
//                   ),
//                   SizedBox(
//                     width: 10,
//                   ),
//                   Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: <Widget>[
//                       Text(
//                         'Dr ${widget.doctor['doctor_name']}',
//                         style: const TextStyle(
//                           color: Colors.white,
//                         ),
//                       ),
//                       const SizedBox(height: 2,),
//                        Text(
//                         widget.doctor['category'],
//                          style:const  TextStyle(
//                         color: Colors.black,
//                       ),)
//                     ],
//                   ),
//                 ],
//               ),
//               Config.spaceSmall,
//                ScheduleCard(
//                  appointment: widget.doctor['appointments'],
//                ),
//               Config.spaceSmall,
//               //action button
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Expanded(
//                       child: ElevatedButton(
//                           style: ElevatedButton.styleFrom(
//                             backgroundColor: Colors.red,
//                           ),
//                         child: const Text('Cancel', style: TextStyle(color: Colors.white),
//                         ),
//                         onPressed: () {} ,
//                       ),
//                   ),
//                   const SizedBox(width: 20,),
//                   Expanded(
//                     child: ElevatedButton(
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: Colors.blue,
//                       ),
//                       child: const Text('Completed', style: TextStyle(color: Colors.white),
//                       ),
//                       onPressed: () {} ,
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//       ),
//       ),
//     );
//   }
// }
//
// //Schedule Widget
// class ScheduleCard extends StatefulWidget {
//  const ScheduleCard({Key? key, required this.appointment}) : super(key: key);
//
//   final Map<String, dynamic> appointment;
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
//         color: Colors.grey,
//         borderRadius: BorderRadius.circular(10)
//       ),
//       width: double.infinity,
//       padding: const EdgeInsets.all(20),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children:  <Widget>[
//            const Icon(
//             Icons.calendar_today,
//             color: Colors.white,
//             size: 15,
//           ),
//           const SizedBox(width: 5,),
//           Text(
//             '${widget.appointment['day']}, ${widget.appointment['date']}',
//             style: const TextStyle(
//               color: Colors.white
//             ),
//           ),
//           const SizedBox(width: 20,),
//            const Icon(
//             Icons.access_alarm,
//             color: Colors.white,
//             size: 17,
//           ),
//          const SizedBox(width: 5,),
//           Flexible(
//               child:
//               Text(widget.appointment['time'],
//                 style:const  TextStyle(color: Colors.white),))
//         ],
//       ),
//     );
//   }
// }
//
import 'package:abc/main.dart';
import 'package:abc/providers/dio_provider.dart';
import 'package:abc/utils/config.dart';
import 'package:flutter/material.dart';
import 'package:rating_dialog/rating_dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppointmentCard extends StatefulWidget {
   AppointmentCard({Key? key, required this.doctor, required this.color}) : super(key: key);

   final Map<String, dynamic> doctor;
   final Color color;

  @override
  State<AppointmentCard> createState() => _AppointmentCardState();
}

class _AppointmentCardState extends State<AppointmentCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: widget.color,
        borderRadius: BorderRadius.circular(10),
      ),
      child:  Material(
        color: Colors.transparent,
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children:  <Widget>[
              Row(
                children: [
                  CircleAvatar(
                    backgroundImage:
                    NetworkImage( "http://10.0.2.2:8000${widget.doctor['doctor_profile']}"),
                  ),
                 const SizedBox(
                    width: 10,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Dr ${widget.doctor['doctor_name']}',
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 2,),
                      Text(
                        widget.doctor['category'],
                        style: const TextStyle(
                        color: Colors.black,
                      ),)
                    ],
                  ),
                ],
              ),
              Config.spaceSmall,
              ScheduleCard(
                appointment: widget.doctor['appointments'],

              ),
              Config.spaceSmall,
              //action button
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                      ),
                      child: const Text('Cancel', style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {} ,
                    ),
                  ),
                  const SizedBox(width: 20,),
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                      ),
                      //add rating dialog here
                      //before that, add a new dio provider
                      onPressed: () async {
                        showDialog(
                            context: context,
                            builder: (context){
                              return RatingDialog(
                                initialRating: 1.0,
                                  title: const Text('Rate the doctor',
                                  textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  message: const Text('Please help us to rate our Doctor',
                                  textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 25,
                                    ),
                                  ),
                                  image: const FlutterLogo(size: 100,),
                                  submitButtonText: 'Submit',
                                  commentHint: 'Your reviews',
                                  onSubmitted: (response) async {
                                    final SharedPreferences prefs =
                                        await SharedPreferences.getInstance();
                                    final token = 
                                        prefs.getString('token') ?? '';
                                    final rating = await DioProvider()
                                        .stroreReviews(
                                        response.comment,
                                        response.rating,
                                        widget.doctor['appointments']['id'],
                                        widget.doctor['doc_id'],
                                        token
                                    );
                                    if (rating == 200 && rating != ''){
                                      MyApp.navigatorKey.currentState!.pushNamed('main');
                                    }
                              });
                            }

                        );
                      } ,
                      child: const Text('Completed', style: TextStyle(color: Colors.white),
                      ),

                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//Schedule Widget
class ScheduleCard extends StatelessWidget {
  const ScheduleCard({Key? key, required this.appointment}) : super(key: key);

  final Map<String, dynamic> appointment;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(10)
      ),
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const Icon(
            Icons.calendar_today,
            color: Colors.white,
            size: 15,
          ),
          const SizedBox(width: 5,),
          Text(
            '${appointment['day']}, ${appointment['date']}',
            style: const TextStyle(
                color: Colors.white
            ),
          ),
          const SizedBox(width: 20,),
         const  Icon(
            Icons.access_alarm,
            color: Colors.white,
            size: 17,
          ),
         const  SizedBox(width: 5,),
          Flexible(
              child: Text(
                appointment['time'],
                style: const TextStyle(
                    color: Colors.white),))
        ],
      ),
    );
  }
}