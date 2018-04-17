within EVLibrary.Components;

model Engine
 parameter Real Efficiency=0.93;
  //Perdidas en motor
  Modelica.Blocks.Interfaces.RealInput Gearboxin annotation(
    Placement(visible = true, transformation(origin = {-102, 24}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, 60}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput PowerEngine annotation(
    Placement(visible = true, transformation(origin = {86, 34}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  PowerEngine = Gearboxin / Efficiency;
  annotation(
    Icon(graphics = {Rectangle(origin = {-1, 0}, extent = {{-99, 100}, {101, -100}}), Rectangle(origin = {0, 9}, fillColor = {115, 111, 106}, fillPattern = FillPattern.Solid, extent = {{-60, 29}, {60, -29}}), Polygon(origin = {0, -30}, points = {{-70, -10}, {-60, 10}, {60, 10}, {70, -10}, {-70, -10}}), Rectangle(origin = {-77, 10}, pattern = LinePattern.Dash, fillPattern = FillPattern.Backward, extent = {{17, 4}, {-17, -4}})}, coordinateSystem(initialScale = 0.1)));
end Engine;