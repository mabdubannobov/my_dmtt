part of 'home_bloc.dart';

class HomeState extends Equatable {
  @override
  List<Object?> get props => throw UnimplementedError();
}

final class HomeInitial extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeLoadedState extends HomeState {
  final UserModel userModel;
  final DmttModel dmttModel;
  final List<ProductModel> products;
  HomeLoadedState({
    required this.userModel,
    required this.dmttModel,
    required this.products,
  });
}

class HomeErrorState extends HomeState {
  final String message;
  HomeErrorState({required this.message});
}
