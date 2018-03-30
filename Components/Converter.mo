within EVLibrary.Components;

model Converter
  //Power=Force*Velocity

  parameter Real n3=0.95;   //Perdidas en convertidor
  extends Interfaces.Connectors.Twopin;
  Modelica.Blocks.Interfaces.RealInput ForceRequiredByMotor annotation(
    Placement(visible = true, transformation(origin = {-58, 30}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, 60}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput Vel annotation(
    Placement(visible = true, transformation(origin = {-58, 70}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-60, 120}, extent = {{-20, -20}, {20, 20}}, rotation = -90)));
  Modelica.Blocks.Interfaces.BooleanInput BoolA annotation(
    Placement(visible = true, transformation(origin = {-42, -6}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = { -120, -80}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
equation  
   pin_p.i = if BoolA then ((0.001/0.002) * (Vel * abs(ForceRequiredByMotor) / n3 / 380)) else 0;   
 // v = (ForceRequiredByMotor*Vel)/i;
  //0.001 is the equivalent to divide by 1000 to obtain the v alues in Amperes, and 0.002 is the timestamp to know the current anytime. 380 is the maximum voltage reach by the battery
  annotation(
    Icon(graphics = {Rectangle(origin = {-1, 0}, extent = {{-99, 100}, {101, -100}}), Text(origin = {-3, 6}, extent = {{-73, 36}, {73, -36}}, textString = "Converter")}, coordinateSystem(initialScale = 0.1)));

end Converter;