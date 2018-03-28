within EVLibrary.Braking;

model RegBrake_FV
extends Modelica.Electrical.Analog.Interfaces.TwoPin;
  parameter Real Mav(displayUnit = "Kg",quantity = "Mass", unit = "Kg");
  parameter Real Rw(displayUnit = "Meters",quantity = "Radius", unit = "m");
  Real pp(displayUnit = "m/s^2",quantity = "Pedal Position", unit = "m/s^2") "Pedal position deceleration in m/s^2";
  Real g = 10;
  //gravedad
  Real rnowf(quantity = "Rightnow max force needed to stop vehicle", unit = "N.m");
  //  Modelica.SIunits.Voltage v "Voltage drop between the two pins (= p.v - n.v)";
  Modelica.SIunits.Torque telectric;
  Modelica.SIunits.Torque tmechanic;
  Modelica.SIunits.Force bkf;
  Modelica.Blocks.Interfaces.RealInput a  annotation(
    Placement(visible = true, transformation(origin = {-106, 32}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, 60}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.BooleanInput BoolDec annotation(
    Placement(visible = true, transformation(origin = {-6, 38}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-60, 120}, extent = {{-20, -20}, {20, 20}}, rotation = -90)));
  Modelica.SIunits.Power preg;
  Modelica.SIunits.Current ireg;
  Modelica.Electrical.Analog.Basic.Ground ground1 annotation(
    Placement(visible = true, transformation(origin = {104, -38}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput vel annotation(
    Placement(visible = true, transformation(origin = {-78, 70}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, -60}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));  equation
  rnowf = vel * Mav; //Fuerza necesaria [en cada instante de tiempo en funcion del porcentaje de frenado
  bkf = g * Mav;    //Force needly to stop vehicle at gravity deceleration
  pp = if a < (-0.01) then abs(a) else 0;
  telectric = if rnowf <= 0.3 * bkf then rnowf * Rw else 0; //Torque electric
  tmechanic = if rnowf >= 0.3 * bkf then rnowf * Rw else 0; //Torque mechanic
  //preg = if rnowf <= 0.3 * bkf then telectric * 0.0010 / 0.002 else 0;
  preg = if rnowf <= 0.3 * bkf then telectric/ 0.002 else 0;
  ireg = if rnowf <= 0.3 * bkf then preg / 380 else 0;
  p.i = ireg;
 
  //p.i + n.i = 0;
  connect(n, ground1.p) annotation(
    Line(points = {{100, 0}, {100, 0}, {100, -18}, {104, -18}, {104, -28}, {104, -28}}, color = {0, 0, 255}));
 
  annotation(
    Icon(graphics = {Rectangle(extent = {{-100, 100}, {100, -100}}), Bitmap(origin = {5, -7}, extent = {{-91, 99}, {89, -89}}, imageSource = "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")}, coordinateSystem(initialScale = 0.1)));

end RegBrake_FV;