import 'package:unittest/unittest.dart';
import 'package:shades/shades.dart';

void main() {
  test("colour constructs with valid arguments", () {
    Colour c = new Colour(255, 255, 255, 255);
    expect(c.getRGBA(), equals([255, 255, 255, 255]));
  });
  
  test("colour throws when r too small", () {
    expect(() => new Colour(-1, 255, 255, 255), throwsA(new isInstanceOf<InvalidColourFieldException>()));
  });
  test("colour throws when r too large", () {
    expect(() => new Colour(256, 255, 255, 255), throwsA(new isInstanceOf<InvalidColourFieldException>()));
  });
  
  test("colour throws when g too small", () {
    expect(() => new Colour(255, -1, 255, 255), throwsA(new isInstanceOf<InvalidColourFieldException>()));
  });
  test("colour throws when g too large", () {
    expect(() => new Colour(255, 256, 255, 255), throwsA(new isInstanceOf<InvalidColourFieldException>()));
  });
  
  test("colour throws when b too small", () {
    expect(() => new Colour(255, 255, -1, 255), throwsA(new isInstanceOf<InvalidColourFieldException>()));
  });
  test("colour throws when b too large", () {
    expect(() => new Colour(255, 255, 256, 255), throwsA(new isInstanceOf<InvalidColourFieldException>()));
  });
  
  test("colour throws when a too small", () {
    expect(() => new Colour(255, 255, 255, -1), throwsA(new isInstanceOf<InvalidColourFieldException>()));
  });
  test("colour throws when a too large", () {
    expect(() => new Colour(255, 255, 255, 256), throwsA(new isInstanceOf<InvalidColourFieldException>()));
  });
  
  test("getCSS returns right", () {
    Colour c = new Colour(128, 128, 128, 255);
    expect(c.getCSS(), "rgba(128, 128, 128, 255)");
  });
  
  test("toString returns correctly", () {
    Colour c = new Colour(128, 128, 128, 255);
    expect(c.toString(), "rgba(128, 128, 128, 255)");
  });
  
  test("toString returns same as getCSS", () {
    Colour c = new Colour(128, 128, 128, 255);
    expect(c.toString(), c.getCSS());
  });
  
  test("constructing rgb correct", () {
    Colour c = new Colour.fromRGB(128, 128, 128);
    expect(c.getRGBA(), [128, 128, 128, 255]);
  });
  
  test("constructing from hex", () {
    Colour c = new Colour.fromString("#FFFFFF");
    expect(c.getRGBA(), [255, 255, 255, 255]);
  });
  
  test("constructing from hex lowercase", () {
    Colour c = new Colour.fromString("#dddddd");
    expect(c.getRGBA(), [221, 221, 221, 255]);
  });
  
  test("constructing from string", () {
    Colour c = new Colour.fromString("white");
    expect(c.getRGBA(), [255, 255, 255, 255]);
  });
  
  test("constructing from case string", () {
    Colour c = new Colour.fromString("White");
    expect(c.getRGBA(), [255, 255, 255, 255]);
  });
  
  test("fromstring throws on unknown colour", () {
    expect(() => new Colour.fromString("llama"), throwsA(new isInstanceOf<UnknownStringColourException>()));
  });
}