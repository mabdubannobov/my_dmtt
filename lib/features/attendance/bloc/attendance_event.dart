part of 'attendance_bloc.dart';

sealed class AttendanceEvent extends Equatable {
  const AttendanceEvent();

  @override
  List<Object> get props => [];
}

class CreateAttendanceEvent extends AttendanceEvent {
  final int childCount;
  const CreateAttendanceEvent({
    required this.childCount,
  });
}

class GetTodayAttendanceEvent extends AttendanceEvent {}
