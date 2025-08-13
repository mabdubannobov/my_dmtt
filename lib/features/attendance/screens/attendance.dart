import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:my_dmtt/constants/app_colors.dart';
import '../../../constants/app_assets.dart';

class AttendanceScreen extends StatefulWidget {
  const AttendanceScreen({super.key});

  @override
  State<AttendanceScreen> createState() => _AttendanceScreenState();
}

class _AttendanceScreenState extends State<AttendanceScreen> {
  DateTime selectedDate = DateTime.now();
  Timer? _timer;
  Duration remainingTime = Duration.zero;
  bool canSubmit = false;
  bool timeEnded = false;

  @override
  void initState() {
    super.initState();
    _startCountdown();
  }

  void _startCountdown() {
    final startTime = DateTime(
      DateTime.now().year,
      DateTime.now().month,
      DateTime.now().day,
      9,
      0,
      0,
    );
    final endTime = DateTime(
      DateTime.now().year,
      DateTime.now().month,
      DateTime.now().day,
      10,
      0,
      0,
    );

    void updateState() {
      final now = DateTime.now();
      if (now.isBefore(startTime)) {
        setState(() {
          remainingTime = startTime.difference(now);
          canSubmit = false;
          timeEnded = false;
        });
      } else if (now.isAfter(endTime)) {
        setState(() {
          remainingTime = Duration.zero;
          canSubmit = false;
          timeEnded = true;
        });
        _timer?.cancel(); // Tugaganidan keyin sanashni to‘xtatamiz
      } else {
        setState(() {
          remainingTime = endTime.difference(now);
          canSubmit = true;
          timeEnded = false;
        });
      }
    }

    // Dastlab chaqirish
    updateState();

    // Har sekund yangilash
    _timer = Timer.periodic(const Duration(seconds: 1), (_) => updateState());
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = twoDigits(duration.inHours);
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return "$hours:$minutes:$seconds";
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(24, 0, 24, 12),
          child: AppBar(
            leading: SvgPicture.asset(AppAssets.icons.appBarLogo),
            leadingWidth: 28,
            title: const Align(
              alignment: Alignment.centerLeft,
              child: Text('Davomat'),
            ),
          ),
        ),
        EasyDateTimeLine(
          locale: "uz",
          initialDate: selectedDate,
          onDateChange: (date) {
            setState(() {
              selectedDate = date;
            });
          },
          headerProps: const EasyHeaderProps(
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            monthPickerType: MonthPickerType.dropDown,
            dateFormatter: DateFormatter.custom('MMMM'),
            showHeader: false,
          ),
          dayProps: EasyDayProps(
            height: 90,
            width: 60,
            dayStructure: DayStructure.dayStrDayNumMonth,
            activeDayStyle: DayStyle(
              decoration: BoxDecoration(
                color: AppColors.primaryLight,
                borderRadius: BorderRadius.all(Radius.circular(16)),
              ),
              dayNumStyle: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              dayStrStyle: const TextStyle(
                color: Colors.white,
                fontSize: 14,
              ),
              monthStrStyle: const TextStyle(
                color: Colors.white,
                fontSize: 14,
              ),
            ),
            inactiveDayStyle: DayStyle(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(12)),
                border: Border.all(color: AppColors.greyscaleLight.shade200),
              ),
              dayNumStyle: const TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              dayStrStyle: const TextStyle(
                color: Colors.black,
                fontSize: 14,
              ),
              monthStrStyle: const TextStyle(
                color: Colors.black,
                fontSize: 14,
              ),
            ),
          ),
          timeLineProps: EasyTimeLineProps(
            separatorPadding: 12,
            hPadding: 24,
          ),
        ),
        SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Blue Card
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 16,
                ),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xFF246BFD),
                      Color(0xFF5089FF),
                    ],
                    begin: Alignment.bottomRight,
                    end: Alignment.topLeft,
                  ),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  children: const [
                    Icon(Icons.people, color: Colors.white, size: 28),
                    SizedBox(width: 12),
                    Text(
                      "20",
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: const Color(0xFFEAF2FA),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.info, color: AppColors.info),
                    const SizedBox(width: 8),
                    const Expanded(
                      child: Text(
                        "Davomatni o'z vaqtida yuklang. Agar o'z vaqtida yuklashdan xavotir olsangiz, bog'changizning jami tarbiyalanuvchilar sonini standart davomat bo'limida kiriting. Standart davomat sizning jami davomatingizni anglatadi.",
                        style: TextStyle(fontSize: 14, color: Colors.black87),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),

              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 16,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFF4E5),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      canSubmit
                          ? "Davomat kiritish vaqti boshlandi"
                          : timeEnded
                              ? "Davomat vaqti tugadi"
                              : "Davomat kiritish vaqti kelmagan",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: AppColors.warning,
                      ),
                    ),
                    const SizedBox(height: 6),
                    const Text(
                      "Davomat vaqti: 9:00 - 10:00",
                      style: TextStyle(color: Colors.black87),
                    ),
                    const SizedBox(height: 16),
                    if (!canSubmit && !timeEnded)
                      Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 12),
                        decoration: BoxDecoration(
                          border:
                              Border.all(color: AppColors.warning, width: 1),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Center(
                          child: Text(
                            "Boshlanishiga qolgan vaqt: ${_formatDuration(remainingTime)}",
                            style: const TextStyle(
                              color: AppColors.warning,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    if (canSubmit)
                      Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 12),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.green, width: 1),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Center(
                          child: Text(
                            "Yakunlashiga qolgan vaqt: ${_formatDuration(remainingTime)}",
                            style: const TextStyle(
                                color: Colors.green,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              const SizedBox(height: 16),

              const Text(
                "Davomat kiritish",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const SizedBox(height: 8),
              TextField(
                enabled: canSubmit,
                decoration: InputDecoration(
                  labelText: "O'quvchilar soni",
                  prefixIcon: const Icon(Icons.people_outline),
                  filled: true,
                  fillColor: canSubmit ? Colors.white : Colors.grey.shade200,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              ElevatedButton(
                onPressed: canSubmit ? () {} : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      canSubmit ? AppColors.primaryLight : Colors.grey.shade400,
                  minimumSize: const Size(double.infinity, 48),
                ),
                child: Text(
                  canSubmit
                      ? "Davomatni kiritish"
                      : "Davomat kiritish vaqti kelmagan",
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
