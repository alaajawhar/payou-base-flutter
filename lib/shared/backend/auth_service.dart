import 'dart:convert';

import 'package:dio/dio.dart';

import '../utils/dateUtils.dart';

class AuthService {
  static final AuthService instance = AuthService();

  final String _userLookUp = '/public/auth/v1/lookup';
  final String _signInEndpoint = '/public/auth/v1/signin';
  final String _signUpEndpoint = '/public/auth/v1/signup';
  final String _signOutEndpoint = '/secure/auth/v1/signout';
  final String _refreshToken = '/public/auth/v1/token/refresh';
  final String _resetPasswordEndpoint = '/secure/auth/v1/password/reset';
  final String _getUserDetailsEndpoint = '/secure/auth/v1/user';
  final Dio _dio = Dio();

  AuthService() {
    _dio.options.baseUrl = 'http://10.0.2.2:3000';
    _dio.options.contentType = Headers.jsonContentType; // 5 seconds
    _dio.options.responseType = ResponseType.json; // 5 seconds
    _dio.options.connectTimeout = const Duration(seconds: 5000); // 5 seconds
    _dio.options.receiveTimeout = const Duration(seconds: 3000); // 3 seconds
  }

  Future<UserLookUpResponse> userLookUp(UserLookUpRequest request) async {
    Response response = await _dio.post(_userLookUp, data: request.toJson());
    return UserLookUpResponse.fromMap(response.data);
  }

  Future<TokenResponse> signin(SignInRequest request) async {
    Response response = await _dio.post(_signInEndpoint, data: request);
    return TokenResponse.fromJson(response.data);
  }

  Future<TokenResponse> signup(SignUpRequest request) async {
    Response response = await _dio.post(_signUpEndpoint, data: request);
    return TokenResponse.fromJson(response.data);
  }

  Future<TokenResponse> refreshToken(RefreshTokenRequest request) async {
    Response response = await _dio.post(_refreshToken, data: request);
    return TokenResponse.fromJson(response.data);
  }

  Future<TokenResponse> resetPassword(ResetPasswordRequest request) async {
    Response response = await _dio.post(_resetPasswordEndpoint, data: request);
    return TokenResponse.fromJson(response.data);
  }

  Future<SuccessResponse> signOut() async {
    Response response = await _dio.post(_signOutEndpoint);
    return SuccessResponse.fromJson(response.data);
  }

  Future<GetUserDetailsResponse> getUserDetails() async {
    Response response = await _dio.get(_getUserDetailsEndpoint);
    return GetUserDetailsResponse.fromJson(response.data);
  }
}

class SignInRequest {
  String? username;
  String? password;

  SignInRequest({
    this.username,
    this.password,
  });

  factory SignInRequest.fromRawJson(String str) =>
      SignInRequest.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SignInRequest.fromJson(Map<String, dynamic> json) => SignInRequest(
        username: json["username"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "username": username,
        "password": password,
      };
}

class TokenResponse {
  String? accessToken;
  String? refreshToken;

  TokenResponse({
    this.accessToken,
    this.refreshToken,
  });

  factory TokenResponse.fromRawJson(String str) =>
      TokenResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory TokenResponse.fromJson(Map<String, dynamic> json) => TokenResponse(
        accessToken: json["accessToken"],
        refreshToken: json["refreshToken"],
      );

  Map<String, dynamic> toJson() => {
        "accessToken": accessToken,
        "refreshToken": refreshToken,
      };
}

class RefreshTokenRequest {
  String? refreshToken;

  RefreshTokenRequest({
    this.refreshToken,
  });

  factory RefreshTokenRequest.fromRawJson(String str) =>
      RefreshTokenRequest.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory RefreshTokenRequest.fromJson(Map<String, dynamic> json) =>
      RefreshTokenRequest(
        refreshToken: json["refreshToken"],
      );

  Map<String, dynamic> toJson() => {
        "refreshToken": refreshToken,
      };
}

class SignUpRequest {
  String? username;
  String? firstName;
  String? lastName;
  String? email;
  String? password;
  DateTime? dateOfBirth;

  SignUpRequest({
    this.username,
    this.firstName,
    this.lastName,
    this.email,
    this.password,
    this.dateOfBirth,
  });

  factory SignUpRequest.fromRawJson(String str) =>
      SignUpRequest.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SignUpRequest.fromJson(Map<String, dynamic> json) => SignUpRequest(
        username: json["username"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        email: json["email"],
        password: json["password"],
        dateOfBirth: json["dateOfBirth"],
      );

  Map<String, dynamic> toJson() => {
        "username": username,
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
        "password": password,
        "dateOfBirth": dateOfBirth,
      };
}

class SuccessResponse {
  bool? success;
  String? message;

  SuccessResponse({
    this.success,
    this.message,
  });

  factory SuccessResponse.fromRawJson(String str) =>
      SuccessResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SuccessResponse.fromJson(Map<String, dynamic> json) =>
      SuccessResponse(
        success: json["success"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
      };
}

class ResetPasswordRequest {
  String? oldPassword;
  String? newPassword;

  ResetPasswordRequest({
    this.oldPassword,
    this.newPassword,
  });

  factory ResetPasswordRequest.fromRawJson(String str) =>
      ResetPasswordRequest.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ResetPasswordRequest.fromJson(Map<String, dynamic> json) =>
      ResetPasswordRequest(
        oldPassword: json["oldPassword"],
        newPassword: json["newPassword"],
      );

  Map<String, dynamic> toJson() => {
        "oldPassword": oldPassword,
        "newPassword": newPassword,
      };
}

class GetUserDetailsResponse {
  String? username;
  String? firstName;
  String? lastName;
  String? email;
  DateTime? dateOfBirth;

  GetUserDetailsResponse({
    this.username,
    this.firstName,
    this.lastName,
    this.email,
    this.dateOfBirth,
  });

  factory GetUserDetailsResponse.fromRawJson(String str) =>
      GetUserDetailsResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory GetUserDetailsResponse.fromJson(Map<String, dynamic> json) =>
      GetUserDetailsResponse(
        username: json["username"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        email: json["email"],
        dateOfBirth: CustomDateUtils.convertToDateTime(json["dateOfBirth"]),
      );

  Map<String, dynamic> toJson() => {
        "username": username,
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
        "dateOfBirth": dateOfBirth,
      };
}

class UserLookUpRequest {
  String? username;

  UserLookUpRequest({
    this.username,
  });

  factory UserLookUpRequest.fromJson(String str) =>
      UserLookUpRequest.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UserLookUpRequest.fromMap(Map<String, dynamic> json) =>
      UserLookUpRequest(
        username: json["username"],
      );

  Map<String, dynamic> toMap() => {
        "username": username,
      };
}

class UserLookUpResponse {
  bool isActive;

  UserLookUpResponse({
    required this.isActive,
  });

  factory UserLookUpResponse.fromJson(String str) =>
      UserLookUpResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UserLookUpResponse.fromMap(Map<String, dynamic> json) =>
      UserLookUpResponse(
        isActive: json["isActive"],
      );

  Map<String, dynamic> toMap() => {
        "isActive": isActive,
      };
}
