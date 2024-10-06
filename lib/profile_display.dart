import 'package:flutter/material.dart';
import 'user_info.dart';


// Profile Section Widget
class ProfileSection extends StatelessWidget {
  final UserInfo userInfo;

  const ProfileSection({super.key, required this.userInfo});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CircleAvatar(
          radius: 40,
          backgroundImage: AssetImage('assets/images/profile_image.png'),
        ),
        const SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(userInfo.name, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            Text(userInfo.position, style: const TextStyle(fontSize: 18, color: Colors.grey)),
            Text(userInfo.company, style: const TextStyle(fontSize: 18, color: Colors.grey)),
          ],
        ),
      ],
    );
  }
}

// Contact info section widget defined
class ContactInfoSection extends StatelessWidget {
  final UserInfo userInfo;

  const ContactInfoSection({super.key, required this.userInfo});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: userInfo.contact.map((contact) => ContactInfoRow(contact: contact)).toList(),
    );
  }
}

class ContactInfoRow extends StatelessWidget {
  final ContactInfo contact;

  const ContactInfoRow({super.key, required this.contact});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Image.asset(contact.logo, height: 30, width: 30),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(contact.title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              Text(contact.cont, style: const TextStyle(fontSize: 16)),
            ],
          ),
        ],
      ),
    );
  }
}

// Education widget
class EducationInfoWidget extends StatelessWidget {
  final EducationInfo educationInfo;

  const EducationInfoWidget({super.key, required this.educationInfo});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.asset(educationInfo.logo, height: 40, width: 40),
              const SizedBox(width: 10),
              Text(educationInfo.name, style: const TextStyle(fontSize: 18)),
            ],
          ),
          Text('${educationInfo.gpa} GPA', style: const TextStyle(fontSize: 18)),
        ],
      ),
    );
  }
}

// Project widget 
class ProjectCard extends StatelessWidget {
  final ProjectInfo projectInfo;

  const ProjectCard({super.key, required this.projectInfo});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(projectInfo.logo, height: 100, fit: BoxFit.cover),  
          const SizedBox(height: 8),
          Text(projectInfo.title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(projectInfo.description, style: const TextStyle(fontSize: 14, color: Colors.grey)),
          ),
        ],
      ),
    );
  }
}



// Main Profile Page Layout
class UserInfoPage extends StatelessWidget {
  final UserInfo userInfo;

  const UserInfoPage({super.key, required this.userInfo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile Page')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              
              Container(
                color: Colors.blue[50], 
                padding: const EdgeInsets.all(16.0),
                child: ProfileSection(userInfo: userInfo),
              ),

              const SizedBox(height: 20),

              // Contact Info Sectionbackground color
              Container(
                color: Colors.green[50], 
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Contact Info', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                    ContactInfoSection(userInfo: userInfo),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // Education Sectionbackground color
              Container(
                color: Colors.orange[50], 
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Education', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                    for (var edu in userInfo.education)
                      EducationInfoWidget(educationInfo: edu),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // Projects Section background color
              Container(
                color: Colors.purple[50],
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Projects', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                    GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                      ),
                      itemCount: userInfo.projects.length,
                      itemBuilder: (context, index) {
                        return ProjectCard(projectInfo: userInfo.projects[index]);
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
