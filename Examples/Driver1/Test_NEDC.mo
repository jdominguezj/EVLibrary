within EVLibrary.Examples.Driver1;

model Test_NEDC
  Real Distance2;
  EVLibrary.Chassis.Bolt Bolt(tr = 1) annotation(
    Placement(visible = true, transformation(origin = {-69, -51}, extent = {{-33, -33}, {33, 33}}, rotation = 0)));
  EVLibrary.Road.Asphalt asphalt1 annotation(
    Placement(visible = true, transformation(origin = {-2, -48}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  EVLibrary.Components.Kinematics2 kinematics2 annotation(
    Placement(visible = true, transformation(origin = {-16, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  EVLibrary.Components.Engine_R engine_R1(Efficieny = 0.86) annotation(
    Placement(visible = true, transformation(origin = {18, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  EVLibrary.Components.Converter converter(Vnominal = 360)  annotation(
    Placement(visible = true, transformation(origin = {76, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Ground ground1 annotation(
    Placement(visible = true, transformation(origin = {98, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  EVLibrary.Storage.Cell.Lipo lipo(Np = 2, Ns = 2, capacity = 66.66)  annotation(
    Placement(visible = true, transformation(origin = {76, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  EVLibrary.Profiles.NEDCCycle nEDCCycle annotation(
    Placement(visible = true, transformation(origin = {-88, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.Integrator Distance annotation(
    Placement(visible = true, transformation(origin = {48, -52}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  EVLibrary.Components.PowerTrain powerTrain annotation(
    Placement(visible = true, transformation(origin = {-50, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  EVLibrary.Components.InternalCharger internalCharger annotation(
    Placement(visible = true, transformation(origin = {48, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(engine_R1.PowerEngine, internalCharger.EngineR) annotation(
    Line(points = {{29, 36}, {35, 36}, {35, 36}, {35, 36}}, color = {0, 0, 127}));
  connect(internalCharger.Currentdemand, converter.ForceRequiredByMotor) annotation(
    Line(points = {{59, 36}, {63, 36}, {63, 36}, {63, 36}}, color = {0, 0, 127}));
  connect(powerTrain.FVelin, nEDCCycle.Vel) annotation(
    Line(points = {{-62, 38}, {-78, 38}, {-78, 38}, {-76, 38}}, color = {0, 0, 127}));
  connect(powerTrain.Gearboxout, kinematics2.Vel) annotation(
    Line(points = {{-39, 38}, {-33, 38}, {-33, 38}, {-27, 38}, {-27, 38}, {-29, 38}}, color = {0, 0, 127}));
  connect(nEDCCycle.Accel, kinematics2.Accel) annotation(
    Line(points = {{-77, 32}, {-71, 32}, {-71, 4}, {-33, 4}, {-33, 32}, {-27, 32}, {-27, 32}, {-29, 32}, {-29, 32}}, color = {0, 0, 127}));
  connect(lipo.p, converter.pin_p) annotation(
    Line(points = {{66, -20}, {66, 7}, {66, 7}, {66, 34}, {66.5, 34}, {66.5, 34}, {67, 34}}, color = {0, 0, 255}));
  connect(converter.pin_n, lipo.n) annotation(
    Line(points = {{85, 30}, {85, 23.75}, {85, 23.75}, {85, 17.5}, {85, 17.5}, {85, 7}, {86, 7}, {86, -9.5}, {86, -9.5}, {86, -24}}, color = {0, 0, 255}));
  connect(converter.pin_n, ground1.p) annotation(
    Line(points = {{85, 30}, {88.75, 30}, {88.75, 32}, {92.5, 32}, {92.5, 30}, {97.25, 30}, {97.25, 28}, {100, 28}}, color = {0, 0, 255}));
  connect(kinematics2.ff, engine_R1.Gearboxin) annotation(
    Line(points = {{-5, 36}, {6, 36}}, color = {0, 0, 127}));
//regBrake.a = nEDCCycle.Accel;
//regBrake.BoolDec = nEDCCycle.BoolDec;
  der(Distance2)=nEDCCycle.Vel;
  lipo.Irb = 0;
  converter.BoolA = nEDCCycle.BoolAcce;
  converter.Vel = nEDCCycle.Vel;
  if lipo.vsoc1.vsoc1.u >= 0 then
    Distance.u = nEDCCycle.Vel;
  else
    Distance.u = 0;
  end if;
  annotation(
    Diagram);
end Test_NEDC;