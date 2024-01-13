import 'package:flutter/material.dart';
export 'create_task.dart';

class CreateTask extends StatefulWidget {
  const CreateTask({super.key});

  @override
  State<CreateTask> createState() => _CreateTaskState();
}



class _CreateTaskState extends State<CreateTask> {
  var _formKey = GlobalKey<FormState>();

  TextEditingController dateController = TextEditingController();
  TextEditingController myController = TextEditingController();
  DateTime selectedDate = DateTime.now();
 
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2050),
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      
        dateController.text = '${picked.month}/${picked.day}/${picked.year}';
      });
    }
  }

  @override
   void initState() {
    super.initState();
    
    dateController.text = '${selectedDate.month}/${selectedDate.day}/${selectedDate.year}';
  }
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
            "Create a Task",
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0.0,
        ),
        body: Form(
          key: _formKey,
          child: Center(
            child: Container(
              width: 500,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(40, 20, 40, 0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: "Task Name",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Task name can't be empty.";
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(40, 20, 40, 0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: "Add a description",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 70, horizontal: 10),
                      ),
                    ),
                  ),
                  // Padding(
                  //   padding: EdgeInsets.fromLTRB(40, 20, 40, 0),
                  //   child: TextFormField(
                  //     decoration: InputDecoration(
                  //       hintText: "Upload files",
                  //       border: OutlineInputBorder(
                  //         borderRadius: BorderRadius.circular(15),
                  //       ),
                  //       suffixIcon: IconButton(
                  //         icon: Icon(Icons.upload),
                  //         onPressed: () {},
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(40, 20, 40, 0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: "Select workspace",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(Icons.keyboard_arrow_down),
                          onPressed: () {},
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(40, 10, 40, 0),
                        child: Text(
                          'Set a deadline',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(120, 0, 40, 0),
                          child: TextFormField(
                              controller: dateController,
                            decoration: InputDecoration(
                             // hintText: '08/12/2024',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12.0),
                                borderSide: BorderSide(color: Colors.black),
                              ),
                              suffixIcon: IconButton(
                                icon: Icon(Icons.calendar_month),
                                onPressed: () =>
                                    _selectDate(context), // Pass the context
                              ),
                              contentPadding: EdgeInsets.all(16.0),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(40, 10, 62, 0),
                        child: Text(
                          'Task State',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(120, 0, 40, 0),
                          child: DropdownButtonFormField<String>(
                            decoration: InputDecoration(
                              hintText: 'Pending',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12.0),
                                borderSide: BorderSide(color: Colors.black),
                              ),
                              contentPadding: EdgeInsets.all(16.0),
                            ),
                            value: 'Pending',
                            onChanged: (newValue) {
                              print(newValue);
                            },
                            items: [
                              DropdownMenuItem(
                                value: 'Completed',
                                child: Text('Completed'),
                              ),
                              DropdownMenuItem(
                                value: 'In Progress',
                                child: Text('In Progress'),
                              ),
                              DropdownMenuItem(
                                value: 'Pending',
                                child: Text('Pending'),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Pick a color"),
                        Row(
                          children: [
                            ElevatedButton(
                              onPressed: () {},
                              child: CircularContainer(
                                backgroundColor: Colors.red,
                              ),
                              style: ElevatedButton.styleFrom(
                                  padding: EdgeInsets.zero,
                                  shape: CircleBorder()),
                            ),
                            ElevatedButton(
                              onPressed: () {},
                              child: CircularContainer(
                                backgroundColor: Colors.blue,
                              ),
                              style: ElevatedButton.styleFrom(
                                  padding: EdgeInsets.zero,
                                  shape: CircleBorder()),
                            ),
                            ElevatedButton(
                              onPressed: () {},
                              child: CircularContainer(
                                backgroundColor: Colors.green,
                              ),
                              style: ElevatedButton.styleFrom(
                                  padding: EdgeInsets.zero,
                                  shape: CircleBorder()),
                            ),
                            ElevatedButton(
                              onPressed: () {},
                              child: CircularContainer(
                                backgroundColor: Colors.grey,
                              ),
                              style: ElevatedButton.styleFrom(
                                  padding: EdgeInsets.zero,
                                  shape: CircleBorder()),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // if (_formKey.currentState!.validate()) {
                      //   var sb = SnackBar(content: Text("${myController.text}"));
                      //   ScaffoldMessenger.of(context).showSnackBar(sb);
                      // }
                      Navigator.pushNamed(context, '/home');
                    },
                    child: Text(
                      "Create Taskes",
                      style: TextStyle(
                          fontWeight: FontWeight.w100,
                          fontSize: 16,
                          color: Colors.white),
                    ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Color.fromARGB(
                              200, 108, 123, 149)), // Change button color
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              15.0), // Change corner radius
                        ),
                      ),

                      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                        EdgeInsets.symmetric(vertical: 20.0, horizontal: 160.0),
                        // Adjust size by changing the values
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CircularContainer extends StatelessWidget {
  final Color backgroundColor;

  CircularContainer({required this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 16.0,
      width: 16.0,
      margin: EdgeInsets.symmetric(horizontal: 4.0),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: Colors.white,
          width: 3.0,
        ),
        color: backgroundColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 4,
            offset: Offset(0, 2), // changes the shadow direction
          ),
        ],
      ),
    );
  }
}
