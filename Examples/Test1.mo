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
  EVLibrary.Components.Converter converter1 annotation(
    Placement(visible = true, transformation(origin = {52, 58}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(engine_R1.PowerEngine, converter1.ForceRequiredByMotor) annotation(
    Line(points = {{22, 50}, {38, 50}, {38, 50}, {40, 50}}, color = {0, 0, 127}));
  connect(agressive1.Vel, converter1.Vel) annotation(
    Line(points = {{-58, 58}, {-56, 58}, {-56, 66}, {40, 66}, {40, 66}}, color = {0, 0, 127}));
  connect(agressive1.BoolAcce, converter1.BoolA) annotation(
    Line(points = {{-74, 40}, {-74, 26}, {46, 26}, {46, 46}}, color = {255, 0, 255}));
  connect(kinematics1.ff, engine_R1.Gearboxin) annotation(
    Line(points = {{-19, 50}, {-2, 50}}, color = {0, 0, 127}));
  connect(agressive1.Vel, kinematics1.Vel) annotation(
    Line(points = {{-59, 58}, {-42, 58}}, color = {0, 0, 127}));
  connect(agressive1.Accel, kinematics1.Accel) annotation(
    Line(points = {{-59, 52}, {-42, 52}}, color = {0, 0, 127}));
  
annotation(
    Diagram);end Test1;
