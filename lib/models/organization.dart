class Organization {
  String id;
  String name;
  String inviteCode;
  String type;
  String role;

  Organization({
    required this.id,
    required this.name,
    required this.inviteCode,
    required this.type,
    this.role = '',
  });
}
