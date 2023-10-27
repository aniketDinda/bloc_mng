part of 'home_bloc_bloc.dart';

@immutable
abstract class HomeBlocState {}

@immutable
abstract class HomeBlocActionState extends HomeBlocState {}

class HomeBlocInitial extends HomeBlocState {}

class HomeLoading extends HomeBlocState {}

class HomeLoaded extends HomeBlocState {
  final List<ProductModel> products;
  HomeLoaded({required this.products});
}

class HomeError extends HomeBlocState {}

class HomeWishlistNav extends HomeBlocActionState {}

class HomeCartNav extends HomeBlocActionState {}

class ProductWishlisted extends HomeBlocActionState {}

class ProductCarted extends HomeBlocActionState {}
