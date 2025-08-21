import 'package:flutter/material.dart';
import 'package:untitled1/presentation/forgetpassword/forget_password_view.dart';
import 'package:untitled1/presentation/login/login_view.dart';
import 'package:untitled1/presentation/main/main_view.dart';
import 'package:untitled1/presentation/onboarding/view/onbording_view.dart';
import 'package:untitled1/presentation/register/register_view.dart';
import 'package:untitled1/presentation/resources/strings_manager.dart';
import 'package:untitled1/presentation/splash/splash_view.dart';
import 'package:untitled1/presentation/store_details/store_details_view.dart';

class Routes {
  static const String splashRoute = "/";
  static const String loginRoute = "/login";

  static const String registerRoute = "/register";

  static const String forgetpasswordRoute = "/forgetpassword";

  static const String mainRoute = "/main";
    static const String onboardingRoute = "/onboarding";


  static const String stordetailsRoute = "/storedetails";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings setting) {
    switch (setting.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_) => SplashView());
      case Routes.loginRoute:
        return MaterialPageRoute(builder: (_) => LoginView());
         case Routes.onboardingRoute:
        return MaterialPageRoute(builder: (_) => OnbordingView());
      case Routes.registerRoute:
        return MaterialPageRoute(builder: (_) => RegisterView());
      case Routes.forgetpasswordRoute:
        return MaterialPageRoute(builder: (_) => ForgetPasswordView());
      case Routes.stordetailsRoute:
        return MaterialPageRoute(builder: (_) => StoreDetailsView());
             case Routes.mainRoute:
        return MaterialPageRoute(builder: (_) => MainView());
        
      default:
        return unDefinedRoute();
    }
  }

  static Route<String> unDefinedRoute() {
    return MaterialPageRoute(builder: (_) => Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.noRouteFound),
      ),
      body: Center(
        child:Text(AppStrings.noRouteFound),
      ),
    ));
  }
}
