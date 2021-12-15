
class Graduation {

  Graduation({selected = 'Graduação'}):_selected = selected;

  String _selected;
  String _typeA = 'Ensino Fundamental';
  String _typeB = 'Ensino Médio';
  String _typeC = 'Graduação';

  // ignore: unnecessary_getters_setters
  set selected(String t) => _selected = t;

  // ignore: unnecessary_getters_setters
  String get selected => _selected;
  String get ensFund => _typeA;
  String get ensMed => _typeB;
  String get grad => _typeC;

  
}