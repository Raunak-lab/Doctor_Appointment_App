

import 'package:flutter/material.dart';

import '../utils/config.dart';


class AppointmentPage extends StatefulWidget {
  const AppointmentPage({Key? key}) : super(key: key);

  @override
  State<AppointmentPage> createState() => _AppointmentPageState();
}
enum FilterStatus{upcoming,complete,cancel}


class _AppointmentPageState extends State<AppointmentPage> {
  FilterStatus status = FilterStatus.upcoming;

  Alignment _alignment = Alignment.centerLeft;
  List<dynamic> schedules = [
    {
      "doctor_name":"Richard_Tan",
      "doctor_profile":"assets/doctor_2.jpg",
      "category":"Dental",
      "status":FilterStatus.upcoming,
    },
    {
      "doctor_name":"Max Lin",
      "doctor_profile":"assets/doctor_3.jpg",
      "category":"Cardiology",
      "status":FilterStatus.complete,
    },
    {
      "doctor_name":" Jang Wong",
      "doctor_profile":"assets/doctor_4.jpg",
      "category":"Respiration",
      "status":FilterStatus.complete,
    },
    {
      "doctor_name":"Jenny Song",
      "doctor_profile":"assets/doctor_5.jpg",
      "category":"General",
      "status":FilterStatus.cancel,
    },
  ];

  @override
  Widget build(BuildContext context) {
    List<dynamic> filteredSchedule = schedules.where((var schedule){
      // switch(schedule['status']){
      //   case 'upcoming':
      //     schedule['status'] = FilterStatus.upcoming;
      //     break;
      //   case 'complete':
      //     schedule['status'] = FilterStatus.complete;
      //     break;
      //   case 'cancel':
      //     schedule['status'] = FilterStatus.cancel;
      //     break;
      // }
      return schedule['status']==status;
    }).toList();

    double screenWidth = MediaQuery.of(context).size.width;

    // Calculate the desired width based on the screen size
    double widgetWidth = screenWidth * 0.9; // 80% of the screen width

    return SafeArea(
        child:Padding(
          padding: EdgeInsets.only(left: 20,top: 20,right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Appointment Schedule',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold
                ),
              ),
              Config.spaceSmall,
              Stack(
                children: [
                  Container(
                    width: widgetWidth,
                    height: 40,
                    decoration: BoxDecoration(
                       color: Colors.white,
                       borderRadius: BorderRadius.circular(20),

                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        for(FilterStatus filterStatus in FilterStatus.values)
                          Expanded(
                              child:GestureDetector(
                                child: Center(
                                  child: Text(filterStatus.name),
                                ),
                                onTap: (){
                                  setState(() {
                                    if(filterStatus == FilterStatus.upcoming){
                                      status = FilterStatus.upcoming;
                                      _alignment = Alignment.centerLeft;
                                    }
                                    else if(filterStatus == FilterStatus.complete){
                                      status = FilterStatus.complete;
                                      _alignment = Alignment.center;
                                    }
                                    else if(filterStatus == FilterStatus.cancel)
                                      {
                                        status = FilterStatus.cancel;
                                        _alignment = Alignment.centerRight;
                                      }
                                  });
                                },
                              )),

                      ],
                    ),

                  ),
                  AnimatedAlign(
                    alignment: _alignment,
                    duration: const Duration(milliseconds: 200),
                    child: Container(
                      width: 100,
                      height:40,
                      decoration: BoxDecoration(
                        color: Config.primaryColor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: Text(
                          status.name,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold
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
                  itemCount: filteredSchedule.length,
                    itemBuilder: ((context , index){
                      var _schedule = filteredSchedule[index];
                      bool isLastElement = filteredSchedule.length+1==index;
                      return Card(
                         shape: RoundedRectangleBorder(
                           side: const BorderSide(
                             color: Colors.grey
                           ),
                           borderRadius: BorderRadius.circular(20),
                         ),
                        margin: !isLastElement?const EdgeInsets.only(bottom: 20)
                        :EdgeInsets.zero,
                        child: Padding(
                          padding:EdgeInsets.all(15),
                          child:Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Row(
                                children: [
                                  CircleAvatar(
                                    backgroundImage: AssetImage(_schedule['doctor_profile']),
                                  ),
                                  Config.spaceSmall,
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        _schedule['doctor_name'],
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      const SizedBox(height: 5,),
                                      Text(
                                        _schedule['category'],
                                        style:const TextStyle(
                                          color: Colors.grey,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600
                                        )
                                      ),
                                      const SizedBox(height: 15,),
                                      const ScheduleCard()
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                          ),
                      );
                    })
                ),
              )

            ],
          ),
        )
    );
  }
}

class ScheduleCard extends StatelessWidget {
  const ScheduleCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   return Container(
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(10),
      ),
      width: 300,
      padding: const EdgeInsets.all(20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          Icon(Icons.calendar_today
              ,color:Colors.white,size: 15),
          SizedBox(width: 5),
          Text(
            'Monday, 11/28/2022',
            style:  TextStyle(
                color: Colors.white
            ),
          ),
          SizedBox(width: 20,),
          Icon(Icons.access_alarm,
            color: Colors.white,
            size: 17,),
          SizedBox(width: 5,),
          Flexible(child: Text('2:00 PM',style: TextStyle(color: Colors.white),))



        ],
      ),
    );
  }
}
