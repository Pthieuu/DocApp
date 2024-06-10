import 'package:abc/utils/config.dart';
import 'package:flutter/material.dart';

class AppointmentCard extends StatefulWidget {
  const AppointmentCard({Key? key}) : super(key: key);

  @override
  State<AppointmentCard> createState() => _AppointmentCardState();
}

class _AppointmentCardState extends State<AppointmentCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Config.primaryColor,
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
                    AssetImage('assets/doctor_1.jpg'),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Dr Pham Trung Hieu',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 2,),
                      Text('Dental', style: TextStyle(
                        color: Colors.black,
                      ),)
                    ],
                  ),
                ],
              ),
              Config.spaceSmall,
               ScheduleCard(),
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
                      child: const Text('Completed', style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {} ,
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
class ScheduleCard extends StatefulWidget {
  const ScheduleCard({Key? key}) : super(key: key);

  @override
  State<ScheduleCard> createState() => _ScheduleCardState();
}

class _ScheduleCardState extends State<ScheduleCard> {
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
           Icon(
            Icons.calendar_today,
            color: Colors.white,
            size: 15,
          ),
           SizedBox(width: 5,),
          Text(
            'Monday, 05/20/2024',
            style: const TextStyle(
              color: Colors.white
            ),
          ),
           SizedBox(width: 20,),
           Icon(
            Icons.access_alarm,
            color: Colors.white,
            size: 17,
          ),
           SizedBox(width: 5,),
          Flexible(child: Text('2:00 PM', style: TextStyle(color: Colors.white),))
        ],
      ),
    );
  }
}

