import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
export 'user_profile.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  final dataMap = <String, double>{
    "": 26,
  };

  final colorList = <Color>[
    Color.fromARGB(200, 108, 123, 149),
  ];

  int completedTasks = 26;

  bool switchVal = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(
                  context); // This will pop the current route off the navigator stack
            },
          ),
          title: Text(
            "Profile",
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Center(
              child: Container(
                width: 500,
                child: Column(
                  children: [
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Ahmad Mahmoud",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "ahmadmahmoud@gmail.com",
                      style: TextStyle(color: Colors.grey),
                    ),
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.fromLTRB(20, 10, 0, 10),
                          child: SizedBox(
                            width: 190,
                            height: 120,
                            child: PieChart(
                              dataMap: dataMap,
                              chartType: ChartType.ring,
                              baseChartColor: Colors.black,
                              colorList: colorList,
                              chartValuesOptions: ChartValuesOptions(
                                showChartValuesInPercentage: true,
                              ),
                              totalValue: 50,
                            ),
                          ),
                        ),
                        Text(
                          completedTasks > 25
                              ? "Since the start of the week you have\ncompleted $completedTasks task(s), Fantastic work!\nyou're making impressive strides.\nkeep it up!"
                              : "Since the start of the week you have\ncompleted $completedTasks task(s), You can do better.",
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 30,
                        ),
                        Text(
                          "All time progress",
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 120,
                          height: 120,
                          margin: EdgeInsets.all(10),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: Color.fromARGB(200, 108, 123, 149),
                              border: Border.all(
                                  color: const Color.fromARGB(200, 108, 123, 149)),
                              borderRadius: BorderRadius.all(Radius.circular(20))),
                          child: Text(
                            "Completed\n     Tasks\n        $completedTasks",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        Container(
                          width: 120,
                          height: 120,
                          margin: EdgeInsets.fromLTRB(10, 5, 0, 5),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: Color.fromARGB(200, 108, 123, 149),
                              border: Border.all(
                                  color: const Color.fromARGB(200, 108, 123, 149)),
                              borderRadius: BorderRadius.all(Radius.circular(20))),
                          child: Text(
                            "In Progress\n     Tasks\n        $completedTasks",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        Container(
                          width: 120,
                          height: 120,
                          margin: EdgeInsets.all(10),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: Color.fromARGB(200, 108, 123, 149),
                              border: Border.all(
                                  color: const Color.fromARGB(200, 108, 123, 149)),
                              borderRadius: BorderRadius.all(Radius.circular(20))),
                          child: Text(
                            "Pending\n  Tasks\n     $completedTasks",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 20,
                        ),
                        Text("Profile Information"),
                        SizedBox(
                          width: 210,
                        ),
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/profile/edit');
                            },
                            child: Text(
                              "Edite Information",
                              style: TextStyle(
                                  color: Color.fromARGB(199, 105, 155, 240)),
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 20,
                        ),
                        Text("Close-Call reminder"),
                        SizedBox(
                          width: 240,
                        ),
                        Switch(
                            value: switchVal,
                            onChanged: (bool newSwitchVal) {
                              setState(() {
                                switchVal = newSwitchVal;
                              });
                            }),
                      ],
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 10.0, left: 35.0, right: 35.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                          labelText: "Name",
                          hintText: "Ahmad Mahmoud",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15)),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 10.0, left: 35.0, right: 35.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                          labelText: "Email",
                          hintText: "ahmadmahmoud@gmail.com",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15)),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 10.0, left: 35.0, right: 35.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                          labelText: "Password",
                          hintText: "Password",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15)),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 20,
                        ),
                        Align(
                          child: TextButton(
                            onPressed: () {},
                            child: Text(
                              "Log out",
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                        SizedBox(height: 70,)
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
