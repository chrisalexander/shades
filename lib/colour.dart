part of shades;

/**
 * The colour class represents a single colour.
 * 
 * It can be constructed from hex, rgb(a), or a string, and converted to hex and rgb(a).
 */
class Colour {
  
  int _r = 0, _g = 0, _b = 0, _a = 255;
  
  Map<String, List<int>> _colours = {
    "white": [255, 255, 255]
  };
  
  /**
   * Default constructor with RGBA values
   */
  Colour(this._r, this._g, this._b, this._a) {
    _validate();
  }

  /**
   * Explicit from RGB constructor
   */
  Colour.fromRGB(this._r, this._g, this._b) : _a = 255 {
    _validate();
  }
  
  /**
   * Explicit from RGBA constructor
   */
  Colour.fromRGBA(this._r, this._g, this._b, this._a) {
    _validate();
  }
  
  /**
   * Constructor with a string name or a hex value
   */
  Colour.fromString(String string) {
    string = string.toLowerCase();
    if (this._isHex(string)) {
      this._initialiseFromHex(string.replaceAll("#", ""));
    } else if (this._isColourString(string)) {
      this._r = this._colours[string][0];
      this._g = this._colours[string][1];
      this._b = this._colours[string][2];
    } else {
      throw new UnknownStringColourException(string);
    }
    _validate();
  }
  
  /**
   * Returns the RGB as a list
   */
  List<int> getRGB() {
    return [this._r, this._g, this._b];
  }
  
  /**
   * Returns the RGBA as a list
   */
  List<int> getRGBA() {
    return [this._r, this._g, this._b, this._a];
  }
  
  /**
   * Returns a string representing the colour as CSS
   */
  String getCSS() {
    return "rgba(${this._r}, ${this._g}, ${this._b}, ${this._a})";
  }
  
  /**
   * [toString] aliases [getCSS] 
   */
  String toString() {
    return this.getCSS();
  }
  
  void _validate() {
    this._validateField("r", this._r);
    this._validateField("g", this._g);
    this._validateField("b", this._b);
    this._validateField("a", this._a);
  }
  
  void _validateField(String field, int value) {
    if (value < 0 || value > 255) {
      throw new InvalidColourFieldException(field, value);
    }
  }
  
  /**
   * Determines whether a string input is text or hex
   */
  bool _isHex(String string) {
    RegExp exp = new RegExp(r"^#?([_a-f0-9]{3})|([_a-f0-9]{6})", caseSensitive: false);
    return exp.hasMatch(string);
  }
  
  /**
   * Returns whether or not the string is a known colour
   */
  bool _isColourString(String string) {
    return this._colours.containsKey(string);
  }
  
  /**
   * Initialises colour from hex code
   */
  void _initialiseFromHex(String string) {
    this._r = int.parse(string.substring(0, 2), radix: 16);
    this._g = int.parse(string.substring(2, 4), radix: 16);
    this._b = int.parse(string.substring(4, 6), radix: 16);
  }
  
}