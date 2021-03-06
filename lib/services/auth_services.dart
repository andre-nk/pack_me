part of "services.dart";

class AuthenticationService extends ChangeNotifier{
  final FirebaseAuth _auth;
  bool _isSigningIn;

  AuthenticationService(this._auth);

  bool get isSigningIn => _isSigningIn;
  Stream<User> get userState => _auth.authStateChanges();

  set isSigningIn(bool isSigningIn) {
    _isSigningIn = isSigningIn;
    notifyListeners();
  }

  Future<void> signInWithEmail({String email, String password}) async{
    try{
      isSigningIn = true;
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      isSigningIn = false;
    } on FirebaseAuthException catch(e){
      return e.message;
    }
  } 

  Future<void> signUpWithEmail({String email, String password, String userName}) async{
    try{
      isSigningIn = true;
      UserCredential user = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      user.user.updateProfile(
        displayName: userName ?? ""
      );
    } on FirebaseAuthException catch(e){
      return e.message;
    }
  }

   Future<void> signOut () async {
     isSigningIn = true;
     await _auth.signOut();
     isSigningIn = false;
  }
}