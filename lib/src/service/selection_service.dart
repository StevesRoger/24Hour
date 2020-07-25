import 'package:twentyfour_hour/src/model/response_entity.dart';
import 'package:twentyfour_hour/src/util/http_util.dart';
import 'package:twentyfour_hour/src/util/tools.dart';

class SelectionService {
  Future<ResponseEntity> listCountry() async {
    try {
      var response = await dio.get(
        '/utility/country-code',
      );
      return ResponseEntity.fromResponse(response);
    } catch (ex) {
      logError(ex.toString());
      return ResponseEntity.errorWithMessage(httpUtil.handleError(ex));
    }
  }
}
