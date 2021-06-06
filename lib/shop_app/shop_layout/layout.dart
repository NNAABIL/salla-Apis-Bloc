import 'package:course_app/shared/cache_helper.dart';
import 'package:course_app/shop_app/login/loginScreen.dart';
import 'package:course_app/shop_app/shop_cubit/shop_cubit.dart';
import 'package:course_app/shop_app/shop_cubit/shop_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Layout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (_, state) {},
      builder: (_, state) {
        var shopCubit = ShopCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            elevation: 0,
            title: Text('salla',style: TextStyle(color:Colors.black),),
            backgroundColor: Colors.white,
          ),
          body: shopCubit.bottomScreens[shopCubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: shopCubit.currentIndex,
            type: BottomNavigationBarType.fixed,
            onTap: (int index) {
              shopCubit.changeCurrentIndex(index);
            },
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home),label: 'Home'),
              BottomNavigationBarItem(icon: Icon(Icons.apps),label: 'Categories'),
              BottomNavigationBarItem(icon: Icon(Icons.favorite),label: 'Favorites'),
              BottomNavigationBarItem(icon: Icon(Icons.settings),label: 'Settings'),
            ],
          ),
        );
      },
    );
  }
}
