import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String text;
  final Function onPressed;
  bool showProgress;

  AppButton(this.text, {this.onPressed, this.showProgress = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 46,
      child: RaisedButton(
        color: Colors.black.withAlpha(10),
        child: showProgress
            ? Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    Colors.lightBlueAccent,
                  ),
                ),
              )
            : Text(
                text,
                style: TextStyle(
                  color: Colors.lightBlueAccent,
                  fontSize: 22,
                  letterSpacing: 2,
                ),
              ),
        onPressed: onPressed,
      ),
    );
  }
}
