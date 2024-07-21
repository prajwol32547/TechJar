import 'package:flutter/material.dart';
import 'package:tecapp/Presentation/DetailScreen/Model/commentModel.dart';

Widget commentTile(context, commentModel model) {
  return Container(
    color: Colors.white,
    child: ListTile(
        title: Text(model.userID!.toString()),
        subtitle: Text(
          model.body!,
          style: Theme.of(context).textTheme.labelSmall!.copyWith(fontSize: 12),
          softWrap: true,
        )),
  );
}
