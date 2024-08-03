// ignore_for_file: public_member_api_docs, sort_constructors_first
class ProjectUtils {
  final String image;
  final String title;
  final String subtitle;
  final String projectlink;

  ProjectUtils({
    required this.image,
    required this.title,
    required this.subtitle,
    required this.projectlink,
  });
}

// ###############
// HOBBY PROJECTS
List<ProjectUtils> hobbyProjectUtils = [
  ProjectUtils(
    image: 'assets/projects/1.jpg',
    title: 'Applications Management App',
    subtitle:
        'This is a comprehensive English learning app for practicing and competing with each other.',
    projectlink: 'https://github.com/Taseen23/Applications_Managment_System',
  ),
  ProjectUtils(
    image: 'assets/projects/02.jpg',
    title: 'E-Commerce App',
    subtitle:
        'This is a dictionary application for English learners to easily look up word definitions.',
    projectlink: 'https://github.com/Taseen23/e-commerce_bloc',
  ),
  ProjectUtils(
    image: 'assets/projects/03.jpg',
    title: 'Golden Hervest App',
    subtitle:
        'This is a word memorising app to save and play your own words as quizes',
    projectlink: 'https://github.com/Taseen23/Agricos_',
  ),
  ProjectUtils(
    image: 'assets/projects/05.png',
    title: 'Tasbeeh Counter',
    subtitle:
        'This is a simple dzikr counter app for muslims with persistent storage',
    projectlink: '',
  ),
  ProjectUtils(
    image: 'assets/projects/04.jpg',
    title: 'Todo App',
    subtitle:
        'This is a simple task management app with the impliment of share-preference',
    projectlink: 'https://github.com/Taseen23/task_manager',
  ),
];
