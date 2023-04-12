import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp/presentation/screens/layout/layout_screen.dart';
import 'package:shopapp/business_logic/login_cubit/cubit.dart';
import 'package:shopapp/business_logic/login_cubit/states.dart';
import 'package:shopapp/presentation/screens/register_screen/register_Screen.dart';
import 'package:shopapp/core/utils/constants.dart';
import 'package:shopapp/core/network/local/cache_helper.dart';

import '../../../config/routes/app_routes.dart';
import '../../../config/routes/routes.dart';
import '../../../core/widgets/button_wiget.dart';
import '../../../core/widgets/showToast_widget.dart';
import '../../../core/widgets/textButton_widget.dart';
import '../../../core/widgets/textFormFeild_widget.dart';
import '../../../data/repository/login_repository.dart';
import '../../../data/web_services/login_services.dart';

class LoginScreen extends StatelessWidget {
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();

    return BlocConsumer<LoginCubit, LoginStates>(
      listener: (context, state) {
        if (state is LoginSuccessState) {
          if (state.loginModel.status != null) {
            print(state.loginModel.message);
            print(state.loginModel.data!.token);
            CacheHelper.saveData(
              key: 'token',
              value: state.loginModel.data!.token,
            ).then((value) {
              token = state.loginModel.data!.token!;
              Navigator.of(context).pushNamedAndRemoveUntil(
                  Routes.layoutScreen, (Route<dynamic> route) => false);
              //navigateAndFinish(context, LayoutScreen());
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
              'LOGIN',
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
                        'login now to browse or hot offers',
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
                        onChange: () {},
                        onTap: () {},
                        controller: passwordController,
                        type: TextInputType.visiblePassword,
                        suffix: LoginCubit.get(context).suffix,
                        onSubmit: (value) {
                          if (formKey.currentState!.validate()) {
                            LoginCubit.get(context).userLogin(
                                email: emailController.text,
                                password: passwordController.text);
                          }
                        },
                        isPassword: LoginCubit.get(context).isPassword,
                        suffixOnPressed: () {
                          LoginCubit.get(context).changePasswordVisibility();
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
                      ConditionalBuilder(
                        condition: state is! LoginLoadingState,
                        builder: (context) => defaultButton(
                            function: () {
                              if (formKey.currentState!.validate()) {
                                LoginCubit.get(context).userLogin(
                                    email: emailController.text,
                                    password: passwordController.text);
                              }
                            },
                            text: 'Login',
                            isUpperCase: true),
                        fallback: (context) =>
                            Center(child: CircularProgressIndicator()),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Don\'t have an account? '),
                          defaultTextButton(
                            function: () {
                              Navigator.pushNamed(
                                  context, Routes.registerScreen);
                              //  navigateTo(context, RegisterScreen());
                            },
                            text: 'Register',
                          ),
                        ],
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
