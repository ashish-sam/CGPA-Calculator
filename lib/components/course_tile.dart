import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class CourseTile extends StatelessWidget {
  final String name;
  final int grade;
  final int credits;
  final String sem;
  final String code;
  final void Function(BuildContext)? editTapped;
  final void Function(BuildContext)? deleteTapped;

  const CourseTile(
      {super.key,
      required this.name,
      required this.grade,
      required this.sem,
      required this.credits,
      required this.code,
      required this.deleteTapped,
      required this.editTapped});

  String stringGrade(int g) {
    String s;
    s = "A_";
    switch (g) {
      case 10:
        s = "A";
        break;
      case 9:
        s = "A-";
        break;
      case 8:
        s = "B";
        break;
      case 7:
        s = "B-";
        break;
      case 6:
        s = "C";
        break;
      case 5:
        s = "C-";
        break;
      case 4:
        s = "D";
        break;
      case 3:
        s = "E";
        break;
    }
    return s;
  }

  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(motion: const StretchMotion(), children: [
        SlidableAction(
          onPressed: editTapped,
          icon: Icons.edit,
          backgroundColor: Colors.green.shade300,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(2), bottomLeft: Radius.circular(2)),
        ),
        SlidableAction(
          onPressed: deleteTapped,
          icon: Icons.delete,
          backgroundColor: Colors.red.shade400,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(2), bottomLeft: Radius.circular(2)),
        ),
      ]),
      child: ListTile(
        title: Text(
          (code + ":\t" + name),
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text("Credits: " + credits.toString()),
        trailing: Text(
          stringGrade(grade),
          style: TextStyle(
            fontSize: 30,
          ),
        ),
      ),
    );
  }
}
