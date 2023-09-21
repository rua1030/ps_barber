import 'package:flutter/material.dart';
import 'package:ps_barber/services/firebase_service.dart';

class EditarPage extends StatefulWidget {
  const EditarPage({super.key});

  @override
  State<EditarPage> createState() => _EditarPageState();
}

class _EditarPageState extends State<EditarPage> {
  TextEditingController nombreController = TextEditingController(text: "");
  TextEditingController descripcionController = TextEditingController(text: "");
  TextEditingController fechaController = TextEditingController(text: "");
  @override
  Widget build(BuildContext context) {
    final Map arguments = ModalRoute.of(context)!.settings.arguments as Map;
    nombreController.text=arguments['nombre'];
    descripcionController.text=arguments['descripcion'];
    fechaController.text=arguments['fecha'];
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Actualizar',
              style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 30,
              ),
              TextField(
                controller: nombreController,
                decoration: const InputDecoration(
                hintText: 'Nombre',
              ),
              ),
              TextField(
                controller: descripcionController,
                decoration: const InputDecoration(
                hintText: 'Descripcion',
              ),),
              TextField(
                controller: fechaController,
                decoration: const InputDecoration(
                hintText: 'Fecha',
              ),),
              Padding(
                padding: const EdgeInsets.all(60.0),
                child: Row(
                  children: [
                    ElevatedButton(
                    onPressed: () async {
                       await updateCitas(arguments['uid'],nombreController.text,descripcionController.text,fechaController.text)
                       .then((_) {
                        Navigator.pop(context);
                       } );
                          }, child: 
                          const Text("Actualizar")),
                          ElevatedButton(onPressed: (){Navigator.pop(context);},
                           child: const Text("Cancelar"))    
                  ],
                ),
              ),
            ],
            ),
          )
        ),
    );
  }
}