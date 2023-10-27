part of 'cart_bloc_bloc.dart';

@immutable
abstract class CartBlocEvent {}

class CartInitialEvent extends CartBlocEvent {}

class CartRemoveItem extends CartBlocEvent {
  final ProductModel product;

  CartRemoveItem({required this.product});
}
