import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  final String title;
  final String company;
  final String location;
  final String salary;

  const DetailScreen({
    super.key,
    required this.title,
    required this.company,
    required this.location,
    required this.salary,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Detail Internship")),

      body: Padding(
        padding: EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Text(
              title,
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 20),

            Text(company, style: TextStyle(fontSize: 20)),

            SizedBox(height: 10),

            Text(location, style: TextStyle(fontSize: 20)),

            SizedBox(height: 10),

            Text(salary, style: TextStyle(fontSize: 20)),
          ],
        ),
      ),
    );
  }
}
