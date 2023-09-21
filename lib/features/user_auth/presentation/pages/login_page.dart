
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ps_barber/features/user_auth/presentation/pages/sign_up_page.dart';
import 'package:ps_barber/features/user_auth/presentation/widgets/form_container_widget.dart';
import '../../firebase_auth_implementation/firebase_auth_services.dart';



class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {


  final FirebaseAuthService _auth = FirebaseAuthService();

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();


  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
              height: 180.00,
              width: 180.00,
              child: Image.asset('assets/1687297823359 (1).png'),
              ),

              Text(
                "Iniciar sesion",
                style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 30,
              ),
              FormContainerWidget(
                controller: _emailController,
                hintText: "Correo",
                isPasswordField: false,
              ),
              SizedBox(height: 10,),
              FormContainerWidget(
                controller: _passwordController,
                hintText: "Contraseña",
                isPasswordField: true,
              ),
              SizedBox(height: 30,),
              GestureDetector(
                onTap: _signIn,
                child: Container(
                  width: double.infinity,
                  height: 45,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(child:Text("Iniciar",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)),
                ),
              ),
              SizedBox(height: 20,),
              Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("No tienes una cuenta?"),
                  SizedBox(width: 5,),
                  GestureDetector(
                      onTap: (){
                        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => SignUpPage()), (route) => false);
                      },
                      child: Text("Registrate",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),))
                ],
              )


            ],
          ),
        ),
      ),
    );
  }

  void _signIn() async {

    String email = _emailController.text;
    String password = _passwordController.text;

    User? user = await _auth.signInWithEmailAndPassword(email, password);

    if (user!= null){
      print("User is successfully signedIn");
      Navigator.pushNamed(context, "/home");
    } else{
      print("Some error happend");
    }

  }
}
