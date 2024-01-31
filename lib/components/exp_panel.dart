import 'package:finalapp/components/course_tile.dart';
import 'package:finalapp/data/sem_data.dart';
import 'package:flutter/material.dart';

class ExpPanel extends SemData {
  var addNewCourse;
  var deleteCourse;
  var clearSem;
  var editCourse;
  bool expanded;

  ExpPanel(
      {required this.addNewCourse,
      required this.deleteCourse,
      required this.expanded,
      required this.editCourse,
      required this.clearSem}) {}

  ExpansionPanel Sem1(SemData value) {
    return ExpansionPanel(
      backgroundColor: Colors.yellow.shade200,
      headerBuilder: (context, isOpen) {
        return Padding(
          padding: const EdgeInsets.all(15.0),
          child: Text(
            "1-1 \t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t SGPA:" +
                value.getSemList()[0].calcGPA(),
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
        );
      },
      body: Column(
        children: [
          Divider(
            height: 1,
          ),
          Container(
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Text("Credits used:\t\t" +
                      value.getSemList()[0].creditCalc().toString()),
                ),
                TextButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.black),
                  ),
                  onPressed: () => addNewCourse(0),
                  child: Center(
                    child: Row(
                      children: [
                        Icon(
                          Icons.add,
                          color: Colors.yellow.shade100,
                        ),
                        Text(
                          "COURSE",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextButton(
                    onPressed: () => clearSem(0),
                    child: Row(
                      children: [
                        Icon(
                          Icons.clear,
                          color: Colors.red,
                        ),
                        Text(
                          "CLEAR SEM",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.black),
                    ),
                  ),
                )
              ],
            ),
          ),
          Divider(
            thickness: 1,
            height: 1,
          ),
          Container(
            color: Colors.yellow.shade100,
            child: ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: value.getSemList()[0].getCourseList().length,
              itemBuilder: (context2, index) => CourseTile(
                name: value.getSemList()[0].getCourseList()[index].name,
                grade: value.getSemList()[0].getCourseList()[index].grade,
                sem: "1-1",
                credits: value.getSemList()[0].getCourseList()[index].credits,
                code: value.getSemList()[0].getCourseList()[index].code,
                editTapped: (p0) {
                  editCourse(value.getSemList()[0].getCourseList()[index]);
                },
                deleteTapped: (p0) {
                  deleteCourse(value.getSemList()[0].getCourseList()[index]);
                },
              ),
            ),
          ),
        ],
      ),
      isExpanded: expanded,
      canTapOnHeader: true,
    );
  }

  ExpansionPanel Sem2(SemData value) {
    return ExpansionPanel(
      backgroundColor: Colors.yellow.shade200,
      headerBuilder: (context, isOpen) {
        return Padding(
          padding: const EdgeInsets.all(15.0),
          child: Text(
            "1-2 \t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t SGPA:" +
                value.getSemList()[1].calcGPA(),
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
        );
      },
      body: Column(
        children: [
          Divider(
            height: 1,
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Text("Credits used:\t\t" +
                    value.getSemList()[1].creditCalc().toString()),
              ),
              TextButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.black),
                ),
                onPressed: () => addNewCourse(1),
                child: Center(
                  child: Row(
                    children: [
                      Icon(
                        Icons.add,
                        color: Colors.yellow.shade100,
                      ),
                      Text(
                        "COURSE",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextButton(
                  onPressed: () => clearSem(1),
                  child: Row(
                    children: [
                      Icon(
                        Icons.clear,
                        color: Colors.red,
                      ),
                      Text(
                        "CLEAR SEM",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.black),
                  ),
                ),
              )
            ],
          ),
          Divider(
            thickness: 1,
            height: 1,
          ),
          Container(
            color: Colors.yellow.shade100,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: value.getSemList()[1].getCourseList().length,
              itemBuilder: (context2, index) => CourseTile(
                name: value.getSemList()[1].getCourseList()[index].name,
                grade: value.getSemList()[1].getCourseList()[index].grade,
                sem: "1-1",
                credits: value.getSemList()[1].getCourseList()[index].credits,
                code: value.getSemList()[1].getCourseList()[index].code,
                editTapped: (p0) {
                  editCourse(value.getSemList()[1].getCourseList()[index]);
                },
                deleteTapped: (p0) {
                  deleteCourse(value.getSemList()[1].getCourseList()[index]);
                },
              ),
            ),
          ),
        ],
      ),
      isExpanded: expanded,
      canTapOnHeader: true,
    );
  }

  ExpansionPanel Sem3(SemData value) {
    return ExpansionPanel(
      backgroundColor: Colors.yellow.shade200,
      headerBuilder: (context, isOpen) {
        return Padding(
          padding: const EdgeInsets.all(15.0),
          child: Text(
            "2-1 \t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t SGPA:" +
                value.getSemList()[2].calcGPA(),
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
        );
      },
      body: Column(
        children: [
          Divider(
            height: 1,
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Text("Credits used:\t\t" +
                    value.getSemList()[2].creditCalc().toString()),
              ),
              TextButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.black),
                ),
                onPressed: () => addNewCourse(2),
                child: Center(
                  child: Row(
                    children: [
                      Icon(
                        Icons.add,
                        color: Colors.yellow.shade100,
                      ),
                      Text(
                        "COURSE",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextButton(
                  onPressed: () => clearSem(2),
                  child: Row(
                    children: [
                      Icon(
                        Icons.clear,
                        color: Colors.red,
                      ),
                      Text(
                        "CLEAR SEM",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.black),
                  ),
                ),
              )
            ],
          ),
          Divider(
            thickness: 1,
            height: 1,
          ),
          Container(
            color: Colors.yellow.shade100,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: value.getSemList()[2].getCourseList().length,
              itemBuilder: (context2, index) => CourseTile(
                name: value.getSemList()[2].getCourseList()[index].name,
                grade: value.getSemList()[2].getCourseList()[index].grade,
                sem: "2-1",
                credits: value.getSemList()[2].getCourseList()[index].credits,
                code: value.getSemList()[2].getCourseList()[index].code,
                editTapped: (p0) {
                  editCourse(value.getSemList()[2].getCourseList()[index]);
                },
                deleteTapped: (p0) {
                  deleteCourse(value.getSemList()[2].getCourseList()[index]);
                },
              ),
            ),
          ),
        ],
      ),
      isExpanded: expanded,
      canTapOnHeader: true,
    );
  }

  ExpansionPanel Sem4(SemData value) {
    return ExpansionPanel(
      backgroundColor: Colors.yellow.shade200,
      headerBuilder: (context, isOpen) {
        return Padding(
          padding: const EdgeInsets.all(15.0),
          child: Text(
            "2-2 \t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t SGPA:" +
                value.getSemList()[3].calcGPA(),
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
        );
      },
      body: Column(
        children: [
          Divider(
            height: 1,
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Text("Credits used:\t\t" +
                    value.getSemList()[3].creditCalc().toString()),
              ),
              TextButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.black),
                ),
                onPressed: () => addNewCourse(3),
                child: Center(
                  child: Row(
                    children: [
                      Icon(
                        Icons.add,
                        color: Colors.yellow.shade100,
                      ),
                      Text(
                        "COURSE",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextButton(
                  onPressed: () => clearSem(3),
                  child: Row(
                    children: [
                      Icon(
                        Icons.clear,
                        color: Colors.red,
                      ),
                      Text(
                        "CLEAR SEM",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.black),
                  ),
                ),
              )
            ],
          ),
          Divider(
            thickness: 1,
            height: 1,
          ),
          Container(
            color: Colors.yellow.shade100,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: value.getSemList()[3].getCourseList().length,
              itemBuilder: (context2, index) => CourseTile(
                name: value.getSemList()[3].getCourseList()[index].name,
                grade: value.getSemList()[3].getCourseList()[index].grade,
                sem: "2-2",
                credits: value.getSemList()[3].getCourseList()[index].credits,
                code: value.getSemList()[3].getCourseList()[index].code,
                editTapped: (p0) {
                  editCourse(value.getSemList()[3].getCourseList()[index]);
                },
                deleteTapped: (p0) {
                  deleteCourse(value.getSemList()[3].getCourseList()[index]);
                },
              ),
            ),
          ),
        ],
      ),
      isExpanded: expanded,
      canTapOnHeader: true,
    );
  }

  ExpansionPanel Sem5(SemData value) {
    return ExpansionPanel(
      backgroundColor: Colors.yellow.shade200,
      headerBuilder: (context, isOpen) {
        return Padding(
          padding: const EdgeInsets.all(15.0),
          child: Text(
            "3-1 \t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t SGPA:" +
                value.getSemList()[4].calcGPA(),
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
        );
      },
      body: Column(
        children: [
          Divider(
            height: 1,
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Text("Credits used:\t\t" +
                    value.getSemList()[4].creditCalc().toString()),
              ),
              TextButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.black),
                ),
                onPressed: () => addNewCourse(4),
                child: Center(
                  child: Row(
                    children: [
                      Icon(
                        Icons.add,
                        color: Colors.yellow.shade100,
                      ),
                      Text(
                        "COURSE",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextButton(
                  onPressed: () => clearSem(4),
                  child: Row(
                    children: [
                      Icon(
                        Icons.clear,
                        color: Colors.red,
                      ),
                      Text(
                        "CLEAR SEM",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.black),
                  ),
                ),
              )
            ],
          ),
          Divider(
            thickness: 1,
            height: 1,
          ),
          Container(
            color: Colors.yellow.shade100,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: value.getSemList()[4].getCourseList().length,
              itemBuilder: (context2, index) => CourseTile(
                name: value.getSemList()[4].getCourseList()[index].name,
                grade: value.getSemList()[4].getCourseList()[index].grade,
                sem: "3-1",
                credits: value.getSemList()[4].getCourseList()[index].credits,
                code: value.getSemList()[4].getCourseList()[index].code,
                editTapped: (p0) {
                  editCourse(value.getSemList()[4].getCourseList()[index]);
                },
                deleteTapped: (p0) {
                  deleteCourse(value.getSemList()[4].getCourseList()[index]);
                },
              ),
            ),
          ),
        ],
      ),
      isExpanded: expanded,
      canTapOnHeader: true,
    );
  }

  ExpansionPanel Sem6(SemData value) {
    return ExpansionPanel(
      backgroundColor: Colors.yellow.shade200,
      headerBuilder: (context, isOpen) {
        return Padding(
          padding: const EdgeInsets.all(15.0),
          child: Text(
            "3-2 \t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t SGPA:" +
                value.getSemList()[5].calcGPA(),
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
        );
      },
      body: Column(
        children: [
          Divider(
            height: 1,
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Text("Credits used:\t\t" +
                    value.getSemList()[5].creditCalc().toString()),
              ),
              TextButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.black),
                ),
                onPressed: () => addNewCourse(5),
                child: Center(
                  child: Row(
                    children: [
                      Icon(
                        Icons.add,
                        color: Colors.yellow.shade100,
                      ),
                      Text(
                        "COURSE",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextButton(
                  onPressed: () => clearSem(5),
                  child: Row(
                    children: [
                      Icon(
                        Icons.clear,
                        color: Colors.red,
                      ),
                      Text(
                        "CLEAR SEM",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.black),
                  ),
                ),
              )
            ],
          ),
          Divider(
            thickness: 1,
            height: 1,
          ),
          Container(
            color: Colors.yellow.shade100,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: value.getSemList()[5].getCourseList().length,
              itemBuilder: (context2, index) => CourseTile(
                name: value.getSemList()[5].getCourseList()[index].name,
                grade: value.getSemList()[5].getCourseList()[index].grade,
                sem: "3-1",
                credits: value.getSemList()[5].getCourseList()[index].credits,
                code: value.getSemList()[5].getCourseList()[index].code,
                editTapped: (p0) {
                  editCourse(value.getSemList()[5].getCourseList()[index]);
                },
                deleteTapped: (p0) {
                  deleteCourse(value.getSemList()[5].getCourseList()[index]);
                },
              ),
            ),
          ),
        ],
      ),
      isExpanded: expanded,
      canTapOnHeader: true,
    );
  }

  ExpansionPanel Sem7(SemData value) {
    return ExpansionPanel(
      backgroundColor: Colors.yellow.shade200,
      headerBuilder: (context, isOpen) {
        return Padding(
          padding: const EdgeInsets.all(15.0),
          child: Text(
            "4-1 \t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t SGPA:" +
                value.getSemList()[6].calcGPA(),
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
        );
      },
      body: Column(
        children: [
          Divider(
            height: 1,
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Text("Credits used:\t\t" +
                    value.getSemList()[6].creditCalc().toString()),
              ),
              TextButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.black),
                ),
                onPressed: () => addNewCourse(6),
                child: Center(
                  child: Row(
                    children: [
                      Icon(
                        Icons.add,
                        color: Colors.yellow.shade100,
                      ),
                      Text(
                        "COURSE",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextButton(
                  onPressed: () => clearSem(6),
                  child: Row(
                    children: [
                      Icon(
                        Icons.clear,
                        color: Colors.red,
                      ),
                      Text(
                        "CLEAR SEM",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.black),
                  ),
                ),
              )
            ],
          ),
          Divider(
            thickness: 1,
            height: 1,
          ),
          Container(
            color: Colors.yellow.shade100,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: value.getSemList()[6].getCourseList().length,
              itemBuilder: (context2, index) => CourseTile(
                name: value.getSemList()[6].getCourseList()[index].name,
                grade: value.getSemList()[6].getCourseList()[index].grade,
                sem: "3-1",
                credits: value.getSemList()[6].getCourseList()[index].credits,
                code: value.getSemList()[6].getCourseList()[index].code,
                editTapped: (p0) {
                  editCourse(value.getSemList()[6].getCourseList()[index]);
                },
                deleteTapped: (p0) {
                  deleteCourse(value.getSemList()[6].getCourseList()[index]);
                },
              ),
            ),
          ),
        ],
      ),
      isExpanded: expanded,
      canTapOnHeader: true,
    );
  }

  ExpansionPanel Sem8(SemData value) {
    return ExpansionPanel(
      backgroundColor: Colors.yellow.shade200,
      headerBuilder: (context, isOpen) {
        return Padding(
          padding: const EdgeInsets.all(15.0),
          child: Text(
            "4-2 \t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t SGPA:" +
                value.getSemList()[7].calcGPA(),
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
        );
      },
      body: Column(
        children: [
          Divider(
            height: 1,
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Text("Credits used:\t\t" +
                    value.getSemList()[7].creditCalc().toString()),
              ),
              TextButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.black),
                ),
                onPressed: () => addNewCourse(7),
                child: Center(
                  child: Row(
                    children: [
                      Icon(
                        Icons.add,
                        color: Colors.yellow.shade100,
                      ),
                      Text(
                        "COURSE",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextButton(
                  onPressed: () => clearSem(7),
                  child: Row(
                    children: [
                      Icon(
                        Icons.clear,
                        color: Colors.red,
                      ),
                      Text(
                        "CLEAR SEM",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.black),
                  ),
                ),
              )
            ],
          ),
          Divider(
            thickness: 1,
            height: 1,
          ),
          Container(
            color: Colors.yellow.shade100,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: value.getSemList()[7].getCourseList().length,
              itemBuilder: (context2, index) => CourseTile(
                name: value.getSemList()[7].getCourseList()[index].name,
                grade: value.getSemList()[7].getCourseList()[index].grade,
                sem: "3-1",
                credits: value.getSemList()[7].getCourseList()[index].credits,
                code: value.getSemList()[7].getCourseList()[index].code,
                editTapped: (p0) {
                  editCourse(value.getSemList()[7].getCourseList()[index]);
                },
                deleteTapped: (p0) {
                  deleteCourse(value.getSemList()[7].getCourseList()[index]);
                },
              ),
            ),
          ),
        ],
      ),
      isExpanded: expanded,
      canTapOnHeader: true,
    );
  }

  ExpansionPanel Sem9(SemData value) {
    return ExpansionPanel(
      backgroundColor: Colors.yellow.shade200,
      headerBuilder: (context, isOpen) {
        return Padding(
          padding: const EdgeInsets.all(15.0),
          child: Text(
            "5-1 \t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t SGPA:" +
                value.getSemList()[8].calcGPA(),
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
        );
      },
      body: Column(
        children: [
          Divider(
            height: 1,
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Text("Credits used:\t\t" +
                    value.getSemList()[8].creditCalc().toString()),
              ),
              TextButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.black),
                ),
                onPressed: () => addNewCourse(8),
                child: Center(
                  child: Row(
                    children: [
                      Icon(
                        Icons.add,
                        color: Colors.yellow.shade100,
                      ),
                      Text(
                        "COURSE",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextButton(
                  onPressed: () => clearSem(8),
                  child: Row(
                    children: [
                      Icon(
                        Icons.clear,
                        color: Colors.red,
                      ),
                      Text(
                        "CLEAR SEM",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.black),
                  ),
                ),
              )
            ],
          ),
          Divider(
            thickness: 1,
            height: 1,
          ),
          Container(
            color: Colors.yellow.shade100,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: value.getSemList()[8].getCourseList().length,
              itemBuilder: (context2, index) => CourseTile(
                name: value.getSemList()[8].getCourseList()[index].name,
                grade: value.getSemList()[8].getCourseList()[index].grade,
                sem: "3-1",
                credits: value.getSemList()[8].getCourseList()[index].credits,
                code: value.getSemList()[8].getCourseList()[index].code,
                editTapped: (p0) {
                  editCourse(value.getSemList()[8].getCourseList()[index]);
                },
                deleteTapped: (p0) {
                  deleteCourse(value.getSemList()[8].getCourseList()[index]);
                },
              ),
            ),
          ),
        ],
      ),
      isExpanded: expanded,
      canTapOnHeader: true,
    );
  }

  ExpansionPanel Sem10(SemData value) {
    return ExpansionPanel(
      backgroundColor: Colors.yellow.shade200,
      headerBuilder: (context, isOpen) {
        return Padding(
          padding: const EdgeInsets.all(15.0),
          child: Text(
            "5-2 \t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t SGPA:" +
                value.getSemList()[9].calcGPA(),
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
        );
      },
      body: Column(
        children: [
          Divider(
            height: 1,
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Text("Credits used:\t\t" +
                    value.getSemList()[9].creditCalc().toString()),
              ),
              TextButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.black),
                ),
                onPressed: () => addNewCourse(9),
                child: Center(
                  child: Row(
                    children: [
                      Icon(
                        Icons.add,
                        color: Colors.yellow.shade100,
                      ),
                      Text(
                        "COURSE",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextButton(
                  onPressed: () => clearSem(9),
                  child: Row(
                    children: [
                      Icon(
                        Icons.clear,
                        color: Colors.red,
                      ),
                      Text(
                        "CLEAR SEM",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.black),
                  ),
                ),
              )
            ],
          ),
          Divider(
            thickness: 1,
            height: 1,
          ),
          Container(
            color: Colors.yellow.shade100,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: value.getSemList()[9].getCourseList().length,
              itemBuilder: (context2, index) => CourseTile(
                name: value.getSemList()[9].getCourseList()[index].name,
                grade: value.getSemList()[9].getCourseList()[index].grade,
                sem: "3-1",
                credits: value.getSemList()[9].getCourseList()[index].credits,
                code: value.getSemList()[9].getCourseList()[index].code,
                editTapped: (p0) {
                  editCourse(value.getSemList()[9].getCourseList()[index]);
                },
                deleteTapped: (p0) {
                  deleteCourse(value.getSemList()[9].getCourseList()[index]);
                },
              ),
            ),
          ),
        ],
      ),
      isExpanded: expanded,
      canTapOnHeader: true,
    );
  }
}
