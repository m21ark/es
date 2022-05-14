import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:redux/redux.dart';
import 'package:uni/controller/middleware.dart';
import 'package:uni/model/erasmus/erasmus_paperwork_model.dart';
import 'package:uni/model/app_state.dart';
import 'package:uni/redux/actions.dart';
import 'package:uni/redux/reducers.dart';
import 'package:uni/utils/constants.dart' as Constants;
import 'package:uni/view/Pages/Erasmus/erasmus_about_view.dart';
import 'package:uni/view/Pages/Erasmus/erasmus_map_view.dart';
import 'package:uni/view/Pages/Erasmus/erasmus_page_view.dart';
import 'package:uni/view/Pages/Erasmus/erasmus_review_list_view.dart';
import 'package:uni/view/Pages/Erasmus/erasmus_student_list_view.dart';
import 'package:uni/view/Pages/Erasmus/erasmus_uni_list_view.dart';
import 'package:uni/view/Pages/Erasmus/erasmus_uni_main_view.dart';
import 'package:uni/view/Pages/about_page_view.dart';
import 'package:uni/view/Pages/bug_report_page_view.dart';
import 'package:uni/view/Pages/bus_stop_next_arrivals_page.dart';
import 'package:uni/view/Pages/Erasmus/erasmus_uni_page_view.dart';
import 'package:uni/view/Pages/Erasmus/erasmus_uni_review_view.dart';
import 'package:uni/view/Pages/exams_page_view.dart';
import 'package:uni/view/Pages/home_page_view.dart';
import 'package:uni/view/Pages/logout_route.dart';
import 'package:uni/view/Pages/splash_page_view.dart';
import 'package:uni/view/Widgets/page_transition.dart';
import 'package:uni/view/navigation_service.dart';
import 'package:uni/view/theme.dart';

import 'controller/on_start_up.dart';
import 'model/schedule_page_model.dart';

/// Stores the state of the app
final Store<AppState> state = Store<AppState>(appReducers,
    /* Function defined in the reducers file */
    initialState: AppState(null),
    middleware: [generalMiddleware]);

SentryEvent beforeSend(SentryEvent event) {
  return event.level == SentryLevel.info ? event : null;
}

Future<void> main() async {
  OnStartUp.onStart(state);
  await SentryFlutter.init(
    (options) {
      options.dsn =
          'https://a2661645df1c4992b24161010c5e0ecb@o553498.ingest.sentry.io/5680848';
    },
    appRunner: () => {runApp(MyApp())},
  );
}

/// Manages the state of the app
///
/// This class is necessary to track the app's state for
/// the current execution
class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppState(
        state: Store<AppState>(appReducers,
            /* Function defined in the reducers file */
            initialState: AppState(null),
            middleware: [generalMiddleware]));
  }
}

/// Manages the app depending on its current state
class MyAppState extends State<MyApp> {
  MyAppState({@required this.state}) {}

  final Store<AppState> state;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return StoreProvider(
      store: state,
      child: MaterialApp(
          title: 'uni',
          theme: applicationLightTheme,
          home: SplashScreen(),
          navigatorKey: NavigationService.navigatorKey,
          // ignore: missing_return
          onGenerateRoute: (RouteSettings settings) {
            switch (settings.name) {
              case '/' + Constants.navPersonalArea:
                return PageTransition.makePageTransition(
                    page: HomePageView(), settings: settings);
              case '/' + Constants.navSchedule:
                return PageTransition.makePageTransition(
                    page: SchedulePage(), settings: settings);
              case '/' + Constants.navExams:
                return PageTransition.makePageTransition(
                    page: ExamsPageView(), settings: settings);
              case '/' + Constants.navStops:
                return PageTransition.makePageTransition(
                    page: BusStopNextArrivalsPage(), settings: settings);
              case '/' + Constants.navAbout:
                return PageTransition.makePageTransition(
                    page: AboutPageView(), settings: settings);
              case '/' + Constants.navBugReport:
                return PageTransition.makePageTransition(
                    page: BugReportPageView(),
                    settings: settings,
                    maintainState: false);
              case '/' + Constants.navLogOut:
                return LogoutRoute.buildLogoutRoute();

              // Erasmus Page Transitions

              case '/' + Constants.navErasmusMain:
                return PageTransition.makePageTransition(
                    page: ErasmusMainPageView(), settings: settings);

              case '/' + Constants.navErasmusMainUni:
                return PageTransition.makePageTransition(
                    page: ErasmusMainUniView(), settings: settings);

              case '/' + Constants.navErasmusPaperwork:
                return PageTransition.makePageTransition(
                    page: ErasmusPaperworkModel(), settings: settings);

              case '/' + Constants.navErasmusUniversityPage:
                return PageTransition.makePageTransition(
                    page: ErasmusUniversityPageView(), settings: settings);

              case '/' + Constants.navErasmusUniversityReview:
                return PageTransition.makePageTransition(
                    page: ErasmusUniversityReviewView(), settings: settings);

              case '/' + Constants.navErasmusMap:
                return PageTransition.makePageTransition(
                    page: ErasmusMapView(), settings: settings);

              case '/' + Constants.navErasmusStudentsList:
                return PageTransition.makePageTransition(
                    page: ErasmusStudentListView(), settings: settings);

              case '/' + Constants.navErasmusUniversitiesList:
                return PageTransition.makePageTransition(
                    page: ErasmusUniversityListView(), settings: settings);

              case '/' + Constants.navErasmusReviewList:
                return PageTransition.makePageTransition(
                    page: ErasmusReviewListView(), settings: settings);

              case '/' + Constants.navErasmusAbout:
                return PageTransition.makePageTransition(
                    page: ErasmusABoutView(), settings: settings);
            }
          }),
    );
  }

  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 60),
        (Timer t) => state.dispatch(SetCurrentTimeAction(DateTime.now())));
  }
}
