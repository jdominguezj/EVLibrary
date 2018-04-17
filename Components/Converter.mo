within EVLibrary.Components;

model Converter
  //Power=Force*Velocity
  //Bolt 350
  parameter Real Vnominal(quantity = "Nominal voltage", unit = "V");
  parameter Real Efficieny=0.96;   //Perdidas en convertidor
  extends Interfaces.Connectors.Twopin;
  Modelica.Blocks.Interfaces.RealInput ForceRequiredByMotor annotation(
    Placement(visible = true, transformation(origin = {-58, 30}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, 60}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput Vel annotation(
    Placement(visible = true, transformation(origin = {-58, 70}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-60, 120}, extent = {{-20, -20}, {20, 20}}, rotation = -90)));
  Modelica.Blocks.Interfaces.BooleanInput BoolA annotation(
    Placement(visible = true, transformation(origin = {-42, -6}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = { -120, -80}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
equation  
   pin_p.i = if BoolA then (Vel * abs(ForceRequiredByMotor) / Efficieny / Vnominal) else 0;   
 // v = (ForceRequiredByMotor*Vel)/i;
  //0.001 is the equivalent to divide by 1000 to obtain the v alues in Amperes, and 0.002 is the timestamp to know the current anytime. 380 is the maximum voltage reach by the battery
 annotation(
    Icon(graphics = {Rectangle(origin = {-1, 0}, fillColor = {244, 244, 244}, fillPattern = FillPattern.Solid, extent = {{-99, 100}, {101, -100}}), Line(origin = {-77.6023, 85.6023}, points = {{0, 0}, {0, 0}}), Line(origin = {-0.353553, 0.353553}, points = {{-99.6464, 99.6464}, {100.354, -100.354}, {98.3536, -98.3536}}), Text(origin = {-29, -72}, extent = {{-47, 46}, {25, -6}}, textString = "DC"), Text(origin = {53, 34}, extent = {{-47, 46}, {25, -6}}, textString = "DC")}, coordinateSystem(initialScale = 0.1)));

end Converter;