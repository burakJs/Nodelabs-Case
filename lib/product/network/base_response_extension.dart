import 'package:nodelabs_case/product/network/app_response_type.dart';
import 'package:vexana/vexana.dart';

extension AppResponseTypeExtension<T extends INetworkModel<T>>
    on AppResponseType<T> {
  bool get hasError => this?.success == false;

  String? get errorMessage => this?.error?.message;
}
