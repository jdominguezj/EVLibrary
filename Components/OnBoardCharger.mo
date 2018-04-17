within EVLibrary.Components;

model OnBoardCharger
parameter Real Efficieny=0.9;
  //Perdidas en cargador interno
  Modelica.Blocks.Interfaces.RealInput EngineR annotation(
    Placement(visible = true, transformation(origin = {-102, 24}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, 60}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput Currentdemand annotation(
    Placement(visible = true, transformation(origin = {86, 34}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  Currentdemand = EngineR / Efficieny;
 annotation(
    Icon(graphics = {Rectangle(origin = {-1, 0}, fillColor = {244, 244, 244}, fillPattern = FillPattern.Solid, extent = {{-99, 100}, {101, -100}}), Line(origin = {-77.6023, 85.6023}, points = {{0, 0}, {0, 0}}), Line(origin = {-0.353553, 0.353553}, points = {{-99.6464, 99.6464}, {100.354, -100.354}, {98.3536, -98.3536}}), Text(origin = {-29, -72}, extent = {{-47, 46}, {25, -6}}, textString = "AC"), Text(origin = {53, 34}, extent = {{-47, 46}, {25, -6}}, textString = "DC")}, coordinateSystem(initialScale = 0.1)));


end OnBoardCharger;