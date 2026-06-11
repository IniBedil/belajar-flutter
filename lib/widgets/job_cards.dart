import 'package:belajarflutter/screens/detail_screen.dart';
import 'package:flutter/material.dart';

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
