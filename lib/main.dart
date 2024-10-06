import 'package:flutter/material.dart';
import 'user_info.dart';
import 'profile_display.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Example user info
    final userInfo = UserInfo(
      name: 'Nikhil Singh Thakur',
      position: 'AI Engineer',
      company: 'Illinois Tech',
      contact: [
        ContactInfo(logo: 'assets/images/phone.png', cont: '(312) 522-4449', title: 'Phone'),
        ContactInfo(logo: 'assets/images/emailicon.png', cont: 'nikhil.thakur97@gmail.com', title: 'Email'),
        ContactInfo(logo: 'assets/images/home.png', cont: '3024 S Poplar Ave, Chicago, IL 60616', title: 'Home'),
      ],
      education: [
        EducationInfo(logo: 'assets/images/iit.png', name: 'Illinois Tech', gpa: 4.0, degree: 'Master of Science in Artificial Intelligence'),
        EducationInfo(logo: 'assets/images/hpu.png', name: 'HP University', gpa: 3.9, degree: 'Master of Computer Science'),
      ],
      projects: [
        ProjectInfo(
            title: 'Real-Time Sign Language Detection',
            description: 'This project utilizes computer vision and machine learning to detect and interpret sign language in real-time. By analyzing hand gestures and movements through a camera feed, it can accurately recognize and translate sign language into text or speech.',
            logo: 'assets/images/asl.png'),
        ProjectInfo(
            title: 'Natural language processing Chatbot',
            description: 'This project features a chatbot powered by Natural Language Processing (NLP) that understands and responds to user queries in real-time. Utilizing modern NLP techniques, the bot is capable of handling various conversational tasks, making it ideal for applications like customer support, personal assistants, and more.',
            logo: 'assets/images/fullstack.png'),
        ProjectInfo(
            title: 'AI Resume Analyzer with OpenAI and Azure',
            description: 'This project is an AI-powered resume analyzer that leverages OpenAI language models and Azure cloud services to evaluate and provide insights on resumes. It automatically assesses key aspects such as skills, experience, and qualifications, delivering feedback to help candidates optimize their resumes for job applications.',
            logo: 'assets/images/sde.png'),
        ProjectInfo(
            title: 'Text Classification Model with Attention Mechanism NLP',
            description: 'This project implements a text classification model enhanced with an attention mechanism, improving the models ability to focus on relevant parts of the input text. Using advanced Natural Language Processing (NLP) techniques, it efficiently categorizes text into predefined classes, making it ideal for tasks like sentiment analysis, spam detection, or topic classification.',
            logo: 'assets/images/ai.png'),
        
      ],
    );

    return MaterialApp(
      home: UserInfoPage(userInfo: userInfo),
    );
  }
}
