import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

class AdminReport extends StatefulWidget {
  const AdminReport({super.key});

  @override
  State<AdminReport> createState() => _AdminReportState();
}

class _AdminReportState extends State<AdminReport> {
  DateFormat dateFormat = DateFormat('yyyy-MM-dd');
  TextEditingController fromController = TextEditingController();
  TextEditingController toController = TextEditingController();
  TimeOfDay? timeOfDay;
  DateTime? pickedDate;
  TimeOfDay? timePicked;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {},
                child: Text('Home'),
              ),
              TextButton(
                onPressed: () {},
                child: Text('Add user'),
              ),
              TextButton(
                onPressed: () {},
                child: Text('Manage user'),
              ),
              TextButton(
                onPressed: () {},
                child: Text('Report'),
              )
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 200,
                height: 60,
                child: TextField(
                  onTap: datePicker,
                  readOnly: true,
                  controller: fromController,
                  decoration: InputDecoration(
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade400),
                    ),
                    fillColor: Colors.grey.shade200,
                    filled: true,
                    hintText: 'from',
                    suffixIcon: const Icon(Icons.arrow_downward),
                    hintStyle: TextStyle(
                      color: Colors.grey[500],
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 7,
              ),
              SizedBox(
                width: 200,
                height: 60,
                child: TextField(
                  onTap: toDatePicker,
                  readOnly: true,
                  controller: toController,
                  decoration: InputDecoration(
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade400),
                    ),
                    fillColor: Colors.grey.shade200,
                    filled: true,
                    hintText: 'to',
                    suffixIcon: const Icon(Icons.arrow_downward),
                    hintStyle: TextStyle(
                      color: Colors.grey[500],
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 5,
              ),
              TextButton(
                onPressed: () {},
                child: Text('Go'),
              )
            ],
          ),
        ],
      ),
    );
  }

  Future<void> datePicker() async {
    var fistDate = DateTime(2020, 1, 1);
    var lastDate = DateTime.now();

    await showDatePicker(
      context: context,
      initialDate: fistDate,
      firstDate: fistDate,
      lastDate: lastDate,
    ).then(
      (value) => setState(() {
        fromController.text = dateFormat.format(value!);
      }),
    );
  }

  Future<void> toDatePicker() async {
    var fistDate = DateTime(2020, 1, 1);
    var lastDate = DateTime.now();

    await showDatePicker(
      context: context,
      initialDate: fistDate,
      firstDate: fistDate,
      lastDate: lastDate,
    ).then(
      (value) => setState(() {
        toController.text = dateFormat.format(value!);
      }),
    );
  }
}
