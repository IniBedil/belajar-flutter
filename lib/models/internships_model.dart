import 'package:flutter/material.dart';

class InternshipModel {
  final String title;
  final String company;
  final String location;
  final String salary;
  final Color color;
  final IconData icon;

  bool favorite;

  InternshipModel({
    required this.title,
    required this.company,
    required this.location,
    required this.salary,
    required this.color,
    required this.icon,
    this.favorite = false,
  });

  factory InternshipModel.fromJson(Map<String, dynamic> json) {
    return InternshipModel(
      title: json["title"],
      company: json["company"],
      location: json["location"],
      salary: json["salary"],
      color: Colors.blue,
      icon: Icons.work,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "title": title,
      "company": company,
      "location": location,
      "salary": salary,
      "favorite": favorite,
    };
  }
}
