import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pop_flaktask/modules/Settings_Screen/cubit/cubit.dart';
import 'package:pop_flaktask/modules/Settings_Screen/cubit/states.dart';

class ComplaintPage extends StatelessWidget {
  ComplaintPage({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var complainController = TextEditingController();
  var phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: BlocProvider(
        child: Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: <Widget>[
                    //SizedBox(height: 100,),
                    TextFormField(
                      keyboardType: TextInputType.name,
                      decoration: const InputDecoration(
                        labelText: 'enter your name',
                      ),
                      controller: nameController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        labelText: 'enter your email',
                      ),
                      controller: emailController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: 'enter your phone',
                      ),
                      controller: phoneController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      maxLines: 4,
                      minLines: 3,
                      decoration: const InputDecoration(
                        labelText: 'enter your Complaint',
                      ),
                      controller: complainController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                    ),
                    BlocConsumer<ComplaintCubit, ComplaintStates>(
                      builder: (BuildContext context, state) {
                        return ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              ComplaintCubit.get(context).addNewComplaint(
                                  nameController.text,
                                  emailController.text,
                                  complainController.text);
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text('Processing Data')),
                              );
                            }
                          },
                          child: const Text('Submit'),
                        );
                      },
                      listener: (BuildContext context, Object? state) {},
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        create: (context) => ComplaintCubit(),
      ),
    );
  }
}
