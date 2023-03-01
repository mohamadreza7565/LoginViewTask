import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loginuitask/res/material_colors.dart';
import 'package:loginuitask/screen/login/login_bloc.dart';
import 'package:loginuitask/screen/verify/verify_screen.dart';
import 'package:provider/provider.dart';

import '../../core/base_api_data_state.dart';
import '../../data/repo/auth_repo.dart';
import '../../widgets/GlobalWidgets.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: LoginBody(),
    );
  }
}

class LoginBody extends StatelessWidget {
  const LoginBody({super.key});

  @override
  Widget build(BuildContext buildContext) {
    String phoneNumber = '';

    return BlocProvider(
      create: (context) => LoginBloc(context.read<AuthRepo>()),
      child: Center(
        child: SizedBox(
          width: 400,
          height: 400,
          child: Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                const Text(
                  'ورود به حساب کاربری',
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Text(
                      'لطفا شماره همراه خود را وارد کنید',
                    ),
                    Padding(
                      padding: const EdgeInsets.all(40.0),
                      child: SizedBox(
                        width: double.infinity,
                        height: 55,
                        child: TextField(
                          onChanged: (value) {
                            phoneNumber = value;
                          },
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            labelText: 'شماره همراه *',
                          ),
                        ),
                      ),
                    ),
                    Consumer<AuthRepo>(
                      builder: (context, model, child) {
                        return MaterialButton(
                          onPressed: () async {
                            if(phoneNumber==''){
                              ScaffoldMessenger.of(buildContext)
                                  .showSnackBar(snackBar('تلفن همراه خود را وارد کنید'));
                            }else {
                              context
                                  .read<LoginBloc>()
                                  .add(LoginStart(phoneNumber));
                            }
                          },
                          child: BlocListener<LoginBloc, LoginState>(
                            listener: (context, state) {
                              if (state is LoginSuccess) {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => VerifyScreen()));
                              } else if (state is LoginError) {
                                ScaffoldMessenger.of(buildContext)
                                    .showSnackBar(snackBar(state.error.error));
                              }
                            },
                            child: BlocBuilder<LoginBloc, LoginState>(
                              builder: (context, state) {
                                if (state is LoginLoading) {
                                  return loadingButton();
                                } else if (state is LoginError) {
                                  return nextButtonWidget();
                                } else {
                                  return nextButtonWidget();
                                }
                              },
                            ),
                          ),
                        );
                      },
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget nextButtonWidget() {
    return const SizedBox(
      width: 150,
      height: 50,
      child: Card(
        color: MaterialColors.primaryAccentColor,
        child: Center(
          child: Text(
            "ادامه",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }

  Widget loadingButton() {
    return const SizedBox(
      width: 150,
      height: 50,
      child: Card(
        color: MaterialColors.primaryAccentColor,
        child: Center(
          child: CircularProgressIndicator(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
