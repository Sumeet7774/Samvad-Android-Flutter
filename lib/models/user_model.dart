class UserModel {
  final String user_id;
  final String email_id;

  UserModel({
    required this.user_id, 
    required this.email_id,
  });

  Map<String, dynamic> toMap() {
    return {
      'user_id': user_id, 
      'email_id': email_id
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      user_id: map['user_id'] ?? '',
      email_id: map['email_id'] ?? '',
    );
  }
}
