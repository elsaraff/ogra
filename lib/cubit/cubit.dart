import 'package:edfa3/cubit/states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';

double elogra;
double el3add;
double elrayh;
double ellea;
double lelosta;

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppIntialState());

  static AppCubit get(context) {
    return BlocProvider.of(context);
  }

  TextEditingController elograController = TextEditingController();
  TextEditingController el3addController = TextEditingController();
  TextEditingController elrayhController = TextEditingController();
  TextEditingController elleaController = TextEditingController();
  TextEditingController lelostaController = TextEditingController();

  void calculateEllea() {
    if (elograController.text.isEmpty ||
        el3addController.text.isEmpty ||
        elrayhController.text.isEmpty) {
      elleaController.clear();
    } else {
      ellea = elrayh - (elogra * el3add);
      elleaController.text = ellea.toStringAsFixed(2);
      emit(ElleaChangedState());
    }
  }

  void calculateLelosta() {
    if (elleaController.text.isEmpty) {
      lelostaController.clear();
    } else {
      lelosta = elrayh - ellea;
      lelostaController.text = lelosta.toStringAsFixed(2);
      emit(LelostaChangedState());
    }
  }
}
