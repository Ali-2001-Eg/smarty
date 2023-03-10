import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/on_boarding/on_boarding_page.dart';
import 'package:graduation_project/screens/about/about_us_page.dart';
import 'package:graduation_project/screens/profile/account_page.dart';
import 'package:graduation_project/screens/profile/notification_page.dart';
import 'package:graduation_project/screens/profile/profile_page.dart';
import 'package:graduation_project/screens/assessment_exams/final_assessment_page.dart';
import 'package:graduation_project/screens/assessment_exams/initial_assessment_page.dart';
import 'package:graduation_project/screens/auth/forgot_password.dart';
import 'package:graduation_project/screens/auth/sign_in_page.dart';
import 'package:graduation_project/screens/auth/sign_up_page.dart';
import 'package:graduation_project/screens/chat/chat_page.dart';
import 'package:graduation_project/screens/content/content_page.dart';
import 'package:graduation_project/screens/events/events.dart';
import 'package:graduation_project/screens/profile/feedback_page.dart';
import 'package:graduation_project/screens/games/games_page.dart';
import 'package:graduation_project/screens/home/home_page.dart';
import 'package:graduation_project/screens/profile/settings_page.dart';
import 'package:graduation_project/screens/spalsh/splash_screen.dart';

import '../../get_started/get_started_page.dart';

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
  static const String events = '/events-page';
  static const String onBoarding = '/on-boarding-page';
  static const String forgotPassword = '/forgot-password-page';
  static const String homeLayout = '/home-layout-page';
  static const String profile = '/profile-page';
  static const String notify = '/notifications-page';

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
  static String getEventsPage() => events;
  static String getOnBoardingPage() => onBoarding;
  static String getForgottenPassword() => forgotPassword;
  static String getHomeLayout() => homeLayout;
  static String getNotificationsPage() => notify;

  static List<GetPage> routes = [
    //initial
    GetPage(
        name: initial,
        page: () => const GetStartedPage(),
        transition: Transition.fade),
    //about
    GetPage(
        name: about,
        page: () => const AboutUsPage(),
        transition: Transition.fade),
    //account
    GetPage(
        name: account,
        page: () =>  AccountPage(),
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
    //events
    GetPage(
        name: events,
        page: () => const EventsPage(),
        transition: Transition.fade),
    //on boarding
    GetPage(
        name: onBoarding,
        page: () => const OnBoardingScreen(),
        transition: Transition.fade),
    //forgot
    GetPage(
        name: forgotPassword,
        page: () => const ForgotPassword(),
        transition: Transition.fade),
    //home layout
    GetPage(
        name: homeLayout,
        page: () => const HomeLayoutPage(),
        transition: Transition.fade),
    //profile
    GetPage(
        name: profile,
        page: () => const ProfilePage(),
        transition: Transition.fade),
    //notifications
    GetPage(
        name: notify,
        page: () => const NotificationsPage(),
        transition: Transition.fade),
  ];

  static List<GetPage> getRoutes() => routes;
}
