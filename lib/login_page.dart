import 'package:flutter/material.dart';
import 'package:nauggets_internship/api_service.dart';
import 'package:nauggets_internship/firstscreen.dart';
import 'package:nauggets_internship/progressHUD.dart';
import 'login_model.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  GlobalKey<FormState> globalFormKey = new GlobalKey<FormState>();
  bool hidePassword = true;
  late LoginRequestModel requestModel;
  bool isApiCallProcess= false;


  @override
  void initState(){
    super.initState();
    requestModel = new LoginRequestModel(email: '', password: '');
  }

  @override
  Widget build(BuildContext context) {
    return ProgressHUD(
        child: _uiSetup(context),
        inAsyncCall: isApiCallProcess,
        opacity: 0.3,
    );
  }

  @override
  Widget _uiSetup(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.blue,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                  margin: EdgeInsets.symmetric(vertical: 85, horizontal: 20),
                  child: Form(
                    key: globalFormKey,
                    child: Column(
                      children: [
                        SizedBox(height: 20,),
                        //Text("Welcome, to Sing in continue",style: TextStyle(fontSize: 35,color: Colors.white),),
                        RichText(
                          text: TextSpan(
                            style: TextStyle(color: Colors.white, fontSize: 35),
                            children: <TextSpan>[
                              TextSpan(
                                text: 'Welcome',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              TextSpan(text: ', to Sign in continue'),
                            ],
                          ),
                        ),

                        SizedBox(
                          height: 40,
                        ),
                        Container(
                          width: 280,
                          height: 70,
                          decoration: BoxDecoration(
                            color: Colors.white24,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          //padding: EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                            Container(width: 140,height: 70,decoration: BoxDecoration(
                              color: Colors.white24,
                              borderRadius: BorderRadius.circular(8.0),
                              // Rounded corners of the container
                            ),),
                              TextButton( onPressed: () {},
                                child: Text("Sing Up",textAlign: TextAlign.right,
                                  style: TextStyle(color: Colors.white, fontSize: 35,),
                                ),
                              ),
                            ],
                          ),
                        ),

                        SizedBox(height: 80,),

                        Container(
                            width: 280,
                            child: Text("Email Address", textAlign: TextAlign.left, style: TextStyle(color: Colors.white),)),
                        new TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          onSaved: (input) => requestModel.email = input! ,
                          validator: (input) => !input!.contains("@") ? "Email Id should be valid" : null,
                          decoration: new InputDecoration(
                            hintText: "example@gmail.com",hintStyle: TextStyle(color: Colors.white70),
                            enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white.withOpacity(0.2))
                            ),
                            focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white70)
                            ),
                          ),
                          style: TextStyle(color: Colors.white),
                        ),
                        SizedBox(height: 10,),
                        Container(
                            width: 280,
                            child: Text("Password", textAlign: TextAlign.left, style: TextStyle(color: Colors.white),)),
                        new TextFormField(
                          keyboardType: TextInputType.text,
                          onSaved: (input) => requestModel.password = input!,
                          validator: (input) => input!.length < 3 ? "Password should be more than 3 characters" : null,
                          obscureText:hidePassword ,
                          decoration: new InputDecoration(
                            hintText: "absc123@",hintStyle: TextStyle(color: Colors.white70),
                            enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white.withOpacity(0.2))
                            ),
                            focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white70)
                            ),
                          ),
                          style: TextStyle(color: Colors.white),
                        ),
                        SizedBox(height: 30,),
                        Container(
                          width: 200,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: () {
                              if(validateAndSave()) {
                                setState(() {
                                  isApiCallProcess = true;
                                });
                                print(requestModel.toJson());
                                APIService apiService = new APIService();
                                apiService.login(requestModel).then((value){
                                 if (value != null) {
                                   setState(() {
                                     isApiCallProcess = false;
                                   });
                                   if (value.token.isNotEmpty) {
                                     final snackBar = SnackBar(
                                       content: Text("Login Successfull"),
                                     );
                                     ScaffoldMessenger.of(context).showSnackBar(
                                         snackBar);
                                     Navigator.push(
                                       context,
                                       MaterialPageRoute(builder: (
                                           context) => const FirstPage()),
                                     );
                                   }
                                   else {
                                     final snackBar = SnackBar(
                                       content: Text("User does not exist"),
                                     );
                                     ScaffoldMessenger.of(context).showSnackBar(
                                         snackBar);
                                   }
                                 }
                                });
                              }
                            },

                              child: Text("Sign In", style: TextStyle(color: Colors.blue,fontSize: 25),),
                            style: ButtonStyle(
                                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                                backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5.0),
                                        side: BorderSide(color: Colors.blue)
                                    )
                                )
                            ),
                          ),
                        ),
                        // SizedBox(height: 10,),
                        OutlinedButton(onPressed: () {},
                            child: Text("Forgot your password?", style: TextStyle(color: Colors.white70,fontSize: 10),),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  bool validateAndSave(){
    final form = globalFormKey.currentState;
    if(form!.validate()){
      form.save();
      return true;
    }
    return false;

  }
}
