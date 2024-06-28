import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos_resto/bloc/login/login_bloc.dart';
import 'package:flutter_pos_resto/cubit/appsetting_cubit.dart';
import 'package:flutter_pos_resto/params/auth_param.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final _formKey = GlobalKey<FormState>();
  bool hidePassword = true;
  TextEditingController tecUsername = TextEditingController();
  TextEditingController tecPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // final param = AuthParam(username: 'user12345', password: '12345');
    // context.read<LoginBloc>().add(LoginPressed(param: param));

    return Scaffold(
      backgroundColor: Colors.black12,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Login Account',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white70
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Login To Explore Our Dapp',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(height: 32),
                  TextFormField(
                    controller: tecUsername,
                    style: TextStyle(color: Colors.white70),
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.email),
                      labelText: 'Username',
                      hintText: 'Enter your username',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your username';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    controller: tecPassword,
                    style: TextStyle(color: Colors.white70),
                    obscureText: hidePassword,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock),
                      labelText: 'Password',
                      hintText: 'Create your password',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          hidePassword ? Icons.visibility_off : Icons
                              .visibility,
                        ),
                        onPressed: () {
                          setState(() {
                            hidePassword = !hidePassword;
                          });
                        },
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 8),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        // TODO: Implement forgot password functionality
                      },
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          'Register ?',
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    child: BlocConsumer<LoginBloc, LoginState>(
                      listener: (context, state) {
                        // listener mendengar perubahan state
                        if(state is LoginSuccess){
                          resetForm();
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.loginResponse.message.toString())));
                          context.read<AppsettingCubit>().checkSession();
                        } else if (state is LoginError) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.message.toString())));
                        }
                      },
                      builder: (context, state) {
                        if(state is LoginLoading){
                          return const Center(child: CircularProgressIndicator(),);
                        } else if (state is LoginFatalError){
                          return Column(children: [
                            Text(state.message.toString()),
                            SizedBox(height: 18,),
                            FilledButton(onPressed: (){
                              resetForm();
                              context.read<LoginBloc>().add(LoginReset());
                            },
                                child: Text("kembali"))
                          ],);
                        }
                        return ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              String username = tecUsername.text;
                              String password = tecPassword.text;
                              final param = AuthParam(username: username, password: password);
                              context.read<LoginBloc>().add(LoginPressed(param: param));
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            padding: EdgeInsets.symmetric(vertical: 16),
                          ),
                          child: Text(
                            'Sign In',
                            style: TextStyle(fontSize: 16),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 16),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void resetForm() {
    tecUsername.text = "";
    tecPassword.text = "";
  }

}