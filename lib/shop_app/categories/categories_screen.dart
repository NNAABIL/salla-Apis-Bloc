import 'package:course_app/shop_app/models/categories_model.dart';
import 'package:course_app/shop_app/shop_cubit/shop_cubit.dart';
import 'package:course_app/shop_app/shop_cubit/shop_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit,ShopStates>(
      listener: (context,state){},
      builder: (context,state){
        final category = ShopCubit.get(context);
        return ListView.separated(
          physics: BouncingScrollPhysics(),
           itemBuilder: (context, index) => buildCategoryItem(category.categoriesModel.data.data[index]),
           separatorBuilder: (context, index) =>Container(width: double.infinity,height: 0.5,color: Colors.grey,),
           itemCount: category.categoriesModel.data.data.length);
      }
    );
  }

  Widget buildCategoryItem(DataModel model) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          Image(
            image: NetworkImage(
                model.image),
            width: 80,
            height: 80,
            fit: BoxFit.cover,
          ),
          SizedBox(width: 20,),
          Text(model.name,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
          Spacer(),
          Icon(Icons.arrow_forward_ios)
        ],
      ),
    );
  }
}
