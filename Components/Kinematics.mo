within EVLibrary.Components;

model Kinematics
  Real tr=1;
  EVLibrary.Chassis.Prius prius1 annotation(
    Placement(visible = true, transformation(origin = {7.10543e-15, 26}, extent = {{-22, -22}, {22, 22}}, rotation = 0)));
  EVLibrary.Road.Asphalt asphalt1 annotation(
    Placement(visible = true, transformation(origin = {52, 30}, extent = {{-18, -18}, {18, 18}}, rotation = 0)));
  Modelica.SIunits.Force ft, fa, fr, fg;
  Modelica.Blocks.Interfaces.RealInput Vel annotation(
      Placement(visible = true, transformation(origin = {-78, 70}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, 80}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput Accel annotation(
      Placement(visible = true, transformation(origin = {-78, 42}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, 20}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
 Modelica.Mechanics.Translational.Sources.Force force1 annotation(
    Placement(visible = true, transformation(origin = {60, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
 Modelica.Mechanics.Translational.Interfaces.Flange_b flange_b annotation(
    Placement(visible = true, transformation(origin = {92, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, 2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));  equation
  connect(force1.flange, flange_b) annotation(
    Line(points = {{70, -20}, {92, -20}}, color = {0, 127, 0}));
    fa = 1 / 2 *(asphalt1.ro) *(prius1.cda)* Vel ^ 2;
    fr = (asphalt1.cr) *(prius1.Mv)*(asphalt1.g) * cos(asphalt1.angle);
    fg = (prius1.Mv) *(asphalt1.g) * sin(asphalt1.angle);
    ft = tr / (prius1.Rw) *(prius1.Te) - (tr ^ 2 / (prius1.Rw^2) * (prius1.Je) + 1 /(prius1.Rw^2) * (prius1.Jw)) * Accel;
    force1.f = ft - (fa + fr + fg);
    annotation(
      Icon(graphics = {Rectangle(origin = {-1, 0}, extent = {{-99, 100}, {101, -100}}), Text(origin = {-22, 20}, extent = {{-50, 28}, {102, -64}}, textString = "Kinematics")}, coordinateSystem(initialScale = 0.1)));
 
end Kinematics;
