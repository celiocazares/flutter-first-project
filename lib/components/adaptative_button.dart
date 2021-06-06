import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';

class AdaptativeButton extends StatelessWidget {
  final String label;
  final Function onPressed;

  AdaptativeButton({
    this.label,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoButton(
          padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(label),
            onPressed: onPressed,
            color: Theme.of(context).primaryColor,
          )
        : RaisedButton(
          color: Theme.of(context).primaryColor,
          textColor: Theme.of(context).textTheme.button.color,
            onPressed: onPressed,
            child: Text(label),
          );
  }
}
