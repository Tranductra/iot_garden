import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../pages/auth/views/login_page.dart';
import '../pages/student/views/entry_point_student.dart';

GoRouter router = GoRouter(routes: [
  GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return LoginPage();
        // return LoginPage();
      },
      routes: [
        GoRoute(
            path: 'user',
            builder: (BuildContext context, GoRouterState state) {
              return LoginPage();
            }),
        GoRoute(
            path: 'home',
            builder: (BuildContext context, GoRouterState state) {
              return EntryPointStudent();
            }),
      ])
]);
