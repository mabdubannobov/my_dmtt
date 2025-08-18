import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:bolajon_taminoti/constants/themes.dart';
import 'package:bolajon_taminoti/cubit/theme_cubit.dart';
import 'package:bolajon_taminoti/features/account/bloc/account_bloc.dart';
import 'package:bolajon_taminoti/features/attendance/bloc/attendance_bloc.dart';
import 'package:bolajon_taminoti/features/cart/bloc/cart_bloc.dart';
import 'package:bolajon_taminoti/features/orders/bloc/bloc/orders_bloc.dart';
import 'package:bolajon_taminoti/features/signin/bloc/sign_in_bloc.dart';
import 'package:bolajon_taminoti/features/walkthrough/screens/splash.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'features/home/bloc/home_bloc.dart';
import 'models/product_model.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(ProductModelAdapter());
  await Hive.openBox<ProductModel>('productsBox');
  runApp(MainApp(home: const SplashScreen()));
}

class MainApp extends StatelessWidget {
  const MainApp({required this.home, super.key});

  final dynamic home;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.transparent,
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ));
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);

    return BlocProvider(
      create: (context) => ThemeCubit(),
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => SignInBloc()),
          BlocProvider(create: (context) => HomeBloc()),
          BlocProvider(create: (context) => OrdersBloc()),
          BlocProvider(create: (context) => AccountBloc()),
          BlocProvider(create: (context) => CartBloc()),
          BlocProvider(create: (context) => AttendanceBloc()),
        ],
        child:
            BlocBuilder<ThemeCubit, ThemeMode>(builder: (context, themeMode) {
          return MaterialApp(
            supportedLocales: const [
              Locale('en', ''),
              Locale('uz', ''),
            ],
            localizationsDelegates: const [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            locale: const Locale('uz'),
            debugShowCheckedModeBanner: false,
            home: home,
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode: themeMode,
          );
        }),
      ),
    );
  }
}
