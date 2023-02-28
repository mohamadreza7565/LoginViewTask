import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:loginuitask/core/client/HttpClient.dart';
import 'package:loginuitask/res/MaterialColors.dart';

import '../core/BaseDataState.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

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
  Widget build(BuildContext context) {
    return Center(
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
                  MaterialButton(
                    onPressed: () async {
                      login("091067689").then((value) {
                        if (value is Success) {
                          print("Success");
                        } else {
                          print("Error");
                        }
                      });
                    },
                    child: const SizedBox(
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
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
