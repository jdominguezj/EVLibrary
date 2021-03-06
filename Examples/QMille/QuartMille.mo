within EVLibrary.Examples.QMille;

model QuartMille
 Real Distance2;
  EVLibrary.Chassis.Bolt Bolt(tr = 1) annotation(
    Placement(visible = true, transformation(origin = {-71, -33}, extent = {{-33, -33}, {33, 33}}, rotation = 0)));
  EVLibrary.Road.RBolt RBolt annotation(
    Placement(visible = true, transformation(origin = {-16, -32}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  EVLibrary.Components.Kinematics Kinematics(k = 0.2)  annotation(
    Placement(visible = true, transformation(origin = {-46, 22}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  EVLibrary.Components.Engine Engine1 annotation(
    Placement(visible = true, transformation(origin = {16, 22}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  EVLibrary.Components.Converter converter(Vnominal = 350)  annotation(
    Placement(visible = true, transformation(origin = {76, 22}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  EVLibrary.Profiles.Behaviour.QuartM QuartM annotation(
    Placement(visible = true, transformation(origin = {-84, 22}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  EVLibrary.Components.PowerTrain powerTrain(Efficiency = 0.9)  annotation(
    Placement(visible = true, transformation(origin = {-16, 22}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  EVLibrary.Components.OnBoardCharger OnBoardCharger annotation(
    Placement(visible = true, transformation(origin = {44, 22}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  EVLibrary.Storage.Cell.Lipo2 lipo2(Np = 3, Ns = 96, capacity = 171.42)  annotation(
    Placement(visible = true, transformation(origin = {76, -24}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  EVLibrary.Braking.RegBrake RegBrake(Mav = Bolt.Mv, Rw = Bolt.Rw, vel = QuartM.Vel) annotation(
    Placement(visible = true, transformation(origin = {76, -66}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
 EVLibrary.Components.PowerSensor PS annotation(
    Placement(visible = true, transformation(origin = {62, -6}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
equation
  connect(PS.pin_p, converter.pin_p) annotation(
    Line(points = {{62, 4}, {62, 4}, {62, 22}, {68, 22}, {68, 22}}, color = {0, 0, 255}));
  connect(PS.pin_n, lipo2.p) annotation(
    Line(points = {{62, -16}, {62, -16}, {62, -24}, {66, -24}, {66, -24}, {66, -24}}, color = {0, 0, 255}));
  connect(RegBrake.Irb, lipo2.Irb) annotation(
    Line(points = {{76, -54}, {76, -54}, {76, -36}, {76, -36}}, color = {0, 0, 127}));
  connect(lipo2.n, RegBrake.n) annotation(
    Line(points = {{86, -24}, {86, -24}, {86, -66}, {86, -66}}, color = {0, 0, 255}));
  connect(lipo2.p, RegBrake.p) annotation(
    Line(points = {{66, -24}, {66, -24}, {66, -66}, {66, -66}}, color = {0, 0, 255}));
  connect(Kinematics.ff, powerTrain.FVelin) annotation(
    Line(points = {{-34, 30}, {-30, 30}, {-30, 30}, {-28, 30}, {-28, 30}}, color = {0, 0, 127}));
  connect(powerTrain.Gearboxout, Engine1.Gearboxin) annotation(
    Line(points = {{-4, 28}, {2, 28}, {2, 28}, {4, 28}}, color = {0, 0, 127}));
  connect(QuartM.Vel, Kinematics.Vel) annotation(
    Line(points = {{-74, 30}, {-58, 30}, {-58, 30}, {-58, 30}}, color = {0, 0, 127}));
  connect(QuartM.Accel, Kinematics.Accel) annotation(
    Line(points = {{-73, 24}, {-58, 24}}, color = {0, 0, 127}));
  connect(lipo2.Irb, RegBrake.Irb) annotation(
    Line(points = {{76, -36}, {76, -36}, {76, -54}, {76, -54}}, color = {0, 0, 127}));
  connect(RegBrake.n, lipo2.n) annotation(
    Line(points = {{86, -66}, {86, -66}, {86, -24}, {86, -24}}, color = {0, 0, 255}));
  connect(RegBrake.p, lipo2.p) annotation(
    Line(points = {{66, -66}, {66, -66}, {66, -24}, {66, -24}}, color = {0, 0, 255}));
  connect(lipo2.n, converter.pin_n) annotation(
    Line(points = {{86, -24}, {86, -24}, {86, 22}, {86, 22}}, color = {0, 0, 255}));
  connect(OnBoardCharger.Currentdemand, converter.ForceRequiredByMotor) annotation(
    Line(points = {{56, 28}, {60, 28}, {60, 28}, {62, 28}}, color = {0, 0, 127}));
  connect(Engine1.PowerEngine, OnBoardCharger.EngineR) annotation(
    Line(points = {{28, 28}, {32, 28}, {32, 28}, {32, 28}}, color = {0, 0, 127}));
  RegBrake.a = QuartM.Accel;
  RegBrake.BoolDec = QuartM.BoolDec;
  Engine1.u=QuartM.Vel;

  lipo2.Accel = QuartM.BoolAcce;
  der(Distance2) = QuartM.Vel;
  converter.BoolA = QuartM.BoolAcce;
  converter.Vel = QuartM.Vel;
 
  annotation(
    Diagram,
    Icon);

end QuartMille;
