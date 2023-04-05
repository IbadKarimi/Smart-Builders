
class CurrentUser{

  CurrentUser({this.email});
  String? email;
   void SetCurrentUserEmail(String email){
     this.email=email;
   }
   String getCurrentUserEmail(){
     return email!;
   }

}