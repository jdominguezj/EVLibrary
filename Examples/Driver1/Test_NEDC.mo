within EVLibrary.Examples.Driver1;

model Test_NEDC
  Real Distance2;
  EVLibrary.Chassis.Bolt Bolt1(tr = 7) annotation(
    Placement(visible = true, transformation(origin = {-65, -17}, extent = {{-33, -33}, {33, 33}}, rotation = 0)));
  EVLibrary.Road.Asphalt asphalt1 annotation(
    Placement(visible = true, transformation(origin = {-20, -56}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  EVLibrary.Components.Kinematics kinematics1 annotation(
    Placement(visible = true, transformation(origin = {-30, 22}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  EVLibrary.Components.Engine_R engine_R1(n2 = 0.94) annotation(
    Placement(visible = true, transformation(origin = {10, 22}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  EVLibrary.Components.Converter converter annotation(
    Placement(visible = true, transformation(origin = {60, 22}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Ground ground1 annotation(
    Placement(visible = true, transformation(origin = {82, 12}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  EVLibrary.Storage.Cell.Lipo lipo annotation(
    Placement(visible = true, transformation(origin = {60, -28}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  EVLibrary.Profiles.NEDCCycle nEDCCycle annotation(
    Placement(visible = true, transformation(origin = {-76, 22}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.Integrator Distance annotation(
    Placement(visible = true, transformation(origin = {30, 74}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(nEDCCycle.Accel, kinematics1.Accel) annotation(
    Line(points = {{-65, 24}, {-53.5, 24}, {-53.5, 22}, {-42, 22}}, color = {0, 0, 127}));
  connect(nEDCCycle.Vel, kinematics1.Vel) annotation(
    Line(points = {{-65, 30}, {-53.5, 30}, {-53.5, 28}, {-42, 28}}, color = {0, 0, 127}));
  connect(kinematics1.ff, engine_R1.Gearboxin) annotation(
    Line(points = {{-19, 26}, {-10.5, 26}, {-10.5, 28}, {-2, 28}}, color = {0, 0, 127}));
  connect(engine_R1.PowerEngine, converter.ForceRequiredByMotor) annotation(
    Line(points = {{21, 30}, {34.5, 30}, {34.5, 28}, {48, 28}}, color = {0, 0, 127}));
  connect(converter.pin_n, ground1.p) annotation(
    Line(points = {{69, 24}, {76.5, 24}, {76.5, 22}, {84, 22}}, color = {0, 0, 255}));
  connect(converter.pin_n, lipo.n) annotation(
    Line(points = {{69, 24}, {69, -1}, {70, -1}, {70, -30}}, color = {0, 0, 255}));
  connect(lipo.p, converter.pin_p) annotation(
    Line(points = {{50, -30}, {50, 24}, {51, 24}}, color = {0, 0, 255}));
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