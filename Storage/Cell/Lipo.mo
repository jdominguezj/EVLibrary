within EVLibrary.Storage.Cell;

model Lipo
 extends Modelica.Electrical.Analog.Interfaces.TwoPin;
  Modelica.Electrical.Analog.Sensors.CurrentSensor currentSensor1 annotation(
    Placement(visible = true, transformation(origin = {54, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Ground ground1 annotation(
    Placement(visible = true, transformation(origin = {-50, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Resistor resistor1(R = 99999) annotation(
    Placement(visible = true, transformation(origin = {-80, -40}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Basic.Capacitor capacitor1(C = 3600 * 60) annotation(
    Placement(visible = true, transformation(origin = {-60, -40}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Sources.SignalCurrent signalCurrent1 annotation(
    Placement(visible = true, transformation(origin = {14, -38}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Math.Gain gain1(k = 0.5) annotation(
    Placement(visible = true, transformation(origin = {56, 38}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Sources.SignalCurrent signalCurrent2 annotation(
    Placement(visible = true, transformation(origin = {-20, -38}, extent = {{-10, 10}, {10, -10}}, rotation = 90)));
  Modelica.Blocks.Interfaces.RealInput Irb annotation(
    Placement(visible = true, transformation(origin = {-74, -78}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {0, 120}, extent = {{-20, -20}, {20, 20}}, rotation = -90)));
  Modelica.Blocks.Math.Feedback feedback1 annotation(
    Placement(visible = true, transformation(origin = {4, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Blocks.Math.Abs abs1 annotation(
    Placement(visible = true, transformation(origin = {34, 2}, extent = {{-6, -6}, {6, 6}}, rotation = 90)));
  Modelica.Electrical.Analog.Sensors.VoltageSensor voltageSensor1 annotation(
    Placement(visible = true, transformation(origin = {34, -20}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const(k = 1) annotation(
    Placement(visible = true, transformation(origin = {4, -6}, extent = {{-6, -6}, {6, 6}}, rotation = 90)));
 EVLibrary.Storage.Elements.VSOC vsoc1 annotation(
    Placement(visible = true, transformation(origin = {-50, 40}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
 Elements.RSerie rSerie1 annotation(
    Placement(visible = true, transformation(origin = {-40, 66}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
 Elements.RTransS rTransS1 annotation(
    Placement(visible = true, transformation(origin = {-16, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
 EVLibrary.Storage.Elements.CTransS cTransS1 annotation(
    Placement(visible = true, transformation(origin = {-16, 54}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
 Elements.RTransL rTransL1 annotation(
    Placement(visible = true, transformation(origin = {14, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
 Elements.CTransL cTransL1 annotation(
    Placement(visible = true, transformation(origin = {14, 54}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(rTransL1.n, currentSensor1.p) annotation(
    Line(points = {{24, 80}, {44, 80}, {44, 80}, {44, 80}}, color = {0, 0, 255}));
  connect(currentSensor1.n, p) annotation(
    Line(points = {{64, 80}, {72, 80}, {72, 98}, {-100, 98}, {-100, 0}}, color = {0, 0, 255}));
  connect(currentSensor1.i, gain1.u) annotation(
    Line(points = {{54, 70}, {54, 57}, {56, 57}, {56, 50}}, color = {0, 0, 127}));
  connect(cTransS1.u, cTransL1.u) annotation(
    Line(points = {{-16, 60}, {-16, 66}, {14, 66}, {14, 60}}, color = {0, 0, 127}));
  connect(vsoc1.u, cTransS1.u) annotation(
    Line(points = {{-44, 40}, {0, 40}, {0, 66}, {-16, 66}, {-16, 60}, {-16, 60}, {-16, 60}}, color = {0, 0, 127}));
  connect(feedback1.y, rTransL1.u) annotation(
    Line(points = {{4, 30}, {4, 30}, {4, 40}, {0, 40}, {0, 92}, {14, 92}, {14, 86}, {14, 86}}, color = {0, 0, 127}));
  connect(feedback1.y, rTransS1.u) annotation(
    Line(points = {{4, 30}, {4, 40}, {0, 40}, {0, 92}, {-16, 92}, {-16, 86}}, color = {0, 0, 127}));
  connect(rSerie1.u, vsoc1.u) annotation(
    Line(points = {{-40, 72}, {-40, 72}, {-40, 88}, {-32, 88}, {-32, 40}, {-44, 40}, {-44, 40}}, color = {0, 0, 127}));
  connect(rTransL1.n, cTransL1.n) annotation(
    Line(points = {{24, 80}, {24, 80}, {24, 54}, {24, 54}}, color = {0, 0, 255}));
  connect(rTransL1.p, cTransL1.p) annotation(
    Line(points = {{4, 80}, {4, 80}, {4, 54}, {4, 54}}, color = {0, 0, 255}));
  connect(rTransS1.n, rTransL1.p) annotation(
    Line(points = {{-6, 80}, {4, 80}, {4, 80}, {4, 80}}, color = {0, 0, 255}));
  connect(cTransS1.n, rTransS1.n) annotation(
    Line(points = {{-6, 54}, {-6, 54}, {-6, 80}, {-6, 80}}, color = {0, 0, 255}));
  connect(cTransS1.p, rSerie1.n) annotation(
    Line(points = {{-26, 54}, {-26, 54}, {-26, 66}, {-30, 66}, {-30, 66}}, color = {0, 0, 255}));
  connect(rTransS1.p, rSerie1.n) annotation(
    Line(points = {{-26, 80}, {-26, 80}, {-26, 66}, {-30, 66}, {-30, 66}}, color = {0, 0, 255}));
  connect(rSerie1.p, vsoc1.p) annotation(
    Line(points = {{-50, 66}, {-50, 66}, {-50, 50}, {-50, 50}}, color = {0, 0, 255}));
  connect(vsoc1.u, feedback1.y) annotation(
    Line(points = {{-44, 40}, {4, 40}, {4, 30}, {4, 30}}, color = {0, 0, 127}));
  connect(vsoc1.n, ground1.p) annotation(
    Line(points = {{-50, 30}, {-50, 30}, {-50, 20}, {-50, 20}}, color = {0, 0, 255}));
  connect(feedback1.u2, abs1.y) annotation(
    Line(points = {{12, 20}, {34, 20}, {34, 9}}, color = {0, 0, 127}));
  connect(voltageSensor1.v, abs1.u) annotation(
    Line(points = {{34, -10}, {34, -5}}, color = {0, 0, 127}));
  connect(feedback1.u1, const.y) annotation(
    Line(points = {{4, 12}, {4, 12}, {4, 0}, {4, 0}}, color = {0, 0, 127}));
  connect(voltageSensor1.n, n) annotation(
    Line(points = {{44, -20}, {100, -20}, {100, 0}, {100, 0}}, color = {0, 0, 255}));
  connect(voltageSensor1.p, signalCurrent1.p) annotation(
    Line(points = {{24, -20}, {14, -20}, {14, -28}, {14, -28}, {14, -28}}, color = {0, 0, 255}));
  connect(Irb, signalCurrent2.i) annotation(
    Line(points = {{-74, -78}, {-40, -78}, {-40, -78}, {-8, -78}, {-8, -38}, {-12, -38}, {-12, -38}}, color = {0, 0, 127}));
  connect(signalCurrent2.p, n) annotation(
    Line(points = {{-20, -48}, {-20, -48}, {-20, -60}, {100, -60}, {100, 0}, {100, 0}}, color = {0, 0, 255}));
  connect(signalCurrent2.n, capacitor1.p) annotation(
    Line(points = {{-20, -28}, {-20, -28}, {-20, -20}, {-60, -20}, {-60, -30}, {-60, -30}}, color = {0, 0, 255}));
  connect(signalCurrent1.p, capacitor1.p) annotation(
    Line(points = {{14, -28}, {14, -28}, {14, -22}, {14, -22}, {14, -20}, {-60, -20}, {-60, -30}, {-60, -30}}, color = {0, 0, 255}));
  connect(gain1.y, signalCurrent1.i) annotation(
    Line(points = {{56, 26}, {56, -38}, {21, -38}}, color = {0, 0, 127}));
  connect(signalCurrent1.n, capacitor1.n) annotation(
    Line(points = {{14, -48}, {14, -60}, {-60, -60}, {-60, -50}}, color = {0, 0, 255}));
  connect(capacitor1.n, n) annotation(
    Line(points = {{-60, -50}, {-60, -50}, {-60, -60}, {100, -60}, {100, 0}, {100, 0}}, color = {0, 0, 255}));
  connect(resistor1.n, capacitor1.n) annotation(
    Line(points = {{-80, -50}, {-80, -50}, {-80, -60}, {-60, -60}, {-60, -50}, {-60, -50}}, color = {0, 0, 255}));
  connect(resistor1.p, capacitor1.p) annotation(
    Line(points = {{-80, -30}, {-80, -30}, {-80, -20}, {-60, -20}, {-60, -30}, {-60, -30}}, color = {0, 0, 255}));
end Lipo;
