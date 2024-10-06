// UserInfo model to store user data
class UserInfo {
  final String name;
  final String position;
  final String company;
  final List<ContactInfo> contact;
  final List<EducationInfo> education;
  final List<ProjectInfo> projects;

  UserInfo({
    required this.name,
    required this.position,
    required this.company,
    required this.contact,
    required this.education,
    required this.projects,
  });
}

class ContactInfo {
  final String logo;
  final String cont;
  final String title;

  ContactInfo({required this.logo, required this.cont, required this.title});
}

class EducationInfo {
  final String logo;
  final String name;
  final double gpa;
  final String degree;

  EducationInfo({required this.logo, required this.name, required this.gpa, required this.degree});
}

class ProjectInfo {
  final String title;
  final String description;
  final String logo;

  ProjectInfo({required this.title, required this.description, required this.logo});
}
