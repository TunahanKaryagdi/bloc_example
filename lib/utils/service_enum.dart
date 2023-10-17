enum ServiceEnum {
  baseUrl("https://reqres.in/api/login"),
  loginPath("/api/login");

  final String name;
  const ServiceEnum(this.name);
}
