within EVLibrary.Examples.Driver1;

model TestD1_Rb_D
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
  EVLibrary.Storage.Cell.Lipo lipo annotation(
    Placement(visible = true, transformation(origin = {62, 24}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  EVLibrary.Braking.RegBrake regBrake(Mav = Bolt1.Mv, Rw = Bolt1.Rw, vel=drowsy1.Vel) annotation(
    Placement(visible = true, transformation(origin = {62, -48}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  EVLibrary.Supercapacitors.Components.SupercapacitorBasic supercapacitorBasic annotation(
    Placement(visible = true, transformation(origin = {62, -12}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Profiles.Drowsy drowsy1 annotation(
    Placement(visible = true, transformation(origin = {-74, 48}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(drowsy1.Accel, kinematics1.Accel) annotation(
    Line(points = {{-62, 50}, {-42, 50}, {-42, 50}, {-42, 50}}, color = {0, 0, 127}));
  connect(drowsy1.Vel, kinematics1.Vel) annotation(
    Line(points = {{-62, 56}, {-42, 56}, {-42, 56}, {-42, 56}}, color = {0, 0, 127}));
  connect(converter.pin_p, lipo.p) annotation(
    Line(points = {{53, 48}, {41, 48}, {41, 24}, {52, 24}}, color = {0, 0, 255}));
  connect(lipo.Irb, supercapacitorBasic.Iregb) annotation(
    Line(points = {{60, -14}, {60, -21}, {62, -21}, {62, 0}}, color = {0, 0, 127}));
  connect(converter.pin_n, lipo.n) annotation(
    Line(points = {{71, 48}, {79, 48}, {79, 22}, {71, 22}, {71, 22}}, color = {0, 0, 255}));
  connect(supercapacitorBasic.Iregb, lipo.Irb) annotation(
    Line(points = {{62, 0}, {62, 10}}, color = {0, 0, 127}));
  connect(lipo.p, supercapacitorBasic.pin_p) annotation(
    Line(points = {{52, 22}, {46, 22}, {46, 24}, {40, 24}, {40, -12}, {52, -12}}, color = {0, 0, 255}));
  connect(supercapacitorBasic.pin_n, lipo.n) annotation(
    Line(points = {{72, -12}, {80, -12}, {80, 22}, {72, 22}}, color = {0, 0, 255}));
  connect(regBrake.n, supercapacitorBasic.pin_n) annotation(
    Line(points = {{72, -48}, {80, -48}, {80, -14}, {72, -14}}, color = {0, 0, 255}));
  connect(regBrake.p, supercapacitorBasic.pin_p) annotation(
    Line(points = {{52, -48}, {40, -48}, {40, -14}, {52, -14}}, color = {0, 0, 255}));
  connect(engine_R1.PowerEngine, converter.ForceRequiredByMotor) annotation(
    Line(points = {{21, 54}, {50, 54}}, color = {0, 0, 127}));
  connect(kinematics1.ff, engine_R1.Gearboxin) annotation(
    Line(points = {{-19, 54}, {-2, 54}}, color = {0, 0, 127}));
  regBrake.a = drowsy1.Accel;
  regBrake.BoolDec = drowsy1.BoolDec;
  converter.BoolA = drowsy1.BoolAcce;
  converter.Vel = drowsy1.Vel;
  supercapacitorBasic.Dec = drowsy1.BoolDec;
  annotation(
    Diagram);
end TestD1_Rb_D;