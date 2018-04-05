within EVLibrary.Examples.Driver1;

model TestD1_NoRb_N
  EVLibrary.Chassis.Bolt Bolt1 annotation(
    Placement(visible = true, transformation(origin = {-55, 73}, extent = {{-33, -33}, {33, 33}}, rotation = 0)));
  EVLibrary.Road.Asphalt asphalt1 annotation(
    Placement(visible = true, transformation(origin = {-58, -56}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  EVLibrary.Components.Kinematics kinematics1 annotation(
    Placement(visible = true, transformation(origin = {-30, 22}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  EVLibrary.Components.Engine_R engine_R1(n2 = 0.94) annotation(
    Placement(visible = true, transformation(origin = {10, 22}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  EVLibrary.Components.Converter converter annotation(
    Placement(visible = true, transformation(origin = {60, 22}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Ground ground1 annotation(
    Placement(visible = true, transformation(origin = {84, 12}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  EVLibrary.Storage.Cell.Lipo lipo annotation(
    Placement(visible = true, transformation(origin = {60, -32}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const(k = 0) annotation(
    Placement(visible = true, transformation(origin = {32, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  EVLibrary.Profiles.Normal normal1 annotation(
    Placement(visible = true, transformation(origin = {-76, 22}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(lipo.p, converter.pin_p) annotation(
    Line(points = {{48, -32}, {48, 22}, {51, 22}}, color = {0, 0, 255}));
  connect(converter.pin_n, lipo.n) annotation(
    Line(points = {{69, 22}, {69, -1}, {68, -1}, {68, -32}}, color = {0, 0, 255}));
  connect(const.y, lipo.Irb) annotation(
    Line(points = {{44, -60}, {58, -60}, {58, -44}}, color = {0, 0, 127}));
  connect(converter.pin_n, ground1.p) annotation(
    Line(points = {{69, 22}, {84, 22}}, color = {0, 0, 255}));
  connect(engine_R1.PowerEngine, converter.ForceRequiredByMotor) annotation(
    Line(points = {{21, 28}, {50, 28}}, color = {0, 0, 127}));
  connect(kinematics1.ff, engine_R1.Gearboxin) annotation(
    Line(points = {{-19, 26}, {-10.5, 26}, {-10.5, 28}, {-2, 28}}, color = {0, 0, 127}));
  connect(normal1.Vel, kinematics1.Vel) annotation(
    Line(points = {{-64, 30}, {-53, 30}, {-53, 28}, {-42, 28}}, color = {0, 0, 127}));
  connect(normal1.Accel, kinematics1.Accel) annotation(
    Line(points = {{-64, 24}, {-53, 24}, {-53, 22}, {-42, 22}}, color = {0, 0, 127}));
//regBrake.a = normal1.Accel;
//regBrake.BoolDec = normal1.BoolDec;
  converter.BoolA = normal1.BoolAcce;
  converter.Vel = normal1.Vel;
  annotation(
    Diagram(graphics = {Text(origin = {41, 87}, extent = {{-17, 3}, {17, -3}}, textString = "Duration: 864 seg")}));
end TestD1_NoRb_N;