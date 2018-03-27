within EVLibrary.Examples;

model Test1
  EVLibrary.Chassis.Prius prius1 annotation(
    Placement(visible = true, transformation(origin = {-26, -22}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  EVLibrary.Road.Asphalt asphalt1 annotation(
    Placement(visible = true, transformation(origin = {32, -22}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  EVLibrary.Profiles.Agressive agressive1 annotation(
    Placement(visible = true, transformation(origin = {-58, 42}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  EVLibrary.Components.Kinematics kinematics1 annotation(
    Placement(visible = true, transformation(origin = {-18, 42}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  EVLibrary.Components.Engine engine1 annotation(
    Placement(visible = true, transformation(origin = {18, 42}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(engine1.Gearboxinput, kinematics1.ff) annotation(
    Line(points = {{6, 42}, {-8, 42}, {-8, 42}, {-6, 42}}, color = {0, 0, 127}));
  connect(agressive1.Accel, kinematics1.Accel) annotation(
    Line(points = {{-46, 44}, {-30, 44}, {-30, 44}, {-30, 44}}, color = {0, 0, 127}));
  connect(agressive1.Vel, kinematics1.Vel) annotation(
    Line(points = {{-46, 50}, {-32, 50}, {-32, 50}, {-30, 50}}, color = {0, 0, 127}));

end Test1;
