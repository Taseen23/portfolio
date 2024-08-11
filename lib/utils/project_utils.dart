// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:url_launcher/url_launcher.dart';

class ProjectUtils {
  final String image;
  final String title;
  final String subtitle;
  final String projectlink;
  final Function ontap;

  ProjectUtils({
    required this.image,
    required this.title,
    required this.subtitle,
    required this.projectlink,
    required this.ontap,
  });
}

// ###############
// HOBBY PROJECTS
List<ProjectUtils> hobbyProjectUtils = [
  ProjectUtils(
      image: 'assets/projects/1.jpg',
      title: 'Applications Management App',
      subtitle:
          'This app allows applicants to apply and receive feedback from admins based on eligibility criteria.',
      projectlink: 'https://github.com/Taseen23/Applications_Managment_System',
      ontap: () => launchUrl(Uri.parse(
          "https://github.com/Taseen23/Applications_Managment_System"))),
  ProjectUtils(
      image: 'assets/projects/02.jpg',
      title: 'E-Commerce App',
      subtitle:
          'With the concept of bloc for state management this app is introduced,that concept boost the efficiency.',
      projectlink: 'https://github.com/Taseen23/e-commerce_bloc',
      ontap: () => launchUrl(Uri.parse(
          "https://github.com/Taseen23/Applications_Managment_System"))),
  ProjectUtils(
      image: 'assets/projects/03.jpg',
      title: 'Golden Hervest App',
      subtitle:
          'This app connects farmers with nearby experts for quick farming support, helping keep crops healthy.',
      projectlink: 'https://github.com/Taseen23/Agricos_',
      ontap: () => launchUrl(Uri.parse(
          "https://github.com/Taseen23/Applications_Managment_System"))),
  ProjectUtils(
      image: 'assets/projects/05.jpg',
      title: 'Expense Tracker',
      subtitle:
          'This is a simple expense tracker app, whoch enable users to track users his/her expenses ',
      projectlink: 'https://github.com/Taseen23/tracker',
      ontap: () => launchUrl(Uri.parse(
          "https://github.com/Taseen23/Applications_Managment_System"))),
  ProjectUtils(
      image: 'assets/projects/04.jpg',
      title: 'Todo App',
      subtitle:
          'This is a simple task management app with the impliment of share-preference',
      projectlink: 'https://github.com/Taseen23/task_manager',
      ontap: () => launchUrl(Uri.parse(
          "https://github.com/Taseen23/Applications_Managment_System"))),
];
