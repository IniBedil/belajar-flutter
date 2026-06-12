import 'package:flutter/material.dart';
import 'package:belajarflutter/models/internships_model.dart';
import 'package:belajarflutter/widgets/job_cards.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<InternshipModel> internships = [
    InternshipModel(
      title: "Frontend Developer",
      company: "Google",
      location: "Remote",
      salary: "5 JT / month",
      color: Colors.blue,
      icon: Icons.web,
    ),
  ];

  List<InternshipModel> filteredInternships = [];

  @override
  void initState() {
    super.initState();

    filteredInternships = internships;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(10),

              child: TextField(
                onChanged: (value) {
                  setState(() {
                    filteredInternships =
                        internships.where((internship) {
                          return internship.title.toLowerCase().contains(
                            value.toLowerCase(),
                          );
                        }).toList();
                  });
                },

                decoration: InputDecoration(
                  hintText: "Cari internship...",
                  prefixIcon: Icon(Icons.search),

                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: filteredInternships.length,

                itemBuilder: (context, index) {
                  return JobCard(
                    title: filteredInternships[index].title,
                    company: filteredInternships[index].company,
                    location: filteredInternships[index].location,
                    salary: filteredInternships[index].salary,
                    color: filteredInternships[index].color,
                    icon: filteredInternships[index].icon,
                    isFavorite: filteredInternships[index].favorite,

                    onFavoriteTap: () {
                      setState(() {
                        filteredInternships[index].favorite =
                            !filteredInternships[index].favorite;
                      });
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
