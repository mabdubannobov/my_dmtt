import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:my_dmtt/features/account/bloc/account_bloc.dart';
import 'package:my_dmtt/features/main_screen.dart';
import 'package:my_dmtt/features/orders/bloc/bloc/orders_bloc.dart';
import 'package:my_dmtt/features/signin/bloc/sign_in_bloc.dart';
import 'package:my_dmtt/features/walkthrough/screens/splash.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'constants/sharedprefrences.dart';
import 'features/home/bloc/home_bloc.dart';
import 'models/product_model.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(ProductModelAdapter());
  await Hive.openBox<ProductModel>('productsBox');
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var token = prefs.getString(Shared.accessToken);
  runApp(MainApp(
    home: token == null ? const SplashScreen() : const MainScreen(),
  ));
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
      create: (context) => SignInBloc(),
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => SignInBloc()),
          BlocProvider(create: (context) => HomeBloc()),
          BlocProvider(create: (context) => OrdersBloc()),
          BlocProvider(create: (context) => AccountBloc()),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: home,
          theme: ThemeData(scaffoldBackgroundColor: Colors.white),
        ),
      ),
    );
  }
}
