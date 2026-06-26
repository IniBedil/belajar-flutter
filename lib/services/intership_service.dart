import 'package:belajarflutter/models/internships_model.dart';

class InternshipService {
  Future<List<InternshipModel>> getInternships() async {
    await Future.delayed(const Duration(seconds: 3));
    List<Map<String, dynamic>> apiResponse = [
      {
        "title": "Frontend Developer",
        "company": "Google",
        "location": "Remote",
        "salary": "5 JT / month",
      },

      {
        "title": "Backend Developer",
        "company": "Tokopedia",
        "location": "Jakarta",
        "salary": "6 JT / month",
      },
    ];
    return apiResponse.map((json) => InternshipModel.fromJson(json)).toList();
  }
}
