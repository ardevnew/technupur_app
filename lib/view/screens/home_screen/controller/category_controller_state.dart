part of "category_controller_cubit.dart";

@immutable
sealed class category_controller_state {}

final class category_controller_Initial extends category_controller_state {}

final class category_controller_Loading extends category_controller_state {}

final class category_controller_Loaded extends category_controller_state {
  final List<category_model> category_model_data;
  category_controller_Loaded(this.category_model_data);
}

final class category_controller_Error extends category_controller_state {
  final String errorMessage;
  category_controller_Error(this.errorMessage);
}
