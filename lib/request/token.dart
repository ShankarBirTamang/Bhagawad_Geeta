// To parse this JSON data, do
//
//     final requestToken = requestTokenFromJson(jsonString);

import 'dart:convert';

RequestToken requestTokenFromJson(String str) => RequestToken.fromJson(json.decode(str));

String requestTokenToJson(RequestToken data) => json.encode(data.toJson());

class RequestToken {
    String accessToken;
    String tokenType;
    String scope;

    RequestToken({
        required this.accessToken,
        required this.tokenType,
        required this.scope,
    });

    factory RequestToken.fromJson(Map<String, dynamic> json) => RequestToken(
        accessToken: json["access_token"],
        tokenType: json["token_type"],
        scope: json["scope"],
    );

    Map<String, dynamic> toJson() => {
        "access_token": accessToken,
        "token_type": tokenType,
        "scope": scope,
    };
}
