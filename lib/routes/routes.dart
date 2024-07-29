



import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ichi/common/router_strings.dart';
import 'package:ichi/features/splash_screen/view/splash_screen.dart';

GoRouter router = GoRouter(
  initialLocation: RouterStrings.splashScreenRoute,


    routes: [
        GoRoute(path: RouterStrings.splashScreenRoute,builder: (BuildContext context, state){
            return SplashScreen();
        })

    ]

);