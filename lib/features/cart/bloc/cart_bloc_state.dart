part of 'cart_bloc_bloc.dart';

abstract class CartBlocState {}

class CartBlocInitial extends CartBlocState {}

class CartLoading extends CartBlocState {}

class CartLoaded extends CartBlocState {
  final List<ProductModel> cartProducts;
  CartLoaded({required this.cartProducts});
}
