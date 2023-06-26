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
         ],
        ),
      )
    ));
  }
}


//Schedule widget
class ScheduleWidget extends StatelessWidget {
  const ScheduleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
