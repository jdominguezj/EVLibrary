within EVLibrary.Storage.Elements;

model CTransS
extends Modelica.Electrical.Analog.Interfaces.TwoPin;
  Modelica.Blocks.Interfaces.RealInput u annotation(
    Placement(visible = true, transformation(origin = {0, 92}, extent = {{-20, -20}, {20, 20}}, rotation = -90), iconTransformation(origin = {0, 60}, extent = {{-20, -20}, {20, 20}}, rotation = -90)));
  Modelica.Electrical.Analog.Basic.VariableCapacitor variableCapacitor1 annotation(
    Placement(visible = true, transformation(origin = {0, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  EVLibrary.Storage.Components.CtransientS ctransientS1 annotation(
    Placement(visible = true, transformation(origin = {4, 38}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(ctransientS1.CTS_Soc, variableCapacitor1.C) annotation(
    Line(points = {{4, 38}, {0, 38}, {0, 12}, {0, 12}}, color = {0, 0, 127}));
  connect(u, ctransientS1.u) annotation(
    Line(points = {{0, 92}, {0, 92}, {0, 46}, {2, 46}}, color = {0, 0, 127}));
  connect(variableCapacitor1.n, n) annotation(
    Line(points = {{10, 0}, {100, 0}, {100, 0}, {100, 0}}, color = {0, 0, 255}));
  connect(variableCapacitor1.p, p) annotation(
    Line(points = {{-10, 0}, {-96, 0}, {-96, 0}, {-100, 0}}, color = {0, 0, 255}));
  annotation(
    Icon(graphics = {Line(origin = {-20, 0}, points = {{0, 40}, {0, -40}}), Line(origin = {20, 0}, points = {{0, 40}, {0, -40}}), Line(origin = {59, 0}, points = {{-39, 0}, {39, 0}}), Line(origin = {-58, 0}, points = {{-38, 0}, {38, 0}})}));

end CTransS;
