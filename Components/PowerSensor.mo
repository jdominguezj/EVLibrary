within EVLibrary.Components;

model PowerSensor
  Modelica.Electrical.Analog.Sensors.PowerSensor powerSensor annotation(
    Placement(visible = true, transformation(origin = {-10, 14}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Interfaces.PositivePin pin_p annotation(
    Placement(visible = true, transformation(origin = {-56, 14}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-90, 2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Interfaces.NegativePin pin_n annotation(
    Placement(visible = true, transformation(origin = {58, 14}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {90, 2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.Integrator energy annotation(
    Placement(visible = true, transformation(origin = {4, -32}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Ground ground1 annotation(
    Placement(visible = true, transformation(origin = {-10, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(energy.u, powerSensor.power) annotation(
    Line(points = {{-8, -32}, {-18, -32}, {-18, 4}, {-18, 4}}, color = {0, 0, 127}));
  connect(energy.u, powerSensor.power) annotation(
    Line(points = {{-8, -22}, {-18, -22}, {-18, 2}, {-18, 2}}, color = {0, 0, 127}));
  connect(powerSensor.nv, ground1.p) annotation(
    Line(points = {{-10, 4}, {-10, 4}, {-10, 0}, {-10, 0}}, color = {0, 0, 255}));
  connect(pin_n, powerSensor.nc) annotation(
    Line(points = {{58, 16}, {0, 16}, {0, 14}}, color = {0, 0, 255}));
  connect(powerSensor.pc, powerSensor.pv) annotation(
    Line(points = {{-20, 14}, {-20, 14}, {-20, 24}, {-10, 24}, {-10, 24}, {-10, 24}}, color = {0, 0, 255}));
  connect(pin_p, powerSensor.pc) annotation(
    Line(points = {{-56, 14}, {-20, 14}, {-20, 14}, {-20, 14}}, color = {0, 0, 255}));

annotation(
    Icon(graphics = {Rectangle(extent = {{-60, 30}, {60, -30}}), Text(origin = {-3,5}, extent = {{-37, 21}, {37, -21}}, textString = "W")}));end PowerSensor;
