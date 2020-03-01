class Token {
  final String key;
  final int timestamp;

  Token({this.key, this.timestamp});

  factory Token.fromJson(Map<String, dynamic> json) {
    return Token(
      key: json['key'],
      timestamp: json['expires_at'],
    );
  }
}

