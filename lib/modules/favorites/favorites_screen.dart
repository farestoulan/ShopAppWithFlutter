import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp/models/favorites_model.dart';

import '../../layout/cubit/cubit_layout.dart';
import '../../layout/cubit/states_layout.dart';
import '../../shared/styles/colors.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LayoutCubit, LayoutStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return ConditionalBuilder(
            condition: state is! LayoutLoadingGetFavoritesState,
            builder: (context) => ListView.separated(
                itemBuilder: (context, index) => buildFavItem(
                    LayoutCubit.get(context).favoritesModel.data.data[index],
                    context),
                separatorBuilder: (context, index) => const Divider(),
                itemCount:
                    LayoutCubit.get(context).favoritesModel.data.data.length),
            fallback: (context) => Center(child: CircularProgressIndicator()),
          );
        });
  }

  Widget buildFavItem(FavoritesData favoritesData, context) => Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          height: 120.0,
          child: Row(
            children: [
              Stack(
                alignment: AlignmentDirectional.bottomStart,
                children: [
                  Image(
                    image: NetworkImage(favoritesData.product.image),
                    height: 150.0,
                    width: 150,
                    fit: BoxFit.cover,
                  ),
                  if (favoritesData.product.discount != 0)
                    Container(
                      color: Colors.red,
                      padding: EdgeInsets.symmetric(horizontal: 7.0),
                      child: Text(
                        'DISCOUNT',
                        style: TextStyle(
                          fontSize: 10.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                ],
              ),
              SizedBox(
                width: 20.0,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      favoritesData.product.name,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 14.0,
                        height: 1.3,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Spacer(),
                    Row(
                      children: [
                        Text(
                          favoritesData.product.price.toString(),
                          style: TextStyle(
                            fontSize: 13.0,
                            color: defaultColor,
                          ),
                        ),
                        SizedBox(
                          width: 5.0,
                        ),
                        if (favoritesData.product.discount != 0)
                          Text(
                            favoritesData.product.oldPrice.toString(),
                            style: TextStyle(
                              fontSize: 12.0,
                              color: Colors.grey,
                              decoration: TextDecoration.lineThrough,
                            ),
                          ),
                        Spacer(),
                        IconButton(
                          onPressed: () {
                            LayoutCubit.get(context)
                                .changeFavorites(favoritesData.product.id);
                          },
                          icon: CircleAvatar(
                            radius: 15.0,
                            backgroundColor: LayoutCubit.get(context)
                                    .favorites[favoritesData.product.id]
                                ? defaultColor
                                : Colors.grey,
                            child: Icon(
                              Icons.favorite_border,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
}
