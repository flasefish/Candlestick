import 'dart:ui';

import 'package:mp_chart/mp/core/entry/entry.dart';
import 'dart:ui' as ui;

class CandleEntry extends Entry {
  /// shadow-high value
  double _shadowHigh = 0;

  /// shadow-low value
  double _shadowLow = 0;

  /// close value
  double _close = 0;

  /// open value
  double _open = 0;

  bool _hide = false;

  bool _rectangle = true;

  bool _entryHighLightColor = false;

  Color _entryHighLightColorValue = Color.fromARGB(255, 255, 187, 115);

  CandleEntry(
      {double x,
      double shadowH,
      double shadowL,
      double open,
      double close,
      ui.Image icon,
      bool hide,
      bool rectangle,
      bool entryHighLightColor,
      Color entryHighLightColorValue,
      Object data})
      : super(x: x, y: (shadowH + shadowL) / 2, icon: icon, data: data) {
    this._shadowHigh = shadowH;
    this._shadowLow = shadowL;
    this._open = open;
    this._close = close;
    this._hide = hide;
    this._rectangle = rectangle;
    this._entryHighLightColor = entryHighLightColor;
    this._entryHighLightColorValue = entryHighLightColorValue;
  }

  /// Returns the overall range (difference) between shadow-high and
  /// shadow-low.
  ///
  /// @return
  double getShadowRange() {
    return (_shadowHigh - _shadowLow).abs();
  }

  /// Returns the body size (difference between open and close).
  ///
  /// @return
  double getBodyRange() {
    return (_open - _close).abs();
  }

  bool getShowHide(){
    return _hide == null ? false : _hide;
  }

  bool getRectangle(){
    return _rectangle == null ? true : _rectangle;
  }

  CandleEntry copy() {
    CandleEntry c = CandleEntry(
        x: x,
        shadowH: _shadowHigh,
        shadowL: _shadowLow,
        open: _open,
        close: _close,
        rectangle: _rectangle,
        hide: _hide,
        entryHighLightColor: _entryHighLightColor,
        entryHighLightColorValue:_entryHighLightColorValue,
        data: mData);
    return c;
  }

  // ignore: unnecessary_getters_setters
  double get open => _open;

  // ignore: unnecessary_getters_setters
  set open(double value) {
    _open = value;
  }

  // ignore: unnecessary_getters_setters
  double get close => _close;

  // ignore: unnecessary_getters_setters
  set close(double value) {
    _close = value;
  }

  // ignore: unnecessary_getters_setters
  double get shadowLow => _shadowLow;

  // ignore: unnecessary_getters_setters
  set shadowLow(double value) {
    _shadowLow = value;
  }

  // ignore: unnecessary_getters_setters
  double get shadowHigh => _shadowHigh;

  // ignore: unnecessary_getters_setters
  set shadowHigh(double value) {
    _shadowHigh = value;
  }

  bool get entryHighLightColor =>_entryHighLightColor;
  set entryHighLightColor(bool value){
    _entryHighLightColor = value;
  }

  Color get entryHighLightColorValue =>_entryHighLightColorValue;
  set entryHighLightColorValue(Color value){
    _entryHighLightColorValue = value;
  }

}
