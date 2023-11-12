import 'package:flutter/material.dart';

class LeftShape extends StatelessWidget {
 final double width;
  const LeftShape({super.key , this.width=0});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: width,
          height: 40,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(20),
               
              ),
              color: Colors.green),
        ),
        SizedBox(width: 5,),
        Text('شاخص مثبت ' ,style: TextStyle(color: Colors.green),)
      ],
    );
  }
}
