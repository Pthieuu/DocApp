import 'package:abc/components/custom_appbar.dart';
import 'package:abc/main.dart';
import 'package:abc/models/booking_datetime_converted.dart';
import 'package:abc/providers/dio_provider.dart';
import 'package:abc/utils/config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:dio/dio.dart';


import '../components/button.dart';

class BookingPage extends StatefulWidget {
  const BookingPage({super.key});

  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  CalendarFormat _format = CalendarFormat.month;
  DateTime _focusDay = DateTime.now();
  DateTime _currentDay = DateTime.now();
  int? _currentIndex;
  bool _isWeekend = false;
  bool _dateSelected = false;
  bool _timeSelected = false;
  String? token; //lấy token để thêm vào booking date và thời gian vào trong dtb

  Future<void> getToken() async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    token = prefs.getString('token') ?? '';
  }

  @override
  void initState() {
    getToken();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Config().init(context);
    final doctor = ModalRoute.of(context)!.settings.arguments as Map;
    return  Scaffold(
      appBar: CustomAppbar(
            appTitle: 'Appointment',
            icon: FaIcon(Icons.arrow_back_ios),
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: Column(
              children: <Widget>[
                _tableCalender(),
                const Padding(padding: EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 25,
                ),
                  child: Center(
                    child: Text('Select Consultation Time',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),),

                  ),
                ),
              ],
            ),
          ),
          _isWeekend ? SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 30,
              ),
              alignment: Alignment.center,
              child: const Text('Weekend is not available, please select another date',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.grey
              ),
              ),
            ),
          )
              : SliverGrid(
              delegate: SliverChildBuilderDelegate((context, index) {
                return InkWell(
                  splashColor: Colors.transparent,
                  onTap: () {
                    setState(() {
                      _currentIndex = index;
                      _timeSelected = true;
                    });
                  },
                  child: Container(
                    margin: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: _currentIndex == index
                            ? Colors.white
                            : Colors.black
                      ),
                      borderRadius: BorderRadius.circular(15),
                      color: _currentIndex == index ? Config.primaryColor : null,
                    ),
                    alignment: Alignment.center,
                    child: Text('${index + 9}:00 ${index + 9 > 11 ? "PM" : "AM"}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: _currentIndex == index ? Colors.white : null,
                    ),
                    ),
                  ),
                );
              },
                childCount: 8,
              ),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                  childAspectRatio: 1.5)
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 80,
              ),
              child: Button(
                width: double.infinity,
                title: 'Make Appointment',
                onPressed: () async {
                  final getDate = DateConverted.getDate(_currentDay);
                  final getDay = DateConverted.getDay(_currentDay.weekday);
                  final getTime = DateConverted.getTime(_currentIndex!);

                  final booking = await DioProvider()
                      .bookAppointment(getDate, getDay, getTime, doctor['doctor_id'], token!);
                  if (booking == 200) {
                    MyApp.navigatorKey.currentState!.pushNamed('success_booking');
                  } else {
                    print('Failed to book appointment: $booking');
                  }
                },
                disable: _timeSelected && _dateSelected ? false : true,
              ),
            ),
          )
        ],
      ),
    );
  }

  //table calender
Widget _tableCalender(){
    return TableCalendar(
        focusedDay: _focusDay,
      firstDay: DateTime.now(),
      lastDay: DateTime(2050),
      calendarFormat: _format,
      currentDay: _currentDay,
      rowHeight: 48,
      calendarStyle: const CalendarStyle(
        todayDecoration: BoxDecoration(
          color: Config.primaryColor,
          shape: BoxShape.circle,
        ),
      ),
      availableCalendarFormats: const {
          CalendarFormat.month: 'Month',
      },
      onFormatChanged: (format) {
          setState(() {
            _format = format;
          });
      },
      onDaySelected: ((selectedDay, focusedDay){
        setState(() {
          _currentDay = selectedDay;
          _focusDay = focusedDay;
          _dateSelected = true;
          if (selectedDay.weekday == 6 || selectedDay.weekday == 7) {
            _isWeekend = true;
            _timeSelected = false;
            _currentIndex = null;
          } else {
            _isWeekend = false;

          }
        });
      }),
    );
}
}
