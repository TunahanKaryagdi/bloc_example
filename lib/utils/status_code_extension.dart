import 'package:bloc_example/utils/status_code_enum.dart';

extension StatusCodeExtension on int? {
  StatusCode get httpStatusCode {
    if (this == null) return StatusCode.unknown;

    switch (this!) {
      case < 200:
        return StatusCode.continuE;
      case >= 200 && < 300:
        return StatusCode.ok;
      case 401:
        return StatusCode.unauthorized;
      case > 400 && <= 500:
        return StatusCode.notFound;
      default:
        return StatusCode.serverError;
    }
  }
}
