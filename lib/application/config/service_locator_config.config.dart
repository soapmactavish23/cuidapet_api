// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../database/database_connection.dart' as _i5;
import '../database/i_database_connection.dart' as _i4;
import 'database_connection_configuration.dart' as _i3;

// initializes the registration of main-scope dependencies inside of GetIt
_i1.GetIt $initGetIt(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  gh.factory<_i3.DatabaseConnectionConfiguration>(
      () => _i3.DatabaseConnectionConfiguration(
            host: gh<String>(),
            user: gh<String>(),
            port: gh<int>(),
            password: gh<String>(),
            databaseName: gh<String>(),
          ));
  gh.lazySingleton<_i4.IDatabaseConnection>(
      () => _i5.DatabaseConnection(gh<_i3.DatabaseConnectionConfiguration>()));
  return getIt;
}
