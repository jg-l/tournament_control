import 'package:flutter/material.dart';

/// A Simple Widget that displays a large text with a subtitle
class Header extends StatelessWidget {
  const Header({
    this.title,
    Key key,
  }) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: Theme.of(context)
                .textTheme
                .headline5
                .copyWith(color: Colors.black),
          ),
          Text(
            "2019",
            style: Theme.of(context)
                .textTheme
                .subtitle1
                .copyWith(color: Colors.black),
          ),
        ],
      ),
    );
  }
}
