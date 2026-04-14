enum RoutingNames {
  splash("/"),
  home("/home"),
  chat("/chat"),
  signIn("/signIn"),
  signUp("/signUp"),
  onBoarding("/onBoarding"),
  forgetPassword("/forgetPassword");

  final String route;

  const RoutingNames(this.route);

  static RoutingNames? fromRoute(String? route) {
    return RoutingNames.values.firstWhere((e) => e.route == route, orElse: () => RoutingNames.splash);
  }
}
