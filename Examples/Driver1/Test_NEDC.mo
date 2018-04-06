within EVLibrary.Examples.Driver1;

model Test_NEDC
  Real Distance2;
  EVLibrary.Chassis.Bolt Bolt1(tr = 1) annotation(
    Placement(visible = true, transformation(origin = {-65, -67}, extent = {{-33, -33}, {33, 33}}, rotation = 0)));
  EVLibrary.Road.Asphalt asphalt1 annotation(
    Placement(visible = true, transformation(origin = {4, -56}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  EVLibrary.Components.Kinematics2 kinematics2 annotation(
    Placement(visible = true, transformation(origin = {-10, 22}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  EVLibrary.Components.Engine_R engine_R1(n2 = 0.94) annotation(
    Placement(visible = true, transformation(origin = {24, 22}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  EVLibrary.Components.Converter converter annotation(
    Placement(visible = true, transformation(origin = {82, 22}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Ground ground1 annotation(
    Placement(visible = true, transformation(origin = {104, 12}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  EVLibrary.Storage.Cell.Lipo lipo annotation(
    Placement(visible = true, transformation(origin = {82, -28}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  EVLibrary.Profiles.NEDCCycle nEDCCycle annotation(
    Placement(visible = true, transformation(origin = {-82, 22}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.Integrator Distance annotation(
    Placement(visible = true, transformation(origin = {30, 74}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  EVLibrary.Components.PowerTrain powerTrain annotation(
    Placement(visible = true, transformation(origin = {-44, 22}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  EVLibrary.Components.InternalCharger internalCharger annotation(
    Placement(visible = true, transformation(origin = {54, 22}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(internalCharger.Currentdemand, converter.ForceRequiredByMotor) annotation(
    Line(points = {{66, 28}, {68, 28}, {68, 28}, {70, 28}}, color = {0, 0, 127}));
  connect(engine_R1.PowerEngine, internalCharger.EngineR) annotation(
    Line(points = {{36, 28}, {40, 28}, {40, 28}, {42, 28}}, color = {0, 0, 127}));
  connect(converter.pin_n, lipo.n) annotation(
    Line(points = {{91, 22}, {91, 9.5}, {91, 9.5}, {91, -1}, {92, -1}, {92, -17.5}, {92, -17.5}, {92, -32}}, color = {0, 0, 255}));
  connect(lipo.p, converter.pin_p) annotation(
    Line(points = {{72, -28}, {72, 26}, {73, 26}}, color = {0, 0, 255}));
  connect(converter.pin_n, ground1.p) annotation(
    Line(points = {{91, 22}, {94.75, 22}, {94.75, 24}, {98.5, 24}, {98.5, 22}, {103.25, 22}, {103.25, 20}, {106, 20}}, color = {0, 0, 255}));
  connect(powerTrain.Gearboxout, kinematics2.Vel) annotation(
    Line(points = {{-32, 30}, {-22, 30}, {-22, 30}, {-22, 30}}, color = {0, 0, 127}));
  connect(nEDCCycle.Accel, kinematics2.Accel) annotation(
    Line(points = {{-70, 24}, {-66, 24}, {-66, -4}, {-28, -4}, {-28, 24}, {-22, 24}, {-22, 24}}, color = {0, 0, 127}));
  connect(powerTrain.FVelin, nEDCCycle.Vel) annotation(
    Line(points = {{-56, 30}, {-72, 30}, {-72, 30}, {-70, 30}}, color = {0, 0, 127}));
  connect(kinematics2.ff, engine_R1.Gearboxin) annotation(
    Line(points = {{1, 28}, {12, 28}}, color = {0, 0, 127}));
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