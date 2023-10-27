import 'package:bloc/bloc.dart';
import 'package:bloc_mng/data/cart_items.dart';
import 'package:bloc_mng/features/home/models/product_model.dart';
import 'package:meta/meta.dart';

part 'cart_bloc_event.dart';
part 'cart_bloc_state.dart';

class CartBloc extends Bloc<CartBlocEvent, CartBlocState> {
  CartBloc() : super(CartBlocInitial()) {
    on<CartInitialEvent>((event, emit) async {
      emit(CartLoading());
      await Future.delayed(const Duration(seconds: 3));
      emit(CartLoaded(cartProducts: cartProducts));
    });
  }
}
