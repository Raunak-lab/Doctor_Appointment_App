import 'package:flutter/material.dart';

import '../utils/config.dart';

class DoctorCard extends StatefulWidget {
  const DoctorCard({Key? key}) : super(key: key);

  @override
  State<DoctorCard> createState() => _DoctorCardState();
}

class _DoctorCardState extends State<DoctorCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
      height:150,
      child:GestureDetector
      (
      child: Card(
        elevation: 5,
        color: Colors.white,
        child: Row(
          children: [
            SizedBox(
              width: Config.widthSize*0.33,
              child: Image.asset('assets/doctor_2.jpg',fit: BoxFit.fill,),
            ),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:  [
                    const Text(
                      'Dr Richard Tan',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18
                      ),
                    ),
                    const Text(
                      'Dentist',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.normal
                      ),
                    ),
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        Icon(Icons.star_border,
                        color: Colors.yellow,size:16),
                        Spacer(flex: 1,),
                        Text('4.5'),
                        Spacer(flex: 1,),
                        Text('Reviews'),
                        Spacer(flex:1),
                        Text('(20)'),
                        Spacer(flex: 7,),
                      ],
                    ),
                  ],
                ),

              ),
            )
          ],
        ),
      ),
      onTap:(){}
    ),
    );
  }
}
