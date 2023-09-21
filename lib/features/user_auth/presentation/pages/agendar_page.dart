import 'package:flutter/material.dart';
import 'package:ps_barber/services/firebase_service.dart';

class AgendarPage extends StatefulWidget {
  const AgendarPage({super.key});

  @override
  State<AgendarPage> createState() => _AgendarPageState();
}

class _AgendarPageState extends State<AgendarPage> {

  TextEditingController nombreController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController fechaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 150.00,
              width: 150.00,
              child: Image.asset('assets/1687297823359 (1).png'),
              ),

              Text(
                "Agendar cita",
                style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 30,
              ),
            Center(
              child: Container(
                child: TextField(
                  controller: nombreController,
                  decoration: const InputDecoration(
                    hintText: 'Nombre',
                  ),
                ),
              ),
            ),
            TextField(
              controller: descriptionController,
              decoration: const InputDecoration(
                hintText: 'Descripción',
              ),
            ),
            TextField(
              controller: fechaController,
              decoration: const InputDecoration(
                hintText: 'Fecha',
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: ElevatedButton(
                onPressed: ()async{
                  await addCitas(nombreController.text,descriptionController.text,fechaController.text).then((_) {
                    // Navigator.pushNamed(context, "/citas");
                });
              }, child: const Text("Guardar",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)),
            )
          ]),
      ),
      )
    );
  }
}