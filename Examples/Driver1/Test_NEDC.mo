within EVLibrary.Examples.Driver1;

model Test_NEDC
  EVLibrary.Chassis.Bolt Bolt1(tr = 2)  annotation(
    Placement(visible = true, transformation(origin = {-55, 73}, extent = {{-33, -33}, {33, 33}}, rotation = 0)));
  EVLibrary.Road.Asphalt asphalt1 annotation(
    Placement(visible = true, transformation(origin = {-58, -56}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  EVLibrary.Components.Kinematics kinematics1 annotation(
    Placement(visible = true, transformation(origin = {-30, 22}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  EVLibrary.Components.Engine_R engine_R1(n2 = 0.94) annotation(
    Placement(visible = true, transformation(origin = {10, 22}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  EVLibrary.Components.Converter converter annotation(
    Placement(visible = true, transformation(origin = {60, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Ground ground1 annotation(
    Placement(visible = true, transformation(origin = {84, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  EVLibrary.Storage.Cell.Lipo lipo annotation(
    Placement(visible = true, transformation(origin = {60, -32}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const(k = 0) annotation(
    Placement(visible = true, transformation(origin = {32, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  EVLibrary.Profiles.NEDCCycle nEDCCycle annotation(
    Placement(visible = true, transformation(origin = {-76, 22}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.Integrator Distance annotation(
    Placement(visible = true, transformation(origin = {30, 74}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(nEDCCycle.Accel, kinematics1.Accel) annotation(
    Line(points = {{-64, 24}, {-42, 24}, {-42, 24}, {-42, 24}}, color = {0, 0, 127}));
  connect(nEDCCycle.Vel, kinematics1.Vel) annotation(
    Line(points = {{-64, 30}, {-44, 30}, {-44, 30}, {-42, 30}}, color = {0, 0, 127}));
  connect(const.y, lipo.Irb) annotation(
    Line(points = {{44, -60}, {60, -60}, {60, -44}, {60, -44}}, color = {0, 0, 127}));
  connect(converter.pin_n, lipo.n) annotation(
    Line(points = {{70, 30}, {70, -32}}, color = {0, 0, 255}));
  connect(lipo.p, converter.pin_p) annotation(
    Line(points = {{50, -32}, {50, 30}, {52, 30}}, color = {0, 0, 255}));
  connect(converter.pin_n, ground1.p) annotation(
    Line(points = {{69, 30}, {84, 30}}, color = {0, 0, 255}));
  connect(engine_R1.PowerEngine, converter.ForceRequiredByMotor) annotation(
    Line(points = {{21, 22}, {48, 22}}, color = {0, 0, 127}));
  connect(kinematics1.ff, engine_R1.Gearboxin) annotation(
    Line(points = {{-19, 22}, {-2, 22}}, color = {0, 0, 127}));
//regBrake.a = nEDCCycle.Accel;
//regBrake.BoolDec = nEDCCycle.BoolDec;
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