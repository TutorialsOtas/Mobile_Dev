abstract class UserRepository{
  stream<MyUser?> get user;
  Future<MyUser> signUp(MyUser myUser, String password);
  Future<void> setUserdata(MyUser user);
  Future<void> signIn(String email, String password);
  Future<void> logOut();
}