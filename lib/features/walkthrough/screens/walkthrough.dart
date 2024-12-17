import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_dmtt/constants/app_assets.dart';
import 'package:my_dmtt/constants/app_colors.dart';
import 'package:my_dmtt/constants/app_text_styles.dart';
import 'package:my_dmtt/features/signin/screens/sign_in.dart';
import 'package:my_dmtt/features/walkthrough/widgets/carousel_item.dart';

class WalkthroughScreen extends StatefulWidget {
  const WalkthroughScreen({super.key});

  @override
  State<WalkthroughScreen> createState() => _WalkthroughScreenState();
}

class _WalkthroughScreenState extends State<WalkthroughScreen> {
  final PageController _pageController = PageController(initialPage: 0);
  int? _currentPage;

  List<String> images = [
    AppAssets.images.walk3,
    AppAssets.images.walk2,
    AppAssets.images.walk1,
  ];

  List<String> titles = [
    "Buyurtma berish",
    "Oson boshqaruv",
    "Tezkorlik",
  ];

  List<String> descriptions = [
    "O'z ta'minotchilaringizga siz uchun kerak bo'lgan oziq-ovqat mahsulotlarini zarur vaqtda buyurtma bering",
    "Omboringizdagi mahsulotlar qoldig'i va narxi, shartnomalarni o'zingizga qulay ravishda kuzatib boring",
    "Ta'minotchilar, idoralar va maktabgacha ta'lim muassasalari o'rtasidagi o'zaro aloqa tufayli mahsulotlarni tez qabul qilib oling",
  ];

  @override
  void initState() {
    super.initState();
    _currentPage = 0;
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page!.toInt();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.dark,
    ));
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SizedBox(
              height: 580,
              child: PageView(
                controller: _pageController,
                physics: const NeverScrollableScrollPhysics(),
                children: List.generate(3, (int index) {
                  return CarouselItem(
                    image: images[index],
                    title: titles[index],
                    description: descriptions[index],
                  );
                }),
              ),
            ),
            const SizedBox(height: 80),
            TextButton(
              onPressed: () {
                _currentPage == 2
                    ? Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const SignInScreen()))
                    : _pageController.nextPage(
                        duration: const Duration(milliseconds: 250),
                        curve: Curves.easeOut,
                      );
              },
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(AppColors.primaryLight),
                fixedSize: WidgetStatePropertyAll(Size.fromWidth(MediaQuery.of(context).size.width - 48)),
                padding: const WidgetStatePropertyAll(EdgeInsets.symmetric(vertical: 16)),
              ),
              child: Text(
                _currentPage == 2 ? "Qani ketdik!" : "Keyingisi",
                style: AppTextStyles.boldStyle.copyWith(fontSize: 16, color: Colors.white),
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
