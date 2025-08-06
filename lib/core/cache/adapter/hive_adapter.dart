import 'package:hive_ce/hive.dart';
import 'package:nodelabs_case/core/cache/model/user_model.dart';

@GenerateAdapters([AdapterSpec<UserCacheModel>()])
part 'hive_adapter.g.dart';
