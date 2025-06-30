import 'dart:convert';

import 'package:baraka_flutter_app/features/portfolio/domain/portfolio_repository.dart';
import 'package:http/http.dart' as http;

import '../../../core/api_constants.dart';
import '../models/portfolio_model.dart';

class PortfolioRepositoryImpl implements PortfolioRepository {
  final http.Client client;

  PortfolioRepositoryImpl({required this.client});

  @override
  Future<PortfolioModel> getPortfolio() async {
    // TODO: implement getPortfolio
    const String endpoint =
        ApiConstants.baseUrl + ApiConstants.fetchPortfolioEndpoint;

    final response = await client
        .get(Uri.parse(endpoint))
        .timeout(const Duration(seconds: 10));

    if (response.statusCode == 200) {
      final decoded = jsonDecode(response.body);
      final portfolioJson = decoded['portfolio'];
      return PortfolioModel.fromJson(portfolioJson);
    } else {
      throw Exception('Failed to load portfolio data');
    }
  }
}
