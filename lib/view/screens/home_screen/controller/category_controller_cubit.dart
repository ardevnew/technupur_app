import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:test_app/config/repos/category_repo.dart';
import 'package:test_app/view/screens/home_screen/controller/category_model.dart';

part "category_controller_state.dart";

class category_controller_Cubit extends Cubit<category_controller_state> {
  category_controller_Cubit() : super(category_controller_Initial());

  Future get_category_all() async {
    emit(category_controller_Loading());

    Future.delayed(const Duration(seconds: 1));
    await All_category_Repo.get_all_categories().then((val) {
      // log('response ==  $val');

      final List<category_model> category_model_data = (val).map((item) => category_model.fromJson(item)).toList();

      emit(category_controller_Loaded(category_model_data));
      // } else {
      //   emit(category_controller_Error(val["errors"].toString()));
      // }
    });
  }
}
