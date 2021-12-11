import 'package:colegio_juventude/app/modules/registration/registration_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

class RegisterDropdownForm extends GetView<RegistrationController> {

  RegisterDropdownForm({
    required List<String> items,
    required String itemForm,
    required int index, Key? key })
       :_items = items,
     _itemForm = itemForm,
     _index = index,
     super(key: key);

  final List<String> _items;
  String _itemForm;
  final int _index;

  

   @override
   Widget build(BuildContext context) {
       return DropdownButton<String>(
                                           items: _items.map((String value) {
                                           return DropdownMenuItem<String>(
                                                    value: value,
                                                    child: Text(value),
                                            );
                                            }).toList(),
                                            hint: Text(_itemForm),
                                            onChanged: (value) {
                                              if (_index == 0) {
                                                controller.itemFormation1.value = value!;
                                              } else if (_index == 1) {
                                                controller.itemFormation2.value = value!;
                                              } else if (_index == 2) {
                                                controller.itemFormation3.value = value!;
                                              } else if (_index == 3) {
                                                controller.itemFormation4.value = value!;
                                              } else if (_index == 4) {
                                                controller.itemFormation5.value = value!;
                                              }
                                              _itemForm = value!;
                                            }
                                        );
  }
}