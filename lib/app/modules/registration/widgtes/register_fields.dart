import 'package:colegio_juventude/app/UI/theme_extensions.dart';
import 'package:flutter/material.dart';

class RegisterFields extends StatelessWidget {

  RegisterFields({ @required label, required hintText,Key? key })
   : _label = label,
   _hintText = hintText,
   super(key: key);

  String _label;
  String _hintText;

   @override
   Widget build(BuildContext context) {
       return SizedBox(
         child: Padding(
           padding: const EdgeInsets.only(right: 8,left: 8),
           child: TextField(
                        autofocus: false,
                        decoration: InputDecoration(
                          focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: context.themeGreen)),
                            enabledBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: context.themeCyan)),
                            fillColor: Colors.white,
                            filled: true,
                            label: Text(_label, style: TextStyle(color: context.themeGreen),),
                            hintText: _hintText),
                      ),
         ),
       );
  }
}