import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp/business_logic/layout_cubit/cubit_layout.dart';
import 'package:shopapp/business_logic/layout_cubit/states_layout.dart';

import '../../../data/models/categories_model.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LayoutCubit, LayoutStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return ListView.separated(
            itemBuilder: (context, index) => buildCatItem(
                LayoutCubit.get(context).categoriesModel!.data!.data[index]),
            separatorBuilder: (context, index) => const Divider(),
            itemCount:
                LayoutCubit.get(context).categoriesModel!.data!.data.length);
      },
    );
  }
}

Widget buildCatItem(DataModel dataModel) => Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [
          Image(
            image: NetworkImage(
              dataModel.image.toString(),
            ),
            width: 120.0,
            height: 120.0,
            fit: BoxFit.cover,
          ),
          SizedBox(
            width: 18.0,
          ),
          Text(
            dataModel.name.toString(),
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18.0,
            ),
          ),
          Spacer(),
          Icon(
            Icons.arrow_forward_ios,
          )
        ],
      ),
    );
