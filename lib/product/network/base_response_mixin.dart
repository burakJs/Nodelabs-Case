import 'package:nodelabs_case/product/network/model/base_error_model.dart';

mixin BaseResponseMixin<T> {
  T? get data;
  BaseErrorModel? get error;
}
