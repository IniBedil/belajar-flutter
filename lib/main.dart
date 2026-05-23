import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Map<String, dynamic>> internships = [
    {
      "title": "Frontend Developer",
      "company": "Google",
      "location": "Remote",
      "salary": "5 JT / month",
      "color": Colors.blue,
      "icon": Icons.web,
    },

    {
      "title": "Backend Developer",
      "company": "Tokopedia",
      "location": "Jakarta",
      "salary": "5 JT / month",
      "color": Colors.green,
      "icon": Icons.storage,
    },

    {
      "title": "UI/UX Designer",
      "company": "Shopee",
      "location": "Bandung",
      "salary": "5 JT / month",
      "color": Colors.purple,
      "icon": Icons.palette,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ListView.builder(
          itemCount: internships.length,

          itemBuilder: (context, index) {
            return JobCard(
              title: internships[index]["title"]!,
              company: internships[index]["company"]!,
              location: internships[index]["location"]!,
              salary: internships[index]["salary"]!,
              color: internships[index]["color"],
              icon: internships[index]["icon"],
            );
          },
        ),
      ),
    );
  }
}

class JobCard extends StatelessWidget {
  final String title;
  final String company;
  final String location;
  final String salary;
  final Color color;
  final IconData icon;

  const JobCard({
    super.key,
    required this.title,
    required this.company,
    required this.location,
    required this.salary,
    required this.color,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text("Kamu memilih $title")));
      },

      child: Container(
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(20),

        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(20),
        ),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, color: Colors.white, size: 40),

            SizedBox(height: 10),

            Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: 10),

            Text(company, style: TextStyle(color: Colors.white70)),
            Text(location, style: TextStyle(color: Colors.white70)),
            Text(salary, style: TextStyle(color: Colors.white70)),
          ],
        ),
      ),
    );
  }
}
