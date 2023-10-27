part of 'home_bloc_bloc.dart';

@immutable
abstract class HomeBlocEvent {}

class HomeInitial extends HomeBlocEvent {}

class HomeWishlistBtnClick extends HomeBlocEvent {}

class HomeCartBtnClick extends HomeBlocEvent {}

class HomeProductWishlistBtnClick extends HomeBlocEvent {
  final ProductModel product;
  HomeProductWishlistBtnClick({required this.product});
}

class HomeProductCartBtnClick extends HomeBlocEvent {
  final ProductModel product;
  HomeProductCartBtnClick({required this.product});
}

class HomeWishlistBtnNav extends HomeBlocEvent {}

class HomeCartBtnNav extends HomeBlocEvent {}
