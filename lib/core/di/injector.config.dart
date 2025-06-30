// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:baraka_flutter_app/core/di/injectable_module.dart' as _i25;
import 'package:baraka_flutter_app/features/portfolio/domain/portfolio_repository.dart'
    as _i606;
import 'package:baraka_flutter_app/features/portfolio/presentation/bloc/portfolio_bloc.dart'
    as _i229;
import 'package:get_it/get_it.dart' as _i174;
import 'package:http/http.dart' as _i519;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final injectableModule = _$InjectableModule();
    gh.lazySingleton<_i519.Client>(() => injectableModule.client);
    gh.lazySingleton<_i606.PortfolioRepository>(
        () => injectableModule.providePortfolioRepo(gh<_i519.Client>()));
    gh.factory<_i229.PortfolioBloc>(
        () => _i229.PortfolioBloc(gh<_i606.PortfolioRepository>()));
    return this;
  }
}

class _$InjectableModule extends _i25.InjectableModule {}
