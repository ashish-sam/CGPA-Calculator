import 'package:flutter/widgets.dart';
import 'package:finalapp/models/course_item.dart';
import 'package:finalapp/data/course_data.dart';

class SemData extends ChangeNotifier {
  List<CourseData> semList = [];

  SemData() {
    CourseData Sem1 = CourseData();
    semList.add(Sem1);
    CourseData Sem2 = CourseData();
    semList.add(Sem2);
    CourseData Sem3 = CourseData();
    semList.add(Sem3);
    CourseData Sem4 = CourseData();
    semList.add(Sem4);
    CourseData Sem5 = CourseData();
    semList.add(Sem5);
    CourseData Sem6 = CourseData();
    semList.add(Sem6);
    CourseData Sem7 = CourseData();
    semList.add(Sem7);
    CourseData Sem8 = CourseData();
    semList.add(Sem8);
    CourseData Sem9 = CourseData();
    semList.add(Sem9);
    CourseData Sem10 = CourseData();
    semList.add(Sem10);
  }

  List<CourseData> getSemList() {
    return semList;
  }

  void addNewSem(CourseData newSem) {
    semList.add(newSem);
    notifyListeners();
  }

  void deleteSem(CourseData newSem) {
    semList.remove(newSem);
    notifyListeners();
  }

  int creditSum() {
    int s = 0;
    for (int i = 0; i < getSemList().length; i++) {
      for (int j = 0; j < getSemList()[i].getCourseList().length; j++) {
        s += getSemList()[i].getCourseList()[j].credits;
      }
    }
    return s;
  }

  String functionCGPA() {
    double sumNum = 0;
    for (int i = 0; i < getSemList().length; i++) {
      for (int j = 0; j < getSemList()[i].getCourseList().length; j++) {
        sumNum += getSemList()[i].getCourseList()[j].credits *
            getSemList()[i].getCourseList()[j].grade;
      }
    }
    sumNum = sumNum / creditSum();
    if (creditSum() == 0) sumNum = 0;
    return sumNum.toStringAsFixed(2);
  }
}
