within EVLibrary.Components;

model Engine
 parameter Real n2;
  //Perdidas en motor
  Modelica.Blocks.Interfaces.RealInput Gearboxinput annotation(
    Placement(visible = true, transformation(origin = {-102, 24}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput PowerEnginein annotation(
    Placement(visible = true, transformation(origin = {86, 34}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  PowerEnginein = Gearboxinput / n2;
  annotation(
    Icon(graphics = {Rectangle(origin = {-1, 0}, extent = {{-99, 100}, {101, -100}}), Text(origin = {-3, 6}, extent = {{-73, 36}, {73, -36}}, textString = "Engine")}, coordinateSystem(initialScale = 0.1)));

end Engine;
