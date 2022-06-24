import 'package:crud/models/estados.dart';
import 'package:get/get.dart';

class EstadosController extends GetxController {

   RxString selected = estados[0].obs;

   void setSelected(String value){
     selected.value = value;
   }

}