import 'package:flutter/widgets.dart';
import 'package:finalapp/models/course_item.dart';

class CourseData extends ChangeNotifier {
  List<CourseItem> courseList = [];
  int sem = 1;

  
  List<CourseItem> getCourseList() {
    return courseList;
  }

  void addNewCourse(CourseItem newCourse) {
    courseList.add(newCourse);

    notifyListeners();
  }

  void deleteCourse(CourseItem newCourse) {
    courseList.remove(newCourse);

    notifyListeners();
  }

  int creditCalc() {
    int creditSum = 0;
    for (int i = 0; i < getCourseList().length; i++) {
      creditSum += getCourseList()[i].credits;
    }
    return creditSum;
  }

  String calcGPA() {
    double sum = 0, GPA = 0.0;
    for (int i = 0; i < getCourseList().length; i++) {
      sum += getCourseList()[i].credits * getCourseList()[i].grade;
    }
    Listener();
    if (creditCalc() > 0) GPA = sum / creditCalc();
    return GPA.toStringAsFixed(2);
  }

  void clearSem() {
    getCourseList().clear();
    notifyListeners();
  }
}
