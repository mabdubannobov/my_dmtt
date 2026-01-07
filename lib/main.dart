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

// O'zgarmaslar uchun alohida fayl qilish yaxshi, lekin hozircha shu yerda konstant sifatida belgilaymiz
const String kProductsBox = 'productsBox';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // UI sozlamalari (Status bar va Navigation bar) shu yerda bir marta o'rnatiladi
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.transparent,
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ),
  );
  await SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);

  await Hive.initFlutter();
  Hive.registerAdapter(ProductModelAdapter());
  await Hive.openBox<ProductModel>(kProductsBox);

  runApp(const MainApp(home: SplashScreen()));
}

class MainApp extends StatelessWidget {
  // dynamic o'rniga aniq Widget turi ishlatildi
  final Widget home;

  const MainApp({required this.home, super.key});

  @override
  Widget build(BuildContext context) {
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
        child: BlocBuilder<ThemeCubit, ThemeMode>(
          builder: (context, themeMode) {
            return MaterialApp(
              supportedLocales: const [Locale('en', ''), Locale('uz', '')],
              localizationsDelegates: const [
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              // Eslatma: Agar ilovada tilni o'zgartirish imkoniyati bo'lsa,
              // 'locale' qiymatini ham Cubit yoki state orqali boshqarish kerak bo'ladi.
              locale: const Locale('uz'),
              debugShowCheckedModeBanner: false,
              home: home,
              theme: lightTheme,
              darkTheme: darkTheme,
              themeMode: themeMode,
            );
          },
        ),
      ),
    );
  }
}
