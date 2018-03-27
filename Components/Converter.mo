within EVLibrary.Components;

model Converter

  parameter Real n3;   //Perdidas en convertidor
  Modelica.SIunits.Voltage v;
  extends Modelica.Electrical.Analog.Interfaces.TwoPin;
  Modelica.Blocks.Interfaces.RealInput ForceRequiredByMotor annotation(
    Placement(visible = true, transformation(origin = {-102, 24}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, -80}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput IBattery annotation(
    Placement(visible = true, transformation(origin = {86, 34}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput Vel annotation(
    Placement(visible = true, transformation(origin = {2, 28}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, 80}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.BooleanInput BoolA annotation(
    Placement(visible = true, transformation(origin = {-42, -6}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-60, -118}, extent = {{-20, -20}, {20, 20}}, rotation = 90)));
equation
  p.i = IBattery;
  p.i + n.i = 0;
  IBattery = if BoolA then 0.001 / 0.002 * (Vel * abs(ForceRequiredByMotor) / n3 / 380) else 0; //0.001 is the equivalent to divide by 1000 and 0.002 is the timestamp to know the current anytime. 380 is the maximum voltage reach by the battery
  annotation(
    Icon(graphics = {Rectangle(origin = {-1, 0}, extent = {{-99, 100}, {101, -100}}), Text(origin = {-3, 6}, extent = {{-73, 36}, {73, -36}}, textString = "Converter")}, coordinateSystem(initialScale = 0.1)));

end Converter;
