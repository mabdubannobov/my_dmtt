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
        emit(CreatedAttendanceState());
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
