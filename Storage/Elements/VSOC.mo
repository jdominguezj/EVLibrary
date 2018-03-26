within EVLibrary.Storage.Elements;

model VSOC
extends Modelica.Electrical.Analog.Interfaces.TwoPin;
  Modelica.Blocks.Interfaces.RealInput u annotation(
    Placement(visible = true, transformation(origin = {0, 92}, extent = {{-20, -20}, {20, 20}}, rotation = -90), iconTransformation(origin = {0, 60}, extent = {{-20, -20}, {20, 20}}, rotation = -90)));
  Modelica.Electrical.Analog.Sources.SignalVoltage signalVoltage1 annotation(
    Placement(visible = true, transformation(origin = {0, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Components.Vsoc vsoc1 annotation(
    Placement(visible = true, transformation(origin = {-2, 38}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(vsoc1.VSOC, signalVoltage1.v) annotation(
    Line(points = {{-2, 38}, {0, 38}, {0, 8}, {0, 8}}, color = {0, 0, 127}));
  connect(u, vsoc1.u) annotation(
    Line(points = {{0, 92}, {-6, 92}, {-6, 46}, {-4, 46}}, color = {0, 0, 127}));
  connect(signalVoltage1.n, n) annotation(
    Line(points = {{10, 0}, {102, 0}, {102, 0}, {100, 0}}, color = {0, 0, 255}));
  connect(signalVoltage1.p, p) annotation(
    Line(points = {{-10, 0}, {-98, 0}, {-98, 0}, {-100, 0}}, color = {0, 0, 255}));
  annotation(
    Icon(graphics = {Ellipse(origin = {1, 0}, extent = {{41, -40}, {-41, 40}}, endAngle = 360), Line(origin = {-26, -1}, points = {{0, 7}, {0, -7}}), Line(origin = {-25, 0}, points = {{-7, 0}, {7, 0}}), Line(origin = {30, -1}, points = {{0, 9}, {0, -9}}), Line(origin = {-69, 0}, points = {{-29, 0}, {29, 0}}), Line(origin = {68, 0}, points = {{-26, 0}, {26, 0}})}));

end VSOC;
