import 'package:bloc_mng/features/cart/bloc/cart_bloc_bloc.dart';
import 'package:bloc_mng/features/cart/ui/cart_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final CartBloc cartBloc = CartBloc();
  @override
  void initState() {
    super.initState();
    cartBloc.add(CartInitialEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart Items'),
      ),
      body: BlocConsumer<CartBloc, CartBlocState>(
        bloc: cartBloc,
        listener: (context, state) {},
        builder: (context, state) {
          if (state is CartLoading) {
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else if (state is CartLoaded) {
            return ListView.builder(
              itemCount: state.cartProducts.length,
              itemBuilder: (context, index) {
                return CartTileWidget(
                    cartBloc: cartBloc,
                    productDataModel: state.cartProducts[index]);
              },
            );
          }
          return Container();
        },
      ),
    );
  }
}
