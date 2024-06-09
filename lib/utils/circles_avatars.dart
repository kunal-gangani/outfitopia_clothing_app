import 'package:flutter/material.dart';
Widget avatarsRow({required double h,required double w}){
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: h,
                  backgroundColor: const Color.fromARGB(255, 200, 218, 226),
                ),
                SizedBox(
                  width: w,
                ),
                CircleAvatar(
                  radius: h,
                  backgroundColor: const Color.fromARGB(255, 200, 218, 226),
                ),
                SizedBox(
                  width: w,
                ),
                CircleAvatar(
                  radius: h,
                  backgroundColor: const Color.fromARGB(255, 99, 125, 164),
                ),
                SizedBox(
                  width: w,
                ),
                CircleAvatar(
                  radius: h,
                  backgroundColor: const Color.fromARGB(255, 200, 218, 226),
                ),
                SizedBox(
                  width: w,
                ),
                CircleAvatar(
                  radius: h,
                  backgroundColor: const Color.fromARGB(255, 200, 218, 226),
                )
              ],
            );
}