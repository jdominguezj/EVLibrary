within EVLibrary.Examples.Driver1;

model TestD1_Rb_A3
  EVLibrary.Road.Asphalt asphalt1 annotation(
    Placement(visible = true, transformation(origin = {-10, -42}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  EVLibrary.Profiles.Agressive agressive1 annotation(
    Placement(visible = true, transformation(origin = {-70, 48}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  EVLibrary.Components.Kinematics kinematics1 annotation(
    Placement(visible = true, transformation(origin = {-30, 48}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  EVLibrary.Components.Engine_R engine_R1(n2 = 0.94) annotation(
    Placement(visible = true, transformation(origin = {10, 48}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  EVLibrary.Components.Converter converter annotation(
    Placement(visible = true, transformation(origin = {58, 48}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  EVLibrary.Chassis.Bolt bolt1 annotation(
    Placement(visible = true, transformation(origin = {-64, -42}, extent = {{-26, -26}, {26, 26}}, rotation = 0)));
  EVLibrary.Braking.RegBrake2 regBrake(Mav = bolt1.Mv, Rw = bolt1.Rw, vel = agressive1.Vel) annotation(
    Placement(visible = true, transformation(origin = {58, -26}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Storage.Cell.Lipo2 lipo annotation(
    Placement(visible = true, transformation(origin = {58, 14}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(regBrake.Irb, lipo.Irb) annotation(
    Line(points = {{58, -14}, {58, -14}, {58, 2}, {58, 2}}, color = {0, 0, 127}));
  connect(regBrake.n, lipo.n) annotation(
    Line(points = {{68, -26}, {80, -26}, {80, 14}, {68, 14}, {68, 14}}, color = {0, 0, 255}));
  connect(regBrake.p, lipo.p) annotation(
    Line(points = {{48, -26}, {36, -26}, {36, 14}, {48, 14}, {48, 14}}, color = {0, 0, 255}));
  connect(converter.pin_n, lipo.n) annotation(
    Line(points = {{68, 48}, {80, 48}, {80, 14}, {68, 14}, {68, 14}}, color = {0, 0, 255}));
  connect(converter.pin_p, lipo.p) annotation(
    Line(points = {{50, 48}, {36, 48}, {36, 14}, {48, 14}, {48, 14}}, color = {0, 0, 255}));
  connect(engine_R1.PowerEngine, converter.ForceRequiredByMotor) annotation(
    Line(points = {{21, 54}, {46, 54}}, color = {0, 0, 127}));
  connect(kinematics1.ff, engine_R1.Gearboxin) annotation(
    Line(points = {{-19, 54}, {-2, 54}}, color = {0, 0, 127}));
  connect(agressive1.Accel, kinematics1.Accel) annotation(
    Line(points = {{-59, 50}, {-42, 50}}, color = {0, 0, 127}));
  connect(agressive1.Vel, kinematics1.Vel) annotation(
    Line(points = {{-59, 56}, {-42, 56}}, color = {0, 0, 127}));
  regBrake.a = agressive1.Accel;
  regBrake.BoolDec = agressive1.BoolDec;
  converter.BoolA = agressive1.BoolAcce;
  converter.Vel = agressive1.Vel;
  lipo.Accel = agressive1.BoolAcce;

//supercapacitorBasic.Dec = agressive1.BoolDec;
  annotation(
    Diagram);
end TestD1_Rb_A3;