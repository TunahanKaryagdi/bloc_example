enum ServiceEnum {
  baseUrl("https://localhost:44382/api/"),
  loginPath("auth/login"),
  homePath("users/getall");

  final String name;
  const ServiceEnum(this.name);
}
