import 'package:bloc/bloc.dart';
import 'package:bloc_mng/data/cart_items.dart';
import 'package:bloc_mng/data/prod_items.dart';
import 'package:bloc_mng/data/wishlist_items.dart';
import 'package:bloc_mng/features/home/models/product_model.dart';
import 'package:flutter/cupertino.dart';

part 'home_bloc_event.dart';
part 'home_bloc_state.dart';

class HomeBloc extends Bloc<HomeBlocEvent, HomeBlocState> {
  HomeBloc() : super(HomeBlocInitial()) {
    on<HomeInitial>((event, emit) async {
      emit(HomeLoading());
      await Future.delayed(Duration(seconds: 3));
      emit(HomeLoaded(
          products: GroceryData.groceryProducts
              .map((e) => ProductModel(
                  description: e['description'],
                  name: e['name'],
                  id: e['id'],
                  imgUrl: e['imageUrl'],
                  price: e['price']))
              .toList()));
    });

    on<HomeWishlistBtnClick>((event, emit) {
      emit(HomeWishlistNav());
    });

    on<HomeCartBtnClick>((event, emit) {
      emit(HomeCartNav());
    });

    on<HomeProductWishlistBtnClick>((event, emit) {
      wishlistProducts.add(event.product);
      emit(ProductWishlisted());
    });

    on<HomeProductCartBtnClick>((event, emit) {
      cartProducts.add(event.product);
      emit(ProductCarted());
    });
  }
}
