part of shades;

/**
 * Exception thrown when a colour string is not recognised
 */
class UnknownStringColourException implements Exception {

  String _message;
  
  UnknownStringColourException(String colour) : _message = "Invalid colour string $colour";
  
  String toString() {
    return _message;
  }
}