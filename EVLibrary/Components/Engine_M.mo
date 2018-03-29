within EVLibrary.Components;

model Engine_M
  import SI = Modelica.SIunits;
  parameter Real n2=0.85; //Perdidas en motor
  parameter Real k(final unit = "N.m/A") = 0.85 "Transformation coefficient for EMF";
  parameter Real J = 0.01 "Inertia";
  extends Modelica.Electrical.Analog.Interfaces.TwoPin;
  flow Real i;
 Modelica.Blocks.Interfaces.RealInput Gearboxinput annotation(
    Placement(visible = true, transformation(origin = {-66, -14}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, 80}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
 Modelica.Mechanics.Rotational.Sources.Torque torque1(useSupport = true)  annotation(
    Placement(visible = true, transformation(origin = {-26, -14}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
 Modelica.Mechanics.Rotational.Components.Inertia inertia1(J = J)  annotation(
    Placement(visible = true, transformation(origin = {4, -14}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
 Modelica.Electrical.Analog.Basic.EMF emf(k = k, useSupport = true)  annotation(
    Placement(visible = true, transformation(origin = {34, -14}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
 Modelica.Mechanics.Rotational.Components.Fixed fixed1 annotation(
    Placement(visible = true, transformation(origin = {-26, -42}, extent = {{-10, -10}, {10, 10}}, rotation = 0))); 
  equation
  connect(fixed1.flange, torque1.support) annotation(
    Line(points = {{-26, -42}, {-26, -24}}));
  connect(emf.support, fixed1.flange) annotation(
    Line(points = {{44, -14}, {44, -42}, {-26, -42}}));
  connect(emf.n, n) annotation(
    Line(points = {{34, -24}, {100, -24}, {100, 0}, {100, 0}}, color = {0, 0, 255}));
  connect(p, emf.p) annotation(
    Line(points = {{-100, 0}, {32, 0}, {32, -4}, {34, -4}}, color = {0, 0, 255}));
  torque1.flange.tau = Gearboxinput / n2;
  connect(inertia1.flange_b, emf.flange) annotation(
    Line(points = {{14, -14}, {24, -14}, {24, -14}, {24, -14}}));
  connect(torque1.flange, inertia1.flange_a) annotation(
    Line(points = {{-16, -14}, {-11, -14}, {-11, -14}, {-6, -14}, {-6, -14}, {-6, -14}, {-6, -14}, {-6, -14}}));
  connect(Gearboxinput, torque1.tau) annotation(
    Line(points = {{-66, -14}, {-38, -14}}, color = {0, 0, 127}));
  annotation(
    Icon(graphics = {Rectangle(origin = {-1, 0}, extent = {{-99, 100}, {101, -100}}), Text(origin = {-3, 6}, extent = {{-73, 36}, {73, -36}}, textString = "Engine")}, coordinateSystem(initialScale = 0.1)));
end Engine_M;
