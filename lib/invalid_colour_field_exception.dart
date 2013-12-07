part of shades;

/**
 * Exception thrown when a colour object validates and finds an out of range
 * numeric value for an RGB(A) component
 */
class InvalidColourFieldException implements Exception {
  
  String _message;
  
  InvalidColourFieldException(String field, int value) : _message = "Invalid field $field, expected range 0 to 255 inclusive but was $value";
  
  String toString() {
    return _message;
  }
  
}