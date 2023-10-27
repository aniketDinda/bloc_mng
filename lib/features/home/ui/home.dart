import 'package:bloc_mng/features/cart/ui/cart.dart';
import 'package:bloc_mng/features/home/bloc/home_bloc_bloc.dart';
import 'package:bloc_mng/features/home/ui/product_tile.dart';
import 'package:bloc_mng/features/wishlist/ui/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    homeBloc.add(HomeInitial());
  }

  final HomeBloc homeBloc = HomeBloc();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeBlocState>(
      bloc: homeBloc,
      listenWhen: (previous, current) {
        if (current is HomeBlocActionState) return true;
        return false;
      },
      buildWhen: (previous, current) {
        if (current is! HomeBlocActionState) return true;
        return false;
      },
      listener: (context, state) {
        if (state is HomeWishlistNav) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const WishlistPage()));
        } else if (state is HomeCartNav) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const CartPage()));
        } else if (state is ProductWishlisted) {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Product Added to Wislist')));
        } else if (state is ProductCarted) {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Product Added to Cart')));
        }
      },
      builder: (context, state) {
        if (state is HomeLoading) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (state is HomeLoaded) {
          return Scaffold(
            appBar: AppBar(
              title: const Text("Bloc Management"),
              actions: [
                IconButton(
                  icon: const Icon(Icons.shopping_cart),
                  onPressed: () {
                    homeBloc.add(HomeCartBtnClick());
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.favorite),
                  onPressed: () {
                    homeBloc.add(HomeWishlistBtnClick());
                  },
                ),
              ],
            ),
            body: ListView.builder(
              itemCount: state.products.length,
              itemBuilder: (context, index) {
                return ProductTileWidget(
                    homeBloc: homeBloc,
                    productDataModel: state.products[index]);
              },
            ),
          );
        } else if (state is HomeError) {
          return const Scaffold(
            body: Center(child: Text('Error')),
          );
        }
        return Container();
      },
    );
  }
}
