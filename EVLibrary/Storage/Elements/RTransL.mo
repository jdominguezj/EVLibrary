within EVLibrary.Storage.Elements;

model RTransL
 extends Modelica.Electrical.Analog.Interfaces.TwoPin;
  Modelica.Blocks.Interfaces.RealInput u annotation(
    Placement(visible = true, transformation(origin = {0, 88}, extent = {{-20, -20}, {20, 20}}, rotation = -90), iconTransformation(origin = {0, 60}, extent = {{-20, -20}, {20, 20}}, rotation = -90)));
  Modelica.Electrical.Analog.Basic.VariableResistor variableResistor1 annotation(
    Placement(visible = true, transformation(origin = {0, 2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
 Components.RtransientL rtransientL1 annotation(
    Placement(visible = true, transformation(origin = {0, 38}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(rtransientL1.RTL_Soc, variableResistor1.R) annotation(
    Line(points = {{0, 38}, {0, 38}, {0, 14}, {0, 14}}, color = {0, 0, 127}));
  connect(u, rtransientL1.u) annotation(
    Line(points = {{0, 88}, {0, 88}, {0, 46}, {0, 46}}, color = {0, 0, 127}));
  connect(variableResistor1.n, n) annotation(
    Line(points = {{10, 2}, {102, 2}, {102, 0}, {100, 0}}, color = {0, 0, 255}));
  connect(variableResistor1.p, p) annotation(
    Line(points = {{-10, 2}, {-100, 2}, {-100, 0}}, color = {0, 0, 255}));
  annotation(
    Icon(graphics = {Rectangle(extent = {{-60, 20}, {60, -20}}), Line(origin = {-77, 0}, points = {{-19, 0}, {19, 0}}), Line(origin = {75, 0}, points = {{-15, 0}, {15, 0}})}));

end RTransL;
