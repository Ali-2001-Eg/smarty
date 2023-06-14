class ParentModel {
  final String name;
  final String password;
  final String email;
  ParentModel({
    required this.email,
    required this.name,
    required this.password,
  });
  Map<String, dynamic> toJson() {
    return {};
  }
}
