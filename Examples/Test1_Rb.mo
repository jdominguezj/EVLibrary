within EVLibrary.Examples;

model Test1_Rb
  EVLibrary.Chassis.Prius prius1(tr = 1)  annotation(
    Placement(visible = true, transformation(origin = {-55, 73}, extent = {{-33, -33}, {33, 33}}, rotation = 0)));
  EVLibrary.Road.Asphalt asphalt1 annotation(
    Placement(visible = true, transformation(origin = {48, 74}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  EVLibrary.Profiles.Agressive agressive1 annotation(
    Placement(visible = true, transformation(origin = {-70, 22}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  EVLibrary.Components.Kinematics kinematics1 annotation(
    Placement(visible = true, transformation(origin = {-30, 22}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  EVLibrary.Components.Engine_R engine_R1(n2 = 0.94) annotation(
    Placement(visible = true, transformation(origin = {10, 22}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  EVLibrary.Components.Converter converter annotation(
    Placement(visible = true, transformation(origin = {62, 22}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  EVLibrary.Storage.Cell.Lipo lipo annotation(
    Placement(visible = true, transformation(origin = {62, -4}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  EVLibrary.Braking.RegBrake regBrake(Mav = prius1.Mv, Rw = prius1.Rw) annotation(
    Placement(visible = true, transformation(origin = {62, -76}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  EVLibrary.Supercapacitors.Components.SupercapacitorBasic supercapacitorBasic annotation(
    Placement(visible = true, transformation(origin = {62, -40}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
equation
  connect(regBrake.p, supercapacitorBasic.pin_p) annotation(
    Line(points = {{52, -76}, {40, -76}, {40, -40}, {52, -40}, {52, -40}}, color = {0, 0, 255}));
  connect(regBrake.n, supercapacitorBasic.pin_n) annotation(
    Line(points = {{72, -76}, {80, -76}, {80, -40}, {72, -40}, {72, -40}}, color = {0, 0, 255}));
  connect(supercapacitorBasic.pin_n, lipo.n) annotation(
    Line(points = {{72, -40}, {80, -40}, {80, -4}, {72, -4}, {72, -4}}, color = {0, 0, 255}));
  connect(converter.pin_n, lipo.n) annotation(
    Line(points = {{72, 22}, {80, 22}, {80, -4}, {72, -4}, {72, -4}}, color = {0, 0, 255}));
  connect(converter.pin_p, lipo.p) annotation(
    Line(points = {{54, 22}, {40, 22}, {40, -4}, {52, -4}, {52, -4}}, color = {0, 0, 255}));
  connect(supercapacitorBasic.Iregb, lipo.Irb) annotation(
    Line(points = {{62, -28}, {62, -16}}, color = {0, 0, 127}));
  connect(engine_R1.PowerEngine, converter.ForceRequiredByMotor) annotation(
    Line(points = {{21, 28}, {50, 28}}, color = {0, 0, 127}));
  connect(kinematics1.ff, engine_R1.Gearboxin) annotation(
    Line(points = {{-19, 28}, {-2, 28}}, color = {0, 0, 127}));
  connect(lipo.Irb, supercapacitorBasic.Iregb) annotation(
    Line(points = {{60, -14}, {60, -14}, {60, -28}, {60, -28}}, color = {0, 0, 127}));
  connect(agressive1.Vel, kinematics1.Vel) annotation(
    Line(points = {{-59, 30}, {-42, 30}}, color = {0, 0, 127}));
  connect(agressive1.Accel, kinematics1.Accel) annotation(
    Line(points = {{-59, 24}, {-42, 24}}, color = {0, 0, 127}));
  regBrake.a = agressive1.Accel;
  regBrake.BoolDec = agressive1.BoolDec;
  converter.BoolA = agressive1.BoolAcce;
  converter.Vel = agressive1.Vel;
  supercapacitorBasic.Dec = agressive1.BoolDec;
  annotation(
    Diagram);
end Test1_Rb;