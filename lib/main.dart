import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:note_it/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:note_it/models/note_model.dart';
import 'package:note_it/routes_manager.dart';
import 'package:note_it/simple_bloc_observer.dart';

import 'constant.dart';

void main() async {
  await Hive.initFlutter();

  await Hive.openBox(knotesBox);
  Hive.registerAdapter(NoteModelAdapter());
  Bloc.observer = SimpleBlocObserver();

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    // navigation bar color
    statusBarColor: Color(0xffEEEEEE), // status bar color
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => AddNoteCubit()),
          ],
          child: const MaterialApp(
            debugShowCheckedModeBanner: false,
            onGenerateRoute: RoutesGenerator.getRoute,
            initialRoute: Routes.splashRoute,
          ),
        );
      },
    );
  }
}
