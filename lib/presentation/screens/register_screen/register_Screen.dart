import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp/business_logic/register_cubit/states.dart';
import '../../../config/routes/app_routes.dart';
import '../../../config/routes/routes.dart';
import '../layout/layout_screen.dart';
import '../../../core/utils/constants.dart';
import '../../../core/network/local/cache_helper.dart';
import '../../../core/widgets/button_wiget.dart';
import '../../../core/widgets/showToast_widget.dart';
import '../../../core/widgets/textFormFeild_widget.dart';
import '../../../business_logic/register_cubit/cubit.dart';

class RegisterScreen extends StatelessWidget {
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();
  var passwordController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterStates>(
      listener: (context, state) {
        if (state is RegisterSuccessState) {
          if (state.loginModel.status!) {
            print(state.loginModel.message);
            print(state.loginModel.data!.token);
            CacheHelper.saveData(
              key: 'token',
              value: state.loginModel.data!.token,
            ).then((value) {
              token = state.loginModel.data!.token!;
              Navigator.of(context).pushNamedAndRemoveUntil(
                  Routes.layoutScreen, (Route<dynamic> route) => false);
              // navigateAndFinish(context, LayoutScreen());
            });
          } else {
            showToast(
                msg: state.loginModel.message.toString(),
                state: ToastStates.ERROR);
          }
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'REGISTER',
              style: Theme.of(context).textTheme.headline5,
            ),
          ),
          body: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'register now to browse or hot offers',
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              color: Colors.grey,
                            ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      defaultFormField(
                        onTap: () {},
                        onChange: () {},
                        onSubmit: () {},
                        controller: nameController,
                        type: TextInputType.name,
                        msg: 'pleas Inter your name',
                        // validate: (String value) {
                        //   if (value.isEmpty) {
                        //     return 'pleas Inter your name';
                        //   }
                        // },
                        label: 'User Name',
                        prefix: Icons.person,
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      defaultFormField(
                        onTap: () {},
                        onChange: () {},
                        onSubmit: () {},
                        controller: emailController,
                        type: TextInputType.emailAddress,
                        msg: 'pleas Inter your email',
                        // validate: (String value) {
                        //   if (value.isEmpty) {
                        //     return 'pleas Inter your email';
                        //   }
                        // },
                        label: 'Email Address',
                        prefix: Icons.email_outlined,
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      defaultFormField(
                        onTap: () {},
                        onChange: () {},
                        controller: passwordController,
                        type: TextInputType.visiblePassword,
                        suffix: RegisterCubit.get(context).suffix,
                        onSubmit: (value) {},
                        isPassword: RegisterCubit.get(context).isPassword,
                        suffixOnPressed: () {
                          RegisterCubit.get(context).changePasswordVisibility();
                        },
                        msg: 'password is too short',
                        // validate: (String value) {
                        //   if (value.isEmpty) {
                        //     return 'password is too short';
                        //   }
                        // },
                        label: 'password ',
                        prefix: Icons.lock_outline,
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      defaultFormField(
                        onTap: () {},
                        onChange: () {},
                        onSubmit: () {},
                        controller: phoneController,
                        type: TextInputType.phone,
                        msg: 'please enter your phone number',
                        // validate: (String value) {
                        //   if (value.isEmpty) {
                        //     return 'please enter your phone number';
                        //   }
                        // },
                        label: 'Phone',
                        prefix: Icons.phone,
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      ConditionalBuilder(
                        condition: state is! RegisterLoadingState,
                        builder: (context) => defaultButton(
                          function: () {
                            if (formKey.currentState!.validate()) {
                              RegisterCubit.get(context).userRegister(
                                name: nameController.text,
                                email: emailController.text,
                                password: passwordController.text,
                                phone: phoneController.text,
                              );
                            }
                          },
                          text: 'register',
                          isUpperCase: true,
                        ),
                        fallback: (context) =>
                            Center(child: CircularProgressIndicator()),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
