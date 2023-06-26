import 'package:flutter/material.dart';

import '../utils/config.dart';

class SocialButton extends StatelessWidget {
  const SocialButton({Key? key, required this.social}) : super(key: key);
  final String social;
  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return OutlinedButton(
        onPressed: (){},
        style: OutlinedButton.styleFrom(
          padding: EdgeInsets.symmetric(vertical:15),
          side: const BorderSide(
            width: 1,
            color: Colors.black
          ),
        ),
        child: SizedBox(
          width: Config.widthSize*0.4,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset('assets/$social.png',
                width: 40,
                height: 40,),
              Text(
                social.toUpperCase(),
                style: const TextStyle(
color: Colors.black),)

            ],
          ),
        ));
  }
}
