import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../domain/attendance_service.dart';

part 'attendance_event.dart';
part 'attendance_state.dart';

class AttendanceBloc extends Bloc<AttendanceEvent, AttendanceState> {
  final AttendanceService attendanceService = AttendanceService();
  AttendanceBloc() : super(AttendanceState()) {
    on<AttendanceEvent>((event, emit) {});
    on<CreateAttendanceEvent>((event, emit) async {
      emit(CreatingAttendanceState());
      try {
        await attendanceService.postData(event.childCount);

        // Avval Created holatini yuboramiz
        emit(CreatedAttendanceState());

        // So'ng bugungi davomatni qayta yuklaymiz
        final count = await attendanceService.getTodayCount();
        emit(TodayAttendanceLoadedState(count: count));
      } catch (e) {
        emit(CreateAttendanceErrorState(message: e.toString()));
      }
    });
    on<GetTodayAttendanceEvent>((event, emit) async {
      final count = await attendanceService.getTodayCount();
      emit(TodayAttendanceLoadedState(count: count));
    });
  }
}
