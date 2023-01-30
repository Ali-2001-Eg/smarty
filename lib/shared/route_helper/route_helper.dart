import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/home/home_page.dart';
import 'package:graduation_project/screens/about/about_us_page.dart';
import 'package:graduation_project/screens/account/account_page.dart';
import 'package:graduation_project/screens/assessment_exams/final_assessment_page.dart';
import 'package:graduation_project/screens/assessment_exams/initial_assessment_page.dart';
import 'package:graduation_project/screens/auth/sign_in_page.dart';
import 'package:graduation_project/screens/auth/sign_up_page.dart';
import 'package:graduation_project/screens/chat/chat_page.dart';
import 'package:graduation_project/screens/content/content_page.dart';
import 'package:graduation_project/screens/feedback/feedback_page.dart';
import 'package:graduation_project/screens/games/games_page.dart';
import 'package:graduation_project/screens/settings/settings_page.dart';
import 'package:graduation_project/screens/spalsh/splash_screen.dart';

class RouteHelper {
  static const String initial = '/';
  static const String about = '/about';
  static const String account = '/account';
  static const String initialAssessment = '/initial-assessment';
  static const String finalAssessment = '/final-assessment';
  static const String signIn = '/sign-in';
  static const String signUp = '/sign-up';
  static const String chat = '/chat-page';
  static const String educationalContent = '/educational-content';
  static const String feedback = '/feedback-page';
  static const String games = '/games-page';
  static const String settings = '/settings-page';
  static const String splashScreen = '/splash-page';

  static String getInitialPage() => initial;
  static String getAboutUsPage() => about;
  static String getAccountPage() => account;
  static String getFinalAssessmentPage() => finalAssessment;
  static String getInitialAssessmentPage() => initialAssessment;
  static String getSignInPage() => signIn;
  static String getSignUpPage() => signUp;
  static String getChatPage() => chat;
  static String getEducationalContentPage() => educationalContent;
  static String getFeedbackPage() => feedback;
  static String getGamesPage() => games;
  static String getSettingsPage() => settings;
  static String getSplashPage() => splashScreen;

  static List<GetPage> routes = [
    //initial
    GetPage(
        name: initial,
        page: () => const HomePage(),
        transition: Transition.fade),
    //about
    GetPage(
        name: about,
        page: () => const AboutUsPage(),
        transition: Transition.fade),
    //account
    GetPage(
        name: account,
        page: () => const AccountPage(),
        transition: Transition.fade),
    //initial assessment
    GetPage(
        name: initialAssessment,
        page: () => const InitialAssessmentPage(),
        transition: Transition.fade),
    //final assessment
    GetPage(
        name: finalAssessment,
        page: () => const FinalAssessmentPage(),
        transition: Transition.fade),
    //sign in
    GetPage(
        name: signIn,
        page: () => const SignInPage(),
        transition: Transition.fade),
    //sign up
    GetPage(
        name: signUp,
        page: () => const SignUpPage(),
        transition: Transition.fade),
    //chat
    GetPage(
        name: chat,
        page: () => const ChatPage(),
        transition: Transition.fade),
    //content
    GetPage(
        name: educationalContent,
        page: () => const EducationalContentPage(),
        transition: Transition.fade),
    //feedback
    GetPage(
        name: feedback,
        page: () => const FeedBackPage(),
        transition: Transition.fade),
    //games
    GetPage(
        name: games,
        page: () => const GamesPage(),
        transition: Transition.fade),
    //settings
    GetPage(
        name: settings,
        page: () => const SettingsPage(),
        transition: Transition.fade),
    //splash
    GetPage(
        name: splashScreen,
        page: () => const SplashScreen(),
        transition: Transition.fade),
  ];

  static List<GetPage> getRoutes() => routes;
}
