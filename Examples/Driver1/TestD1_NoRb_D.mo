within EVLibrary.Examples.Driver1;

model TestD1_NoRb_D
  EVLibrary.Chassis.Bolt Bolt1 annotation(
    Placement(visible = true, transformation(origin = {-55, 73}, extent = {{-33, -33}, {33, 33}}, rotation = 0)));
  EVLibrary.Road.Asphalt asphalt1 annotation(
    Placement(visible = true, transformation(origin = {-58, -56}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  EVLibrary.Components.Kinematics kinematics1 annotation(
    Placement(visible = true, transformation(origin = {-30, 22}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  EVLibrary.Components.Engine_R engine_R1(n2 = 0.94) annotation(
    Placement(visible = true, transformation(origin = {10, 22}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  EVLibrary.Components.Converter converter annotation(
    Placement(visible = true, transformation(origin = {60, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Ground ground1 annotation(
    Placement(visible = true, transformation(origin = {84, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const(k = 0) annotation(
    Placement(visible = true, transformation(origin = {32, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  EVLibrary.Profiles.Drowsy drowsy1 annotation(
    Placement(visible = true, transformation(origin = {-78, 22}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  EVLibrary.Storage.Cell.Lipo lipo annotation(
    Placement(visible = true, transformation(origin = {60, 2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(converter.pin_n, lipo.n) annotation(
    Line(points = {{70, 30}, {70, 30}, {70, 2}, {70, 2}}, color = {0, 0, 255}));
  connect(converter.pin_p, lipo.p) annotation(
    Line(points = {{52, 30}, {50, 30}, {50, 2}, {50, 2}}, color = {0, 0, 255}));
  connect(lipo.Irb, const.y) annotation(
    Line(points = {{60, -10}, {60, -60}, {44, -60}}, color = {0, 0, 127}));
  connect(drowsy1.Accel, kinematics1.Accel) annotation(
    Line(points = {{-66, 24}, {-44, 24}, {-44, 24}, {-42, 24}}, color = {0, 0, 127}));
  connect(drowsy1.Vel, kinematics1.Vel) annotation(
    Line(points = {{-66, 30}, {-44, 30}, {-44, 30}, {-42, 30}}, color = {0, 0, 127}));
  connect(converter.pin_n, ground1.p) annotation(
    Line(points = {{69, 30}, {84, 30}}, color = {0, 0, 255}));
  connect(engine_R1.PowerEngine, converter.ForceRequiredByMotor) annotation(
    Line(points = {{21, 22}, {48, 22}}, color = {0, 0, 127}));
  connect(kinematics1.ff, engine_R1.Gearboxin) annotation(
    Line(points = {{-19, 22}, {-2, 22}}, color = {0, 0, 127}));
//regBrake.a = drowsy1.Accel;
//regBrake.BoolDec = drowsy1.BoolDec;
  converter.BoolA = drowsy1.BoolAcce;
  converter.Vel = drowsy1.Vel;
  //lipo.Accel = drowsy1.BoolAcce;
  annotation(
    Diagram);
end TestD1_NoRb_D;