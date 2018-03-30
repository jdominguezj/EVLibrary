within EVLibrary.Storage.Cell;

model Lipo
//Lipo single cell

//Charge capacity =3600⋅Capacity⋅ f1(Cycle)⋅ f2(Temp)  Taken from: An Accurate Electrical Battery Model Capable of Predicting Runtime and I–V Performance

 extends Modelica.Electrical.Analog.Interfaces.TwoPin;
  Modelica.Electrical.Analog.Sensors.CurrentSensor currentSensor1 annotation(
    Placement(visible = true, transformation(origin = {54, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Ground ground1 annotation(
    Placement(visible = true, transformation(origin = {-50, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Resistor resistor1(R = 99999) annotation(
    Placement(visible = true, transformation(origin = {-80, -40}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Basic.Capacitor capacitor1(C = 3600 * 158) annotation(
    Placement(visible = true, transformation(origin = {-60, -40}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Sources.SignalCurrent signalCurrent1 annotation(
    Placement(visible = true, transformation(origin = {14, -38}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Math.Gain gain1(k = 0.5) annotation(
    Placement(visible = true, transformation(origin = {56, 38}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Sources.SignalCurrent signalCurrent2 annotation(
    Placement(visible = true, transformation(origin = {-20, -38}, extent = {{-10, 10}, {10, -10}}, rotation = 90)));
  Modelica.Blocks.Interfaces.RealInput Irb annotation(
    Placement(visible = true, transformation(origin = {-112, -74}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {0, -120}, extent = {{20, -20}, {-20, 20}}, rotation = -90)));
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
 Modelica.Blocks.Sources.Constant const1(k = -1)  annotation(
    Placement(visible = true, transformation(origin = {-102, -98}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
 Modelica.Blocks.Math.Product product1 annotation(
    Placement(visible = true, transformation(origin = {-28, -82}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(Irb, product1.u1) annotation(
    Line(points = {{-112, -74}, {-40, -74}, {-40, -76}, {-40, -76}}, color = {0, 0, 127}));
  connect(const1.y, product1.u2) annotation(
    Line(points = {{-90, -98}, {-54, -98}, {-54, -88}, {-40, -88}, {-40, -88}}, color = {0, 0, 127}));
  connect(product1.y, signalCurrent2.i) annotation(
    Line(points = {{-16, -82}, {-4, -82}, {-4, -38}, {-12, -38}, {-12, -38}}, color = {0, 0, 127}));
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
annotation(
    Icon(graphics = {Bitmap(origin = {26, -12},extent = {{-110, 102}, {60, -78}}, imageSource = "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")}));
    end Lipo;