import 'package:hive_ce/hive.dart';
import 'package:nodelabs_case/core/cache/model/test_model.dart';

@GenerateAdapters([AdapterSpec<TestModel>()])
part 'hive_adapter.g.dart';
