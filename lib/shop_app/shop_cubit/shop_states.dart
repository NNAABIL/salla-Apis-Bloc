import 'package:course_app/shop_app/models/change_favorites_model.dart';

abstract class ShopStates{}

class ShopInitState extends ShopStates{}

class ChangeBottomNavState extends ShopStates{}

class ShopLoadingState extends ShopStates{}

class ShopSuccessState extends ShopStates{}

class ShopErrorState extends ShopStates{}

class CategoriesSuccessState extends ShopStates{}

class CategoriesErrorState extends ShopStates{}

class FavoritesSuccessState extends ShopStates{
  final ChangeFavoritesModel model;

  FavoritesSuccessState(this.model);
}

class ChangeFavoritesState extends ShopStates{}

class FavoritesErrorState extends ShopStates{}


class GetFavoritesDataSuccessState extends ShopStates{}
class GetFavoritesDataErrorState extends ShopStates{}
class LoadingGetFavoritesDataState extends ShopStates{}