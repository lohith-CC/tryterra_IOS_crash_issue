import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart';
import 'package:terra_flutter_bridge/models/enums.dart';
import 'package:terra_flutter_bridge/models/responses.dart';
import 'package:terra_flutter_bridge/terra_flutter_bridge.dart';
import '../../constants/scopes.dart';
import '../../models/authtoken_response.dart';
import '../dao/tryterra_service_dao.dart';

class TryTerraDataBrokerService extends TryTerraServiceDAO {
  final String apikey = 'gFB0_wTTwjIZ_iKgPvCeNqbt-7sppH17';
  final String dev_id = 'alyfinc-testing-2Cr237Oqov';
  final String redirectUrl = 'https://www.google.co.in/';

  @override
  Future<bool> initTerra(String referenceId) async {
    try {
      var response = await TerraFlutter.initTerra(dev_id, referenceId);
      if (response != null && response.success != null) {
        print(
            "terra init -------------------------------------------------${response.success}");
        return response.success!;
      }
      return false;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<SuccessMessage> initConnection(Connection connection) async {
    try {
      var authTokenResponse = await generateToken();
      var response = await TerraFlutter.initConnection(
        connection,
        authTokenResponse.token,
        true,
        scopes,
      );
      print("printing from initConnection ${response!.success}");
      print(response.error);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<UserId?> getUserId(Connection connection) async {
    try {
      var userId = await TerraFlutter.getUserId(connection);
      return userId;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<AuthTokenResponse> generateToken() async {
    final response = await post(
      Uri.parse("https://api.tryterra.co/v2/auth/generateAuthToken"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Dev-Id': dev_id,
        'x-api-key': apikey,
      },
    );
    if (response.statusCode == 200) {
      return AuthTokenResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to create data.');
    }
  }

  @override
  Future<bool?> getActivity(Connection connection) async {
    DateTime startDate =
        DateTime.now().toUtc().subtract(const Duration(days: 365));
    DateTime endDate = DateTime.now().toUtc();
    try {
      var response = await TerraFlutter.getActivity(
          connection, startDate, endDate,
          toWebhook: true);
      return response?.success ?? false;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<bool?> getDaily(Connection connection) async {
    DateTime startDate =
        DateTime.now().toUtc().subtract(const Duration(days: 365));
    DateTime endDate = DateTime.now().toUtc();
    try {
      var response = await TerraFlutter.getDaily(connection, startDate, endDate,
          toWebhook: true);
      return response?.success ?? false;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<bool?> getSleep(Connection connection) async {
    DateTime startDate =
        DateTime.now().toUtc().subtract(const Duration(days: 365));
    DateTime endDate = DateTime.now().toUtc();
    try {
      var response = await TerraFlutter.getSleep(connection, startDate, endDate,
          toWebhook: true);
      return response?.success ?? false;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<bool?> getBody(Connection connection) async {
    DateTime startDate =
        DateTime.now().toUtc().subtract(const Duration(days: 365));
    DateTime endDate = DateTime.now().toUtc();
    try {
      var response = await TerraFlutter.getBody(connection, startDate, endDate,
          toWebhook: true);
      return response?.success ?? false;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<bool?> getNutrition(Connection connection) async {
    DateTime startDate =
        DateTime.now().toUtc().subtract(const Duration(days: 365));
    DateTime endDate = DateTime.now().toUtc();
    try {
      var response = await TerraFlutter.getNutrition(
          connection, startDate, endDate,
          toWebhook: true);
      return response?.success ?? false;
    } catch (e) {
      rethrow;
    }
  }
}
