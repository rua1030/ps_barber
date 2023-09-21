import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

FirebaseFirestore db = FirebaseFirestore.instance;

Future<List> getCitas() async{
  List citas = [];
  CollectionReference collectionReference = db.collection('citas');

  QuerySnapshot queryCitas = await collectionReference.get();

  for(var doc in queryCitas.docs){
    final Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    final cita = {
      "nombre": data['nombre'],
      "descripcion": data['descripcion'],
      "fecha": data['fecha'],
      "uid":doc.id,
    };
    citas.add(cita);
  }
  
  return citas;
}

Future<void> addCitas(String nombre, String descripcion, String fecha) async {
  await db.collection("citas").add({"nombre": nombre, "descripcion":descripcion, "fecha":fecha});
}

Future<void> updateCitas(String uid,String newNombre,String newDescripcion,String newFecha)async{

  await db.collection("citas").doc(uid).set({"nombre":newNombre,"descripcion":newDescripcion,"fecha":newFecha});
}

//borrar datos ejjejej

Future<void>deleteCitas(String uid) async{
  await db.collection('citas').doc(uid).delete();
}