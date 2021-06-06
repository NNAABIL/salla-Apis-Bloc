import 'package:course_app/shared/bloc_observer.dart';
import 'package:course_app/shared/cache_helper.dart';
import 'package:course_app/shop_app/login/loginScreen.dart';
import 'package:course_app/shop_app/network/dio_helper.dart';
import 'package:course_app/shop_app/network/end_points.dart';
import 'package:course_app/shop_app/shop_cubit/shop_cubit.dart';
import 'package:course_app/shop_app/shop_layout/layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CacheHelper.init();
   token = CacheHelper.getData(key: 'token');
  print(token);
  Widget widget;
  if(token != null){
    widget = Layout();
  }else{
    widget = LoginScreen();
  }
  runApp(MyApp(
    startWidget: widget,
  ));
}

class MyApp extends StatelessWidget {
  final Widget startWidget;

  const MyApp({Key key, this.startWidget}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_)=>ShopCubit()..getHomeData()..getCategoriesData()..getFavoriteData()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home:startWidget,
      ),
    );
  }
}




