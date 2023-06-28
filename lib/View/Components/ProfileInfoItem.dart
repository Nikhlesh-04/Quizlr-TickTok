// ignore: file_names
import 'package:education/Manager/ColourStyle.dart';
import 'package:education/Manager/Padding.dart';
import 'package:flutter/material.dart';
import '../../Manager/Constants.dart';

class ProfileInfoItem extends StatelessWidget {
  const ProfileInfoItem(
      {super.key, required this.fullname, required this.email});

  final String fullname;
  final String email;

  @override
  Widget build(BuildContext context) {
    return Card(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
        elevation: 5,
        shadowColor: Colors.transparent,
        color: Theme.of(context).colorScheme.cardBackground,
        child: Row(
          children: [
            Container(
              padding: AppPadding.all10,
              child: ConstantImage.avatar,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    padding: AppPadding.excludingBottom10,
                    child: Text(
                      fullname,
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.label,
                          fontWeight: FontWeight.normal,
                          fontSize: 17.0),
                    )),
                Container(
                    padding: AppPadding.excludingTop10,
                    child: Text(
                      email,
                      style: const TextStyle(
                          color: Colors.blueAccent,
                          fontWeight: FontWeight.normal,
                          fontSize: 17.0),
                    ))
              ],
            )
          ],
        ));
  }
}
