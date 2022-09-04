import 'dart:developer';

import 'package:employment_app/model/employee.dart';
import 'package:employment_app/utilities/size_config.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final empRef = FirebaseDatabase.instance.ref('Employees');

  List<Employee>? employeeList;
  DateTime? dateTimeNow;

  @override
  void initState() {
    employeeList = [];
    dateTimeNow = DateTime.now();
    empRef.onValue.listen((event) {
      if (event.snapshot.exists) {
        Map map = event.snapshot.value as Map;
        map.forEach((key, value) {
          if (value != null) {
            Employee employee = Employee.fromMap(value, key);
            setState(() {
              employeeList!.add(employee);
            });
          }
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(appBar: makeAppbar(), body: makeBody());
  }

  makeAppbar() {
    return AppBar(
        centerTitle: true,
        title: Text(
          'Employees List',
        ));
  }

  makeBody() {
    log(dateTimeNow!.year.toString());
    return ListView.builder(
      itemCount: employeeList!.length,
      itemBuilder: (context, index) {
        Employee employee = employeeList![index];
        return ListTile(
          title: Text(employee.name!),
          subtitle: Text('Age: ${employee.age.toString()}'),
          trailing: dateTimeNow!.year - employee.since! >= 5 &&
                  employee.isActive == true
              ? const Icon(
                  Icons.flag,
                  color: Colors.green,
                )
              : const SizedBox(),
        );
      },
    );
  }
}
