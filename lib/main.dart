import 'package:belajarflutter/services/intership_service.dart';
import 'package:flutter/material.dart';
import 'package:belajarflutter/models/internships_model.dart';
import 'package:belajarflutter/widgets/job_cards.dart';
// import 'package:belajarflutter/services/intership_service.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final internshipService = InternshipService();
  List<InternshipModel> internships = [];
  List<InternshipModel> filteredInternships = [];
  bool isLoading = true;
  @override
  void initState() {
    super.initState();
    loadInternships();
  }

  Future<void> loadInternships() async {
    internships = await internshipService.getInternships();
    filteredInternships = internships;
    isLoading = false;
    setState(() {});
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
              child:
                  isLoading
                      ? Center(child: CircularProgressIndicator())
                      : ListView.builder(
                        itemCount: filteredInternships.length,
                        itemBuilder: (context, index) {},
                      ),
            ),
          ],
        ),
      ),
    );
  }
}
