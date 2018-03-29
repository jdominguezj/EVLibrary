within EVLibrary.Examples;

model Test3
  EVLibrary.Chassis.Prius prius1(tr = 1) annotation(
    Placement(visible = true, transformation(origin = {-49, -47}, extent = {{-33, -33}, {33, 33}}, rotation = 0)));
  EVLibrary.Road.Asphalt asphalt1 annotation(
    Placement(visible = true, transformation(origin = {42, -46}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  EVLibrary.Profiles.Agressive agressive1 annotation(
    Placement(visible = true, transformation(origin = {-70, 22}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  EVLibrary.Components.Kinematics kinematics1 annotation(
    Placement(visible = true, transformation(origin = {-30, 22}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  EVLibrary.Components.Engine_R engine_R1(n2 = 0.94) annotation(
    Placement(visible = true, transformation(origin = {10, 22}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Resistor resistor1(R = 1) annotation(
    Placement(visible = true, transformation(origin = {58, 78}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  EVLibrary.Braking.RegBrake_FV regBrake_FV(Mav = prius1.Mv, Rw = prius1.Rw) annotation(
    Placement(visible = true, transformation(origin = {56, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(regBrake_FV.n, resistor1.n) annotation(
    Line(points = {{66, 50}, {68, 50}, {68, 78}, {68, 78}}, color = {0, 0, 255}));
  connect(resistor1.p, regBrake_FV.p) annotation(
    Line(points = {{48, 78}, {36, 78}, {36, 50}, {46, 50}, {46, 50}}, color = {0, 0, 255}));
  connect(kinematics1.ff, engine_R1.Gearboxin) annotation(
    Line(points = {{-19, 22}, {-2, 22}}, color = {0, 0, 127}));
  connect(agressive1.Vel, kinematics1.Vel) annotation(
    Line(points = {{-59, 30}, {-42, 30}}, color = {0, 0, 127}));
  connect(agressive1.Accel, kinematics1.Accel) annotation(
    Line(points = {{-59, 24}, {-42, 24}}, color = {0, 0, 127}));
  regBrake_FV.a = agressive1.Accel;
  regBrake_FV.vel = agressive1.Vel;
  regBrake_FV.BoolDec = agressive1.BoolDec;
//converter.BoolA = agressive1.BoolAcce;
//converter.Vel = agressive1.Vel;
  annotation(
    Diagram);
end Test3;