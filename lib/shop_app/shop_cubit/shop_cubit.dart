import 'package:course_app/shop_app/categories/categories_screen.dart';
import 'package:course_app/shop_app/favorites/favorites_screen.dart';
import 'package:course_app/shop_app/models/categories_model.dart';
import 'package:course_app/shop_app/models/change_favorites_model.dart';
import 'package:course_app/shop_app/models/favorites_model.dart';
import 'package:course_app/shop_app/models/home_model.dart';
import 'package:course_app/shop_app/network/dio_helper.dart';
import 'package:course_app/shop_app/network/end_points.dart';
import 'package:course_app/shop_app/products/products_screen.dart';
import 'package:course_app/shop_app/settings/settings_screen.dart';
import 'package:course_app/shop_app/shop_cubit/shop_states.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class ShopCubit extends Cubit<ShopStates> {
  ShopCubit() : super(ShopInitState());

  static ShopCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  List<Widget> bottomScreens = [
    ProductsScreen(),
    CategoriesScreen(),
    FavoritesScreen(),
    SettingsScreen(),
  ];

  Map<int, bool> favorites = {};

  changeCurrentIndex(index) {
    currentIndex = index;
    emit(ChangeBottomNavState());
  }

  HomeModel homeModel;

  getHomeData() {
    emit(ShopLoadingState());
    DioHelper.getData(url: Home, token: token).then((value) {
      homeModel = HomeModel.fromJson(value.data);
      print(homeModel.toString());
      print('homeModelStatus>>>>>>>>>>>>>${homeModel.status}');
      homeModel.data.products.forEach((element) {
        favorites.addAll({element.id: element.inFavorites});
      });
      print(favorites.toString());
      emit(ShopSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(ShopErrorState());
    });
  }

  CategoriesModel categoriesModel;

  getCategoriesData() {
    DioHelper.getData(url: GET_CATEGORIES).then((value) {
      categoriesModel = CategoriesModel.fromJson(value.data);
      print(homeModel.toString());
      print('CategoriesModelStatus>>>>>>>>>>>>>${categoriesModel.status}');
      emit(CategoriesSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(CategoriesErrorState());
    });
  }

  ChangeFavoritesModel changeFavoritesModel;
  changeFavorites(int productId) {
    //Toggling favorite state
    favorites[productId] = !favorites[productId];
    emit(ChangeFavoritesState());

    DioHelper.postData(
      url: Favorites,
      data: {'product_id': productId},
      token: token,
    ).then((value) {
      changeFavoritesModel = ChangeFavoritesModel.formJson(value.data);
      print(value.data);

      if (!changeFavoritesModel.status) {
        favorites[productId] = !favorites[productId];
      }else{
        getFavoriteData();
      }
      emit(FavoritesSuccessState(changeFavoritesModel));
    }).catchError((error) {
      emit(FavoritesErrorState());
    });
  }

  FavoritesModel favoritesModel;
  getFavoriteData() {
    emit(LoadingGetFavoritesDataState());

    DioHelper.getData(url: Favorites, token: token)
        .then((value) {
          favoritesModel = FavoritesModel.fromJson(value.data);
          print('favoritesssssssssssss ${favoritesModel.data.data}');
          emit(GetFavoritesDataSuccessState());
    })
        .catchError((error){
          print(error.toString());
          emit(GetFavoritesDataErrorState());
    });
  }
}
