import 'package:terra_flutter_bridge/models/enums.dart';
import 'package:terra_flutter_bridge/models/responses.dart';
import '../../models/authtoken_response.dart';

abstract class TryTerraServiceDAO {
  Future<bool?> initTerra(String referenceId);
  Future<SuccessMessage> initConnection(Connection connection);
  Future<AuthTokenResponse> generateToken();
  Future<bool?> getActivity(Connection connection);
  Future<bool?> getDaily(Connection connection);
  Future<bool?> getSleep(Connection connection);
  Future<bool?> getBody(Connection connection);
  Future<bool?> getNutrition(Connection connection);
}
