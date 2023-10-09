import 'package:dio/dio.dart';

import 'network_exceptions.dart';
import 'network_status_code.dart';

class NetworkHandler {
  static handleResponse(response) => _handleResponse(response);
  static _handleResponse(Response response) {
    switch (response.statusCode) {
      case NetworkStatusCode.noContent:
        throw NoContentException(
            message: "No Content Found!",
            url: response.data);
      case NetworkStatusCode.partialContent:
        throw PartialContentException(
            message: "Partial Content Found",
            url: response.data);
      case NetworkStatusCode.badRequest:
        throw BadRequestException(
            message: "Bad Request!", url: response.data);
      case NetworkStatusCode.unauthorized:
        throw UnauthorizedException(
            message: "Unauthorized", url: response.data);
      case NetworkStatusCode.forbidden:
        throw ForbiddenException(
            message: "Forbidden Content",
            url: response.data);
      case NetworkStatusCode.notFound:
        throw NotFoundException(
            message: "Not Found", url: response.data);
      case NetworkStatusCode.invalidRequest:
        throw InvalidRequestException(
            message: "Invalid Request", url: response.data);
      case NetworkStatusCode.invalidData:
        throw NoContentException(
            message: "Invalid Data", url: response.data);
      case NetworkStatusCode.internalServerError:
        throw InternalServerErrorException(
            message: "Internal Server Error",
            url: response.data);
      case NetworkStatusCode.badGateway:
        throw BadGatewayException(
            message: "Bad Gateway", url: response.data);
      default:
        throw FetchDataException(
            message: "Unable to Fetch Data",
            url: response.data);
    }
  }
}
