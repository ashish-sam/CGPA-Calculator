import 'package:finalapp/components/course_tile.dart';
import 'package:finalapp/components/exp_panel.dart';
import 'package:finalapp/data/course_data.dart';
import 'package:finalapp/data/sem_data.dart';
import 'package:finalapp/models/course_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final nameController = TextEditingController();
  final creditController = TextEditingController();
  final codeController = TextEditingController();
  int gradePoint = 0;
  int? newValue;

  void addNewCourse(int indexSem) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: const Text("Add new course"),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: TextField(
                          controller: nameController,
                          textCapitalization: TextCapitalization.words,
                          decoration:
                              const InputDecoration(hintText: "Course Title"),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        flex: 1,
                        child: TextField(
                          controller: codeController,
                          textCapitalization: TextCapitalization.characters,
                          decoration: const InputDecoration(hintText: "Code"),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: creditController,
                          keyboardType: TextInputType.number,
                          decoration:
                              const InputDecoration(hintText: "Course Credits"),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: DropdownButtonFormField<int>(
                          decoration: const InputDecoration(hintText: "Grade"),
                          value: gradePoint,
                          icon: const Icon(Icons.arrow_drop_down),
                          onChanged: (newValue) {
                            setState(() {
                              gradePoint = newValue!;
                            });
                          },
                          items: const [
                            DropdownMenuItem<int>(
                                value: 0, child: Text("Grade")),
                            DropdownMenuItem<int>(value: 10, child: Text("A")),
                            DropdownMenuItem<int>(value: 9, child: Text("A-")),
                            DropdownMenuItem<int>(value: 8, child: Text("B")),
                            DropdownMenuItem<int>(value: 7, child: Text("B-")),
                            DropdownMenuItem<int>(value: 6, child: Text("C")),
                            DropdownMenuItem<int>(value: 5, child: Text("C-")),
                            DropdownMenuItem<int>(value: 4, child: Text("D")),
                            DropdownMenuItem<int>(value: 3, child: Text("E")),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
              actions: [
                MaterialButton(
                  onPressed: cancel,
                  child: const Text("Cancel"),
                ),
                MaterialButton(
                  onPressed: () => save(indexSem),
                  child: const Text("Save"),
                ),
              ],
            ));
  }

  void deleteCourse(CourseItem course) {
    Provider.of<SemData>(context, listen: false)
        .getSemList()[course.semIndex]
        .deleteCourse(course);
    setState(() {});
  }

  void editCourse(CourseItem course) {
    final nameEditController = TextEditingController(text: course.name);
    final codeEditController = TextEditingController(text: course.code);
    final creditEditController =
        TextEditingController(text: course.credits.toString());

    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text("Edit course"),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: TextField(
                          controller: nameEditController,
                          textCapitalization: TextCapitalization.words,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        flex: 1,
                        child: TextField(
                          controller: codeEditController,
                          textCapitalization: TextCapitalization.characters,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: creditEditController,
                          keyboardType: TextInputType.number,
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: DropdownButtonFormField<int>(
                          decoration: const InputDecoration(hintText: "Grade"),
                          value: gradePoint = course.grade,
                          icon: const Icon(Icons.arrow_drop_down),
                          onChanged: (newValue) {
                            setState(() {
                              gradePoint = newValue!;
                            });
                          },
                          items: const [
                            DropdownMenuItem<int>(
                                value: 0, child: Text("Grade")),
                            DropdownMenuItem<int>(value: 10, child: Text("A")),
                            DropdownMenuItem<int>(value: 9, child: Text("A-")),
                            DropdownMenuItem<int>(value: 8, child: Text("B")),
                            DropdownMenuItem<int>(value: 7, child: Text("B-")),
                            DropdownMenuItem<int>(value: 6, child: Text("C")),
                            DropdownMenuItem<int>(value: 5, child: Text("C-")),
                            DropdownMenuItem<int>(value: 4, child: Text("D")),
                            DropdownMenuItem<int>(value: 3, child: Text("E")),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              actions: [
                MaterialButton(
                  onPressed: cancel,
                  child: const Text("Cancel"),
                ),
                MaterialButton(
                  onPressed: () => editSave(
                      course,
                      nameEditController.text,
                      codeEditController.text,
                      int.parse(creditEditController.text),
                      gradePoint),
                  child: const Text("Save"),
                ),
              ],
            ));
  }

  void editSave(CourseItem course, String name, String code, int credits,
      int gradePoint) {
    print("course editing khula toh hai");
    int courseIndex = Provider.of<SemData>(context, listen: false)
        .getSemList()[course.semIndex]
        .getCourseList()
        .indexOf(course);
    print("courseindex is" + courseIndex.toString());
    course.grade = gradePoint;
    course.name = name;
    course.code = code;
    course.credits = credits;
    Provider.of<SemData>(context, listen: false)
        .getSemList()[course.semIndex]
        .getCourseList()[courseIndex] = course;
    setState(() {});
    Navigator.pop(context);
  }

  void save(int indexSem) {
    CourseItem newCourse = CourseItem(
        name: nameController.text,
        credits: int.parse(creditController.text),
        grade: gradePoint,
        semIndex: indexSem,
        code: codeController.text);
    Provider.of<SemData>(context, listen: false)
        .getSemList()[newCourse.semIndex]
        .addNewCourse(newCourse);
    setState(() {});
    Navigator.pop(context);
    clear();
  }

  void cancel() {
    Navigator.pop(context);
    clear();
  }

  void clear() {
    nameController.clear();
    gradePoint = 0;
    creditController.clear();
    codeController.clear();
  }

  void clearSem(int semIndex) {
    Provider.of<SemData>(context, listen: false)
        .getSemList()[semIndex]
        .clearSem();
    setState(() {});
  }

  void showInfo() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
          title: Text("How to use this App:"),
          content: Container(
            height: 300,
            child: Column(
              children: [
                Text(
                    "Tap on any semester (e.g. \"2-1\") to open the list of courses in that semester.\n\nTap on \"+COURSE\" to add a course to that semester and \"CLEAR SEM\" to remove all courses from that semester.\n "),
                Text(
                    "Slide any course tile towards the left to access the edit course and delete course buttons.")
              ],
            ),
          ),
          actions: [
            MaterialButton(
              child: Text("OK, got it"),
              onPressed: cancel,
            )
          ]),
    );
  }

  List<bool> expanded = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<SemData>(
        builder: (context, value, child) => SafeArea(
              child: Scaffold(
                backgroundColor: Color.fromARGB(255, 40, 40, 70),
                appBar: AppBar(
                  title: const Center(
                    child: Text(
                      'CGPA Calculator',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFFFF59D),
                      ),
                    ),
                  ),
                  backgroundColor: Color.fromARGB(255, 25, 25, 55),
                  elevation: 0,
                ),
                floatingActionButton: FloatingActionButton(
                  elevation: 0,
                  backgroundColor: Colors.black,
                  onPressed: showInfo,
                  child: const Icon(Icons.info_outline_rounded),
                ),
                body: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        child: Text(
                          "CGPA:\t\t\t" + value.functionCGPA(),
                          style: const TextStyle(
                            fontSize: 50,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Container(
                        child: Text(
                          "Total credits used:\t\t" +
                              value.creditSum().toString(),
                          style: const TextStyle(
                            fontSize: 25,
                            color: Color(0xFFFFF59D),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ExpansionPanelList(
                          elevation: 1,
                          expansionCallback: (panelIndex, isClosed) {
                            setState(() {
                              expanded[panelIndex] = isClosed;
                            });
                          },
                          children: [
                            ExpPanel(
                                    addNewCourse: addNewCourse,
                                    deleteCourse: deleteCourse,
                                    clearSem: clearSem,
                                    editCourse: editCourse,
                                    expanded: expanded[0])
                                .Sem1(value),
                            ExpPanel(
                                    addNewCourse: addNewCourse,
                                    deleteCourse: deleteCourse,
                                    clearSem: clearSem,
                                    editCourse: editCourse,
                                    expanded: expanded[1])
                                .Sem2(value),
                            ExpPanel(
                                    addNewCourse: addNewCourse,
                                    deleteCourse: deleteCourse,
                                    clearSem: clearSem,
                                    editCourse: editCourse,
                                    expanded: expanded[2])
                                .Sem3(value),
                            ExpPanel(
                                    addNewCourse: addNewCourse,
                                    deleteCourse: deleteCourse,
                                    clearSem: clearSem,
                                    editCourse: editCourse,
                                    expanded: expanded[3])
                                .Sem4(value),
                            ExpPanel(
                                    addNewCourse: addNewCourse,
                                    deleteCourse: deleteCourse,
                                    clearSem: clearSem,
                                    editCourse: editCourse,
                                    expanded: expanded[4])
                                .Sem5(value),
                            ExpPanel(
                                    addNewCourse: addNewCourse,
                                    deleteCourse: deleteCourse,
                                    clearSem: clearSem,
                                    editCourse: editCourse,
                                    expanded: expanded[5])
                                .Sem6(value),
                            ExpPanel(
                                    addNewCourse: addNewCourse,
                                    deleteCourse: deleteCourse,
                                    clearSem: clearSem,
                                    editCourse: editCourse,
                                    expanded: expanded[6])
                                .Sem7(value),
                            ExpPanel(
                                    addNewCourse: addNewCourse,
                                    deleteCourse: deleteCourse,
                                    clearSem: clearSem,
                                    editCourse: editCourse,
                                    expanded: expanded[7])
                                .Sem8(value),
                            ExpPanel(
                                    addNewCourse: addNewCourse,
                                    deleteCourse: deleteCourse,
                                    clearSem: clearSem,
                                    editCourse: editCourse,
                                    expanded: expanded[8])
                                .Sem9(value),
                            ExpPanel(
                                    addNewCourse: addNewCourse,
                                    deleteCourse: deleteCourse,
                                    clearSem: clearSem,
                                    editCourse: editCourse,
                                    expanded: expanded[9])
                                .Sem10(value),
                          ],
                        ),
                      ),
                      Text(
                        "Made with ❤️ by Ashish Sam",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ));
  }
}
