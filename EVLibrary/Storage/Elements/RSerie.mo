within EVLibrary.Storage.Elements;

model RSerie
 extends Modelica.Electrical.Analog.Interfaces.TwoPin;
  Modelica.Blocks.Interfaces.RealInput u annotation(
    Placement(visible = true, transformation(origin = {0, 92}, extent = {{-20, -20}, {20, 20}}, rotation = -90), iconTransformation(origin = {0, 58}, extent = {{-20, -20}, {20, 20}}, rotation = -90)));
  Modelica.Electrical.Analog.Basic.VariableResistor variableResistor1 annotation(
    Placement(visible = true, transformation(origin = {0, 4}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
 Components.RSeries rSeries1 annotation(
    Placement(visible = true, transformation(origin = {0, 44}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(rSeries1.Rseries_Soc, variableResistor1.R) annotation(
    Line(points = {{0, 40}, {0, 40}, {0, 16}, {0, 16}}, color = {0, 0, 127}));
  connect(u, rSeries1.u) annotation(
    Line(points = {{0, 92}, {0, 92}, {0, 50}, {0, 50}}, color = {0, 0, 127}));
  connect(variableResistor1.n, n) annotation(
    Line(points = {{10, 4}, {34, 4}, {34, 2}, {100, 2}, {100, 0}}, color = {0, 0, 255}));
  connect(variableResistor1.p, p) annotation(
    Line(points = {{-10, 4}, {-98, 4}, {-98, 0}, {-100, 0}}, color = {0, 0, 255}));
  annotation(
    Icon(graphics = {Rectangle(origin = {10, 0}, extent = {{-70, 20}, {50, -20}}), Line(origin = {-75, 2}, points = {{-15, 0}, {15, 0}, {15, 0}}), Line(origin = {75, 0}, points = {{-15, 0}, {15, 0}})}));

end RSerie;
