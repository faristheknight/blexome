// lib/database/user.dart

class User {
  int id;
  String userId;
  String deviceId;
  String sha;
  String token;
  String expiry;
  String refreshToken;

  User({
    this.id = 0,
    required this.userId,
    required this.deviceId,
    required this.sha,
    required this.token,
    required this.expiry,
    required this.refreshToken,
  });

  // Convert a User into a Map. The keys must correspond to the names of the columns in the database.
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'userId': userId,
      'deviceId': deviceId,
      'sha': sha,
      'token': token,
      'expiry': expiry,
      'refreshToken': refreshToken,
    };
  }

  // A method that retrieves a User from a Map.
  User.fromMap(Map<String, dynamic> map)
      : id = map['id'],
        userId = map['userId'],
        deviceId = map['deviceId'],
        sha = map['sha'],
        token = map['token'],
        expiry = map['expiry'],
        refreshToken = map['refreshToken'];
}
