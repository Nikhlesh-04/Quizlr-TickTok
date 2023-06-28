import 'package:education/Manager/Constants.dart';
import 'package:education/Manager/Padding.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PlaylistItem extends StatelessWidget {
  const PlaylistItem({super.key, required this.name});

  final String name;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppPadding.playlistPadding,
      child: Row(
        children: [
          ConstantImage.playlist,
          Container(
            padding: AppPadding.leftRightOnly10,
            child: Text(
              key: const Key("Playlist"),
              "${ConstantsMessages.playlist} $name",
              style: const TextStyle(fontWeight: FontWeight.bold),
              textScaleFactor: 1,
            ),
          ),
          const Spacer(),
          ConstantImage.listCellDiscloseArrow
        ],
      ),
    );
  }
}
