within EVLibrary.Examples.Driver1;

model Test_NEDC
  Real Distance2;
  EVLibrary.Chassis.Bolt Bolt(tr = 1) annotation(
    Placement(visible = true, transformation(origin = {-61, -27}, extent = {{-41, -41}, {41, 41}}, rotation = 0)));
  EVLibrary.Road.Asphalt asphalt1 annotation(
    Placement(visible = true, transformation(origin = {-2, -48}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  EVLibrary.Components.Kinematics2 kinematics2 annotation(
    Placement(visible = true, transformation(origin = {-18, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  EVLibrary.Components.Engine Engine(Efficieny = 0.86) annotation(
    Placement(visible = true, transformation(origin = {16, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  EVLibrary.Components.Converter converter(Vnominal = 360) annotation(
    Placement(visible = true, transformation(origin = {76, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Ground ground1 annotation(
    Placement(visible = true, transformation(origin = {100, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  EVLibrary.Storage.Cell.Lipo lipo(Np = 2, Ns = 2, capacity = 66.66) annotation(
    Placement(visible = true, transformation(origin = {76, -22}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  EVLibrary.Profiles.NEDCCycle nEDCCycle annotation(
    Placement(visible = true, transformation(origin = {-88, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.Integrator Distance annotation(
    Placement(visible = true, transformation(origin = {48, -52}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  EVLibrary.Components.PowerTrain powerTrain annotation(
    Placement(visible = true, transformation(origin = {-52, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  EVLibrary.Components.OnBoardCharger OnBoardCharger annotation(
    Placement(visible = true, transformation(origin = {46, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(lipo.n, converter.pin_n) annotation(
    Line(points = {{86, -22}, {86, -22}, {86, 30}, {86, 30}}, color = {0, 0, 255}));
  connect(lipo.p, converter.pin_p) annotation(
    Line(points = {{66, -22}, {66, 34}, {67, 34}}, color = {0, 0, 255}));
  connect(Engine.PowerEngine, OnBoardCharger.EngineR) annotation(
    Line(points = {{27, 36}, {36, 36}}, color = {0, 0, 127}));
  connect(OnBoardCharger.Currentdemand, converter.ForceRequiredByMotor) annotation(
    Line(points = {{59, 36}, {63, 36}, {63, 36}, {63, 36}}, color = {0, 0, 127}));
  connect(kinematics2.ff, Engine.Gearboxin) annotation(
    Line(points = {{-7, 36}, {6, 36}}, color = {0, 0, 127}));
  connect(nEDCCycle.Accel, kinematics2.Accel) annotation(
    Line(points = {{-77, 32}, {-71, 32}, {-71, 4}, {-33, 4}, {-33, 32}, {-27, 32}, {-27, 32}, {-29, 32}, {-29, 32}}, color = {0, 0, 127}));
  connect(powerTrain.Gearboxout, kinematics2.Vel) annotation(
    Line(points = {{-41, 38}, {-29, 38}}, color = {0, 0, 127}));
  connect(powerTrain.FVelin, nEDCCycle.Vel) annotation(
    Line(points = {{-62, 38}, {-78, 38}, {-78, 38}, {-76, 38}}, color = {0, 0, 127}));
  connect(converter.pin_n, ground1.p) annotation(
    Line(points = {{85, 30}, {100, 30}}, color = {0, 0, 255}));
  connect(Engine.PowerEngine, OnBoardCharger.Engine) annotation(
    Line(points = {{29, 36}, {35, 36}, {35, 36}, {35, 36}}, color = {0, 0, 127}));
//regBrake.a = nEDCCycle.Accel;
//regBrake.BoolDec = nEDCCycle.BoolDec;
  der(Distance2) = nEDCCycle.Vel;
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