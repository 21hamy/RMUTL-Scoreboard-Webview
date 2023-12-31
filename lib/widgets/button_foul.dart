import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scoreboard/models/basketball/foul.dart';
import 'package:scoreboard/models/futsal/foul.dart';
import 'package:sizer/sizer.dart';
import 'package:firebase_database/firebase_database.dart';

class ButtonFoul extends StatefulWidget {
  const ButtonFoul({Key? key, required this.sport, required this.team})
      : super(key: key);

  final int sport;
  final int team;

  @override
  State<ButtonFoul> createState() => _ButtonFoulState();
}

class _ButtonFoulState extends State<ButtonFoul> {
  late DatabaseReference dbRef;

  @override
  void initState() {
    super.initState();
    dbRef = FirebaseDatabase.instance.ref().child('FlutterData');
  }

  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: const StadiumBorder(),
        backgroundColor: const Color.fromARGB(255, 23, 36, 113),
        minimumSize: Size(15.w, 5.h),
      ),
      onPressed: () {
        if (widget.sport == 1) {
          context.read<FoulBasketball>().update(widget.team);
          if (widget.team == 1) {
            Map<String, String> alldatas = {
              'FoulA':
                  context.read<FoulBasketball>().getFoulTeam1.toString(),
            };
            dbRef.update(alldatas);
          }
          if (widget.team == 2) {
            Map<String, String> alldatas = {
              'FoulB':
                  context.read<FoulBasketball>().getFoulTeam2.toString(),
            };
            dbRef.update(alldatas);
          }
        }
        if (widget.sport == 4) {
          context.read<FoulFutsal>().update(widget.team);
          if (widget.team == 1) {
            Map<String, String> alldatas = {
              'FoulA':
                  context.read<FoulFutsal>().getFoulTeam1.toString(),
            };
            dbRef.update(alldatas);
          }
          if (widget.team == 2) {
            Map<String, String> alldatas = {
              'FoulB':
                  context.read<FoulFutsal>().getFoulTeam2.toString(),
            };
            dbRef.update(alldatas);
          }
        }
      },
      child: Text(
        'Foul',
        style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
      ),
    );
  }
}