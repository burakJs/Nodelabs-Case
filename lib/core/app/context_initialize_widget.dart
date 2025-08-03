import 'package:nodelabs_case/core/context/app_provider.dart';
import 'package:provider/provider.dart';

class ContextInitializeWidget extends MultiProvider {
  ContextInitializeWidget({required super.child, super.key})
    : super(providers: AppProvider.items());
}
