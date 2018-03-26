within EVLibrary.Braking;

model RegBrake
  extends Modelica.Electrical.Analog.Interfaces.TwoPin;
  parameter Real Mav;
  parameter Real Rw;
  Real pp;
  //Pedal position
  Real g = 10;
  //gravedad
  Real rnowf;
  //  Modelica.SIunits.Voltage v "Voltage drop between the two pins (= p.v - n.v)";
  Modelica.SIunits.Torque telectric;
  Modelica.SIunits.Torque tmechanic;
  Modelica.SIunits.Force bkf;
  Modelica.Blocks.Interfaces.RealInput a annotation(
    Placement(visible = true, transformation(origin = {-106, 32}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, 80}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.BooleanInput BoolDec annotation(
    Placement(visible = true, transformation(origin = {-6, 38}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {0, 120}, extent = {{-20, -20}, {20, 20}}, rotation = -90)));
  Modelica.SIunits.Power preg;
  Modelica.SIunits.Current ireg;
  Modelica.Electrical.Analog.Basic.Ground ground1 annotation(
    Placement(visible = true, transformation(origin = {104, -38}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(n, ground1.p) annotation(
    Line(points = {{100, 0}, {100, 0}, {100, -18}, {104, -18}, {104, -28}, {104, -28}}, color = {0, 0, 255}));
  rnowf = pp * Mav;
//Maxima fuerza necesario para detener el vehiculo
  bkf = g * Mav;
//Force needly to stop vehicle at gravity deceleration
  pp = if a < (-0.01) then abs(a) else 0;
  telectric = if rnowf <= 0.3 * bkf then rnowf * Rw else 0;
  tmechanic = if rnowf >= 0.3 * bkf then rnowf * Rw else 0;
  preg = if rnowf <= 0.3 * bkf then telectric * 0.0010 / 0.002 else 0;
  ireg = if rnowf <= 0.3 * bkf then preg / 380 else 0;
  p.i = ireg;
  //p.i + n.i = 0;
  annotation(
    Icon(graphics = {Rectangle(extent = {{-100, 100}, {100, -100}}), Text(origin = {4, 9}, extent = {{-42, 35}, {42, -35}}, textString = "RB")}, coordinateSystem(initialScale = 0.1)));

end RegBrake;
