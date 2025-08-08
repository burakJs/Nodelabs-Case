import 'package:nodelabs_case/product/network/model/base_error_model.dart';
import 'package:vexana/vexana.dart';

typedef AppResponseType<T extends INetworkModel<T>> = ({
  T? data,
  BaseErrorDataModel? error,
  bool success,
})?;
