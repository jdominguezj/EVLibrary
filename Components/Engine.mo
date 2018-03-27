within EVLibrary.Components;

model Engine
 flow Modelica.SIunits.Current i;
 parameter Real n2; //Perdidas en motor
  Modelica.Blocks.Interfaces.RealInput Gearboxinput annotation(
    Placement(visible = true, transformation(origin = {-102, 24}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
 Modelica.Mechanics.Rotational.Sources.Torque torque1 annotation(
    Placement(visible = true, transformation(origin = {-46, 24}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
 Modelica.Mechanics.Rotational.Components.Inertia inertia1(J = 0.02)  annotation(
    Placement(visible = true, transformation(origin = {-16, 24}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
 Modelica.Electrical.Analog.Basic.EMF emf(k = 0.9)  annotation(
    Placement(visible = true, transformation(origin = {14, 24}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
 Modelica.Electrical.Analog.Interfaces.PositivePin ToPositiveConverter annotation(
    Placement(visible = true, transformation(origin = {50, 56}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110,50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
 Modelica.Electrical.Analog.Interfaces.NegativePin ToNegativeConverter annotation(
    Placement(visible = true, transformation(origin = {50, 4}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(emf.n, ToNegativeConverter) annotation(
    Line(points = {{14, 14}, {14, 14}, {14, 4}, {50, 4}, {50, 4}}, color = {0, 0, 255}));
  connect(emf.p, ToPositiveConverter) annotation(
    Line(points = {{14, 34}, {14, 34}, {14, 56}, {50, 56}, {50, 56}}, color = {0, 0, 255}));
  connect(inertia1.flange_b, emf.flange) annotation(
    Line(points = {{-6, 24}, {4, 24}, {4, 24}, {4, 24}}));
  connect(torque1.flange, inertia1.flange_a) annotation(
    Line(points = {{-36, 24}, {-26, 24}, {-26, 24}, {-26, 24}, {-26, 24}, {-26, 24}}));
  connect(Gearboxinput, torque1.tau) annotation(
    Line(points = {{-102, 24}, {-58, 24}}, color = {0, 0, 127}));
  torque1.tau = Gearboxinput / n2;
  annotation(
    Icon(graphics = {Rectangle(origin = {-1, 0}, extent = {{-99, 100}, {101, -100}}), Text(origin = {-3, 6}, extent = {{-73, 36}, {73, -36}}, textString = "Engine")}, coordinateSystem(initialScale = 0.1)));
end Engine;
