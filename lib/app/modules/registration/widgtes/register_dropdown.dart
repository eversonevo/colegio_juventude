import 'package:colegio_juventude/app/modules/registration/registration_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

// ignore: must_be_immutable
class RegisterDropdown extends GetView<RegistrationController> {

  RegisterDropdown({
    required List<String> items,
    required String hint,
    required String itemPhone,
    required int index,
     Key? key })
     :_items = items,
     _hint = hint,
     _itemPhone = itemPhone,
     _index = index,
     super(key: key);

  final List<String> _items;
  final String _hint;
  String _itemPhone;
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
                                            hint: Text(_hint),
                                            onChanged: (value) {
                                              if (_index == 0) {
                                                controller.itemCelular1.value = value!;
                                              } else if (_index == 1) {
                                                controller.itemCelular2.value = value!;
                                              } else if (_index == 2) {
                                                controller.itemCelular3.value = value!;
                                              }
                                              _itemPhone = value!;
                                              // preciso alterar o itemCelular aqui

                                            }
                                        );
  }
}