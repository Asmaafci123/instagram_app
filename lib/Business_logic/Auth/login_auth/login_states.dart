abstract class LoginStates{}
class InitialLoginState extends LoginStates{}
class LoadingLoginState extends LoginStates{}
class SuccessLoginState extends LoginStates{
  final String uId;
  SuccessLoginState(this.uId);
}
class FailedLoginState extends LoginStates{}
