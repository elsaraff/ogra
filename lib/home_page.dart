import 'package:edfa3/cubit/cubit.dart';
import 'package:edfa3/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = AppCubit.get(context);

          return Scaffold(
            appBar: AppBar(
              actions: [
                IconButton(
                  onPressed: () {
                    cubit.elograController.clear();
                    cubit.el3addController.clear();
                    cubit.elrayhController.clear();
                    cubit.elleaController.clear();
                    cubit.lelostaController.clear();
                  },
                  icon: const Icon(
                    Icons.close,
                    color: Colors.red,
                    size: 30,
                  ),
                )
              ],
            ),
            body: Padding(
              padding:
                  const EdgeInsets.only(bottom: 10.0, right: 10.0, left: 10.0),
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('الاجرة', style: TextStyle(fontSize: 20.0)),
                      const SizedBox(height: 15.0),
                      SizedBox(
                        width: 250.0,
                        child: TextFormField(
                          textAlign: TextAlign.center,
                          style: const TextStyle(fontSize: 20.0),
                          controller: cubit.elograController,
                          keyboardType: TextInputType.number,
                          onChanged: (value) {
                            elogra = double.parse(value);
                            cubit.calculateEllea();
                            cubit.calculateLelosta();
                          },
                          decoration: const InputDecoration(
                            hintText: 'كام يا اسطا',
                            prefixIcon: Icon(
                              Icons.money,
                              size: 35.0,
                            ),
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                      const SizedBox(height: 15.0),
                      const Text('العدد', style: TextStyle(fontSize: 20.0)),
                      const SizedBox(height: 15.0),
                      SizedBox(
                        width: 250.0,
                        child: TextFormField(
                          textAlign: TextAlign.center,
                          style: const TextStyle(fontSize: 20.0),
                          controller: cubit.el3addController,
                          keyboardType: TextInputType.number,
                          onChanged: (value) {
                            el3add = double.parse(value);
                            cubit.calculateEllea();
                            cubit.calculateLelosta();
                          },
                          decoration: const InputDecoration(
                            hintText: 'كام واحد',
                            prefixIcon: Icon(
                              Icons.people,
                              size: 35.0,
                            ),
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                      const SizedBox(height: 15.0),
                      const Text('رايح', style: TextStyle(fontSize: 20.0)),
                      const SizedBox(height: 15.0),
                      SizedBox(
                        width: 250.0,
                        child: TextFormField(
                          textAlign: TextAlign.center,
                          style: const TextStyle(fontSize: 20.0),
                          controller: cubit.elrayhController,
                          keyboardType: TextInputType.number,
                          onChanged: (value) {
                            elrayh = double.parse(value);
                            cubit.calculateEllea();
                            cubit.calculateLelosta();
                          },
                          decoration: const InputDecoration(
                            hintText: 'رايح كام جنيه',
                            prefixIcon: Icon(
                              Icons.arrow_upward_sharp,
                              size: 35.0,
                            ),
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      const Text('الباقي', style: TextStyle(fontSize: 20.0)),
                      const SizedBox(height: 15.0),
                      SizedBox(
                        width: 250.0,
                        child: TextFormField(
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              fontSize: 20.0, color: Colors.green),
                          controller: cubit.elleaController,
                          keyboardType: TextInputType.none,
                          decoration: const InputDecoration(
                            hintText: 'ليا كام جنيه',
                            prefixIcon: Icon(
                              Icons.arrow_downward_sharp,
                              size: 35.0,
                            ),
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                      const SizedBox(height: 15.0),
                      const Text('للسواق', style: TextStyle(fontSize: 20.0)),
                      const SizedBox(height: 15.0),
                      SizedBox(
                        width: 250.0,
                        child: TextFormField(
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              fontSize: 20.0, color: Colors.red),
                          controller: cubit.lelostaController,
                          keyboardType: TextInputType.none,
                          decoration: const InputDecoration(
                            hintText: 'ياخد كام جنيه',
                            prefixIcon: Icon(
                              Icons.directions_bus_outlined,
                              size: 35.0,
                            ),
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
