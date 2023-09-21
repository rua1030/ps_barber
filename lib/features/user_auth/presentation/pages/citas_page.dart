import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:ps_barber/services/firebase_service.dart';

class CitasPage extends StatefulWidget {
  const CitasPage({super.key});

  @override
  State<CitasPage> createState() => _CitasPageState();
}

class _CitasPageState extends State<CitasPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: FutureBuilder(
          future: getCitas(), 
          builder: ((context, snapshot){
            if(snapshot.hasData){
              return ListView.builder(
                itemCount: snapshot.data?.length,
                itemBuilder: (context, index) {
                  return Center(
                    child: Container(
                      decoration: BoxDecoration(color:Colors.grey[200],borderRadius:BorderRadius.circular(18) ),
                      margin: EdgeInsets.only(bottom: 10),
                      child: Padding(
                        padding:EdgeInsets.symmetric(vertical: 25,horizontal: 10),
                        child: Column(
                          children: [
                            const Text('Cita'),
                            Dismissible(
                              onDismissed: (direction)async {
                                await deleteCitas(snapshot.data?[index]['uid']);
                                snapshot.data?.removeAt(index);
                              },
                              confirmDismiss: (direction)async{
                                bool result =false;
                                      
                                result=await showDialog(context: context, builder: (context){
                                  return AlertDialog(
                                    title:Text("¿Está seguro de eliminar la cita?"),
                                    actions: [
                                      TextButton(onPressed: (){
                                        return Navigator.pop(context,false,);
                                      }, child: const Text('Cancelar',style: TextStyle(color: Colors.red),)),
                                      TextButton(onPressed: (){
                                        return Navigator.pop(context,true,);
                                      }, child: const Text('Si, estoy seguro'))
                                    ],
                                  );
                                });
                                return result;
                              },
                              background:Container(
                                color: Colors.red,
                                child: const Icon(Icons.delete_sweep_outlined),
                              ),
                              direction: DismissDirection.startToEnd,
                              key: Key(snapshot.data?[index]['uid']),
                              child: ListTile(
                                title: Text(snapshot.data?[index]['nombre']),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text("Descripción"),
                                    Text(snapshot.data?[index]['descripcion']),
                                    const Text("Fecha y Hora"),
                                    Text(snapshot.data?[index]['fecha']),
                                  ]),
                                onTap:(() async{
                                  await Navigator.pushNamed(context, '/editar', arguments: {
                                    "nombre":snapshot.data?[index]['nombre'],
                                    "descripcion":snapshot.data?[index]['descripcion'],
                                    "fecha":snapshot.data?[index]['fecha'],
                                    "uid": snapshot.data?[index]['uid'],
                                    //agregar igual
                                  });
                                  setState(() {});
                                })
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
            );
            }else{
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            
          }) ),
      ),
    );
  }

}

