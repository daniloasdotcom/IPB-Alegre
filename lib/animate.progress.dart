import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class CenteredCircularProgress extends StatelessWidget {
  final String message;
  final double loadingSize;
  final double fontSize;

  CenteredCircularProgress({
    required this.message,
    this.loadingSize = 130.0,
    this.fontSize = 14.0,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 24.0),
            child: Text(
              message,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: fontSize,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                  color: Colors.white),
            ),
          ),
          SizedBox(height: 20,),
          Container(
            height: loadingSize,
            width: loadingSize,
            child: const SpinKitCubeGrid(
              color: Colors.white,
              size: 130,
            ),
          ),
          
        ],
      ),
    );
  }
}
