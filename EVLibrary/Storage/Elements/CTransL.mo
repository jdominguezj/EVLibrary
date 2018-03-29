within EVLibrary.Storage.Elements;

model CTransL
extends Modelica.Electrical.Analog.Interfaces.TwoPin;
  Modelica.Blocks.Interfaces.RealInput u annotation(
    Placement(visible = true, transformation(origin = {0, 92}, extent = {{-20, -20}, {20, 20}}, rotation = -90), iconTransformation(origin = {0, 58}, extent = {{-20, -20}, {20, 20}}, rotation = -90)));
  Modelica.Electrical.Analog.Basic.VariableCapacitor variableCapacitor1 annotation(
    Placement(visible = true, transformation(origin = {0, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  EVLibrary.Storage.Components.CtransientL ctransientL1 annotation(
    Placement(visible = true, transformation(origin = {0, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(ctransientL1.CTL_Soc, variableCapacitor1.C) annotation(
    Line(points = {{0, 40}, {0, 40}, {0, 12}, {0, 12}}, color = {0, 0, 127}));
  connect(u, ctransientL1.u) annotation(
    Line(points = {{0, 92}, {-4, 92}, {-4, 48}, {-2, 48}}, color = {0, 0, 127}));
  connect(variableCapacitor1.n, n) annotation(
    Line(points = {{10, 0}, {100, 0}, {100, 0}, {100, 0}}, color = {0, 0, 255}));
  connect(variableCapacitor1.p, p) annotation(
    Line(points = {{-10, 0}, {-96, 0}, {-96, 0}, {-100, 0}}, color = {0, 0, 255}));
  annotation(
    Icon(graphics = {Line(origin = {-20, 1}, points = {{0, 41}, {0, -41}}), Line(origin = {20, 1}, points = {{0, 41}, {0, -41}}), Line(origin = {-59, -2}, points = {{-39, 0}, {39, 0}}), Line(origin = {56, -2}, points = {{-36, 0}, {36, 0}})}));

end CTransL;
