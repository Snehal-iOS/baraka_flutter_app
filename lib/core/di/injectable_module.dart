import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';

import '../../features/portfolio/data/portfolio_repository_impl.dart';
import '../../features/portfolio/domain/portfolio_repository.dart';

@module
abstract class InjectableModule {
  @lazySingleton
  http.Client get client => http.Client();

  @LazySingleton(as: PortfolioRepository)
  PortfolioRepositoryImpl providePortfolioRepo(http.Client client) =>
      PortfolioRepositoryImpl(client: client);
}
