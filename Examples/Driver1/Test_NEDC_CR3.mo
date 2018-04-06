within EVLibrary.Examples.Driver1;

model Test_NEDC_CR3
  Real Distance2;
  EVLibrary.Chassis.Bolt2 Bolt2(tr = 1) annotation(
    Placement(visible = true, transformation(origin = {-65, -67}, extent = {{-33, -33}, {33, 33}}, rotation = 0)));
  EVLibrary.Road.Asphalt2 asphalt2 annotation(
    Placement(visible = true, transformation(origin = {4, -56}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  EVLibrary.Components.Kinematics2 kinematics2 annotation(
    Placement(visible = true, transformation(origin = {-14, 22}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  EVLibrary.Components.Engine_R engine_R1(n2 = 0.94) annotation(
    Placement(visible = true, transformation(origin = {16, 22}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  EVLibrary.Components.Converter converter annotation(
    Placement(visible = true, transformation(origin = {76, 22}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  EVLibrary.Profiles.NEDCCycle nEDCCycle annotation(
    Placement(visible = true, transformation(origin = {-86, 22}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  EVLibrary.Components.PowerTrain powerTrain annotation(
    Placement(visible = true, transformation(origin = {-50, 22}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.Integrator Distance annotation(
    Placement(visible = true, transformation(origin = {30, 74}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  EVLibrary.Components.InternalCharger internalCharger annotation(
    Placement(visible = true, transformation(origin = {44, 22}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  EVLibrary.Storage.Cell.Lipo2 lipo2 annotation(
    Placement(visible = true, transformation(origin = {76, -24}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  EVLibrary.Braking.RegBrake3 regBrake3(Mav = Bolt2.Mv, Rw = Bolt2.Rw, vel = nEDCCycle.Vel) annotation(
    Placement(visible = true, transformation(origin = {76, -66}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(lipo2.Irb, regBrake3.Irb) annotation(
    Line(points = {{76, -36}, {76, -36}, {76, -54}, {76, -54}}, color = {0, 0, 127}));
  connect(regBrake3.n, lipo2.n) annotation(
    Line(points = {{86, -66}, {86, -66}, {86, -24}, {86, -24}}, color = {0, 0, 255}));
  connect(regBrake3.p, lipo2.p) annotation(
    Line(points = {{66, -66}, {66, -66}, {66, -24}, {66, -24}}, color = {0, 0, 255}));
  connect(converter.pin_p, lipo2.p) annotation(
    Line(points = {{68, 22}, {66, 22}, {66, -24}, {66, -24}}, color = {0, 0, 255}));
  connect(lipo2.n, converter.pin_n) annotation(
    Line(points = {{86, -24}, {86, -24}, {86, 22}, {86, 22}}, color = {0, 0, 255}));
  connect(internalCharger.Currentdemand, converter.ForceRequiredByMotor) annotation(
    Line(points = {{56, 28}, {60, 28}, {60, 28}, {62, 28}}, color = {0, 0, 127}));
  connect(powerTrain.FVelin, nEDCCycle.Vel) annotation(
    Line(points = {{-60, 30}, {-76, 30}, {-76, 30}, {-74, 30}}, color = {0, 0, 127}));
  connect(powerTrain.Gearboxout, kinematics2.Vel) annotation(
    Line(points = {{-37, 30}, {-27, 30}, {-27, 30}, {-27, 30}}, color = {0, 0, 127}));
  connect(engine_R1.PowerEngine, internalCharger.EngineR) annotation(
    Line(points = {{28, 28}, {32, 28}, {32, 28}, {32, 28}}, color = {0, 0, 127}));
  connect(kinematics2.ff, engine_R1.Gearboxin) annotation(
    Line(points = {{-3, 28}, {2, 28}}, color = {0, 0, 127}));
  connect(nEDCCycle.Accel, kinematics2.Accel) annotation(
    Line(points = {{-73, 24}, {-69, 24}, {-69, -4}, {-31, -4}, {-31, 24}, {-25, 24}, {-25, 24}}, color = {0, 0, 127}));
  regBrake3.a = nEDCCycle.Accel;
  regBrake3.BoolDec = nEDCCycle.BoolDec;
  lipo2.Accel = nEDCCycle.BoolAcce;
  der(Distance2) = nEDCCycle.Vel;
  converter.BoolA = nEDCCycle.BoolAcce;
  converter.Vel = nEDCCycle.Vel;
  if lipo2.vsoc1.vsoc1.u >= 0 then
    Distance.u = nEDCCycle.Vel;
  else
    Distance.u = 0;
  end if;
  annotation(
    Diagram);
end Test_NEDC_CR3;