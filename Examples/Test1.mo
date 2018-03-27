within EVLibrary.Examples;

model Test1
  
  EVLibrary.Chassis.Prius prius1 annotation(
    Placement(visible = true, transformation(origin = {-52, -22}, extent = {{-28, -28}, {28, 28}}, rotation = 0)));
  EVLibrary.Road.Asphalt asphalt1 annotation(
    Placement(visible = true, transformation(origin = {18, -18}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  EVLibrary.Profiles.Agressive agressive1 annotation(
    Placement(visible = true, transformation(origin = {-70, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  EVLibrary.Components.Kinematics kinematics1 annotation(
    Placement(visible = true, transformation(origin = {-30, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  EVLibrary.Components.Engine_R engine_R1(n2 = 0.94)  annotation(
    Placement(visible = true, transformation(origin = {10, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  EVLibrary.Braking.RegBrake regBrake annotation(
    Placement(visible = true, transformation(origin = {46, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(agressive1.Accel, kinematics1.Accel) annotation(
    Line(points = {{-59, 52}, {-42, 52}}, color = {0, 0, 127}));
  connect(agressive1.Vel, kinematics1.Vel) annotation(
    Line(points = {{-59, 58}, {-42, 58}}, color = {0, 0, 127}));
  connect(kinematics1.ff, engine_R1.Gearboxin) annotation(
    Line(points = {{-19, 50}, {-2, 50}}, color = {0, 0, 127}));
    regBrake.a = agressive1.Accel;
  connect(agressive1.BoolDec, regBrake.BoolDec) annotation(
    Line(points = {{-78, 62}, {-78, 62}, {-78, 80}, {40, 80}, {40, 62}, {40, 62}}, color = {255, 0, 255}));
  annotation(
    Diagram);end Test1;