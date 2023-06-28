import 'package:education/Manager/Padding.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserInfoItem extends StatelessWidget {
  const UserInfoItem(
      {super.key, required this.name, required this.description});

  final String name;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppPadding.all5,
      child: Row(
        children: [
          Padding(
            padding: AppPadding.userInfoPadding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: AppPadding.bottomOnly5,
                  child: Text(
                    name,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                    textScaleFactor: 1.2,
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Text(description, textScaleFactor: 1.2),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
