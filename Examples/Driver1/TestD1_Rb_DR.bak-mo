within EVLibrary.Examples.Driver1;

model TestD1_Rb_DR
  EVLibrary.Chassis.Bolt Bolt1(tr = 1)  annotation(
    Placement(visible = true, transformation(origin = {-67, -47}, extent = {{-33, -33}, {33, 33}}, rotation = 0)));
  EVLibrary.Road.Asphalt asphalt1 annotation(
    Placement(visible = true, transformation(origin = {-10, -42}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  EVLibrary.Components.Kinematics kinematics1 annotation(
    Placement(visible = true, transformation(origin = {-30, 48}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  EVLibrary.Components.Engine_R engine_R1(n2 = 0.94) annotation(
    Placement(visible = true, transformation(origin = {10, 48}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  EVLibrary.Components.Converter converter annotation(
    Placement(visible = true, transformation(origin = {62, 48}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Profiles.Drowsy drowsy1 annotation(
    Placement(visible = true, transformation(origin = {-74, 48}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  EVLibrary.Braking.RegBrake2 regBrake(Mav = Bolt1.Mv, Rw = Bolt1.Rw, vel = drowsy1.Vel) annotation(
    Placement(visible = true, transformation(origin = {62, -26}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  EVLibrary.Storage.Cell.Lipo2 lipo annotation(
    Placement(visible = true, transformation(origin = {62, 12}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(regBrake.Irb, lipo.Irb) annotation(
    Line(points = {{62, -14}, {62, -14}, {62, 0}, {62, 0}}, color = {0, 0, 127}));
  connect(lipo.n, regBrake.n) annotation(
    Line(points = {{72, 12}, {72, 12}, {72, -26}, {72, -26}}, color = {0, 0, 255}));
  connect(lipo.p, regBrake.p) annotation(
    Line(points = {{52, 12}, {52, 12}, {52, -26}, {52, -26}}, color = {0, 0, 255}));
  connect(converter.pin_n, lipo.n) annotation(
    Line(points = {{72, 48}, {72, 48}, {72, 12}, {72, 12}}, color = {0, 0, 255}));
  connect(converter.pin_p, lipo.p) annotation(
    Line(points = {{54, 48}, {52, 48}, {52, 12}, {52, 12}}, color = {0, 0, 255}));
  connect(drowsy1.Accel, kinematics1.Accel) annotation(
    Line(points = {{-62, 50}, {-42, 50}, {-42, 50}, {-42, 50}}, color = {0, 0, 127}));
  connect(drowsy1.Vel, kinematics1.Vel) annotation(
    Line(points = {{-62, 56}, {-42, 56}, {-42, 56}, {-42, 56}}, color = {0, 0, 127}));
  connect(engine_R1.PowerEngine, converter.ForceRequiredByMotor) annotation(
    Line(points = {{21, 54}, {50, 54}}, color = {0, 0, 127}));
  connect(kinematics1.ff, engine_R1.Gearboxin) annotation(
    Line(points = {{-19, 54}, {-2, 54}}, color = {0, 0, 127}));
  regBrake.a = drowsy1.Accel;
  regBrake.BoolDec = drowsy1.BoolDec;
  converter.BoolA = drowsy1.BoolAcce;
  converter.Vel = drowsy1.Vel;
  lipo.Accel = drowsy1.BoolAcce;
  

//  supercapacitorBasic.Dec = drowsy1.BoolDec;
  annotation(
    Diagram(graphics = {Text(origin = {62, 83}, extent = {{-22, 7}, {22, -7}}, textString = "Duration 864 seg")}));
end TestD1_Rb_DR;