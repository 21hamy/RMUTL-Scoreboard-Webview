import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scoreboard/models/volleyball/set.dart';
import 'package:scoreboard/models/badminton/set.dart';
import 'package:scoreboard/models/tabletennis/set.dart';
import 'package:sizer/sizer.dart';
import 'package:firebase_database/firebase_database.dart';

class ButtonSet extends StatefulWidget {
  const ButtonSet({Key? key, required this.sport, required this.team})
      : super(key: key);

  final int sport;
  final int team;

  @override
  State<ButtonSet> createState() => _ButtonSetState();
}

class _ButtonSetState extends State<ButtonSet> {
  late DatabaseReference dbRef;

  @override
  void initState() {
    super.initState();
    dbRef = FirebaseDatabase.instance.ref().child('FlutterData');
  }

  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          shape: const StadiumBorder(),
          backgroundColor: const Color.fromARGB(255, 23, 36, 113),
          minimumSize: Size(15.w, 5.h),
          // foreground
        ),
        onPressed: () {
          if (widget.sport == 2) {
            context.read<SetVolleyball>().update(widget.team);
            if (widget.team == 1) {
              Map<String, String> alldatas = {
                'SetA':
                    context.read<SetVolleyball>().getSetTeam1.toString(),
              };
              dbRef.update(alldatas);
            }
            if (widget.team == 2) {
              Map<String, String> alldatas = {
                'SetB':
                    context.read<SetVolleyball>().getSetTeam2.toString(),
              };
              dbRef.update(alldatas);
            }
          }
          if (widget.sport == 5) {
            context.read<SetBadminton>().update(widget.team);
            if (widget.team == 1) {
              Map<String, String> alldatas = {
                'SetA':
                    context.read<SetBadminton>().getSetTeam1.toString(),
              };
              dbRef.update(alldatas);
            }
            if (widget.team == 2) {
              Map<String, String> alldatas = {
                'SetB':
                    context.read<SetBadminton>().getSetTeam2.toString(),
              };
              dbRef.update(alldatas);
            }
          }
          if (widget.sport == 6) {
            context.read<SetTabletennis>().update(widget.team);
            if (widget.team == 1) {
              Map<String, String> alldatas = {
                'SetA':
                    context.read<SetTabletennis>().getSetTeam1.toString(),
              };
              dbRef.update(alldatas);
            }
            if (widget.team == 2) {
              Map<String, String> alldatas = {
                'SetB':
                    context.read<SetTabletennis>().getSetTeam2.toString(),
              };
              dbRef.update(alldatas);
            }
          }
        },
        child: Text(
          "SET",
          style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
        ));
  }
}
