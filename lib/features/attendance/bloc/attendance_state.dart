part of 'attendance_bloc.dart';

class AttendanceState extends Equatable {
  @override
  List<Object> get props => throw UnimplementedError();
}

final class AttendanceInitial extends AttendanceState {}

final class CreatingAttendanceState extends AttendanceState {}

final class CreatedAttendanceState extends AttendanceState {}

final class CreateAttendanceErrorState extends AttendanceState {
  final String message;
  CreateAttendanceErrorState({required this.message});
}

class TodayAttendanceLoadedState extends AttendanceState {
  final int count;
  TodayAttendanceLoadedState({required this.count});

  @override
  List<Object> get props => [count];
}
