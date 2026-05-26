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
      "favorite": false,
    },

    {
      "title": "Backend Developer",
      "company": "Tokopedia",
      "location": "Jakarta",
      "salary": "5 JT / month",
      "color": Colors.green,
      "icon": Icons.storage,
      "favorite": false,
    },

    {
      "title": "UI/UX Designer",
      "company": "Shopee",
      "location": "Bandung",
      "salary": "5 JT / month",
      "color": Colors.purple,
      "icon": Icons.palette,
      "favorite": false,
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
              isFavorite: internships[index]["favorite"],
              onFavoriteTap: () {
                setState(() {
                  internships[index]["favorite"] =
                      !internships[index]["favorite"];
                });
              },
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
  final bool isFavorite;
  final VoidCallback onFavoriteTap;

  const JobCard({
    super.key,
    required this.title,
    required this.company,
    required this.location,
    required this.salary,
    required this.color,
    required this.icon,
    required this.isFavorite,
    required this.onFavoriteTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,

          MaterialPageRoute(
            builder:
                (context) => DetailScreen(
                  title: title,
                  company: company,
                  location: location,
                  salary: salary,
                ),
          ),
        );
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

            GestureDetector(
              onTap: onFavoriteTap,
              child: Icon(
                isFavorite ? Icons.favorite : Icons.favorite_border,
                color: isFavorite ? Colors.red : Colors.white,
                size: 30,
              ),
            ),

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
