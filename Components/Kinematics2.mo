within EVLibrary.Components;

model Kinematics2
//http://media.chevrolet.com/media/us/en/chevrolet/news.detail.html/content/Pages/news/us/en/2016/Jan/naias/chevy/0111-bolt-du.html
  Real tr=1; //Final drive ratio: 7.05:1
  EVLibrary.Chassis.Bolt2 bolt2 annotation(
    Placement(visible = true, transformation(origin = {7.10543e-15, 26}, extent = {{-22, -22}, {22, 22}}, rotation = 0)));
  EVLibrary.Road.Asphalt asphalt1 annotation(
    Placement(visible = true, transformation(origin = {52, 30}, extent = {{-18, -18}, {18, 18}}, rotation = 0)));
  Modelica.SIunits.Force ft, fa, fr, fg;
  Modelica.Blocks.Interfaces.RealOutput ff annotation(
      Placement(visible = true, transformation(origin = {-62, 6}, extent = {{-16, -16}, {16, 16}}, rotation = 0), iconTransformation(origin = {110, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput Vel annotation(
      Placement(visible = true, transformation(origin = {-78, 70}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, 80}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput Accel annotation(
      Placement(visible = true, transformation(origin = {-78, 42}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, 20}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));  equation
    fa = 1 / 2 *(asphalt1.ro) *(bolt2.cda)* Vel ^ 2;
    fr = (asphalt1.cr) *(bolt2.Mv)*(asphalt1.g) * cos(asphalt1.angle);
    fg = (bolt2.Mv) *(asphalt1.g) * sin(asphalt1.angle);
    ft = (tr/(bolt2.Rw) *(bolt2.Te))- ((tr ^ 2 / (bolt2.Rw^2)) * (bolt2.Je) +( (1 /(bolt2.Rw^2)) * (bolt2.Jw))) * Accel;
    ff = ft - (fa + fr + fg);
    annotation(
      Icon(graphics = {Rectangle(origin = {-1, 0}, extent = {{-99, 100}, {101, -100}}), Text(origin = {-22, 20}, extent = {{-50, 28}, {102, -64}}, textString = "Kinematics")}, coordinateSystem(initialScale = 0.1)));
 
end Kinematics2;