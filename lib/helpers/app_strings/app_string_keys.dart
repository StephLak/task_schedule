import 'package:get/get_navigation/src/root/internacionalization.dart';
import 'package:task_schedule/helpers/app_strings/english_strings.dart';

class AppStringKeys extends Translations {
  static const String calendar = 'calendar';
  static const String category = 'category';
  static const String chooseDate = 'chooseDate';
  static const String clientMeeting = 'clientMeeting';
  static const String continueText = 'continueText';
  static const String continueWith = 'continueWith';
  static const String dailyStandup = 'dailyStandup';
  static const String dontHave = 'dontHave';
  static const String dueDate = 'dueDate';
  static const String enterHere = 'enterHere';
  static const String forgotPassword = 'forgotPassword';
  static const String isValidField = 'isValidField';
  static const String login = 'login';
  static const String orLoginWith = 'orLoginWith';
  static const String password = 'password';
  static const String productivity = 'productivity';
  static const String profile = 'profile';
  static const String projectCancelled = 'projectCancelled';
  static const String projectCompleted = 'projectCompleted';
  static const String projectProgress = 'projectProgress';
  static const String projectSummary = 'projectSummary';
  static const String registerHere = 'registerHere';
  static const String search = 'search';
  static const String signInText = 'signInText';
  static const String schedule = 'schedule';
  static const String sprintReview = 'sprintReview';
  static const String task = 'task';
  static const String taskTitle1 = 'taskTitle1';
  static const String taskTitle2 = 'taskTitle2';
  static const String taskTitle3 = 'taskTitle3';
  static const String taskTitle4 = 'taskTitle4';
  static const String time = 'time';
  static const String usernameEmail = 'usernameEmail';
  static const String viewAll = 'viewAll';

  @override
  Map<String, Map<String, String>> get keys => {
        // English
        'en_US': EnglishStrings.getStrings(),
      };
}
