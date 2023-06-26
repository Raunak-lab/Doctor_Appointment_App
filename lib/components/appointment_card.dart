import 'package:flutter/material.dart';
import 'package:laravel/utils/config.dart';

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
      child:Material(
        color: Colors.transparent,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
    children: <Widget>[
         Row(
          children:  [

          const CircleAvatar(
              backgroundImage: AssetImage('assets/doctor_1.jpg'),
        ),
        const SizedBox(
            width:10
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            Text("Dr Richar Tan",
              style: TextStyle(color:Colors.white),),
            SizedBox(height: 2,),
            Text("Dental", style: TextStyle(color: Colors.black) ,)


          ],
        )
        ],
      ),
      Config.spaceSmall,
      const ScheduleCard(),
      Config.spaceSmall,
      Row(
        mainAxisAlignment:MainAxisAlignment.spaceBetween ,
        children: [
          Expanded(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
              ),
              child:  const Text(
                'Cancel',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: (){},
            ),
          ),
          SizedBox(width: 10,),
          Expanded(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
              ),
              child:  const Text(
                'Completed',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: (){},
            ),
          ),
        ],
      )
         ],
        ),
      )
    ));
  }
}


//Schedule widget
class ScheduleCard extends StatelessWidget {
  const ScheduleCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(15),
      ),
      width: double.infinity,
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
