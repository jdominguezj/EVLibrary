within EVLibrary.Components;


model Kinematics
//http://media.chevrolet.com/media/us/en/chevrolet/news.detail.html/content/Pages/news/us/en/2016/Jan/naias/chevy/0111-bolt-du.html
  Real tr=1; //Final drive ratio: 7.05:1
  parameter Real k;
  Real cr; //Rolling resistance coeff
  EVLibrary.Chassis.Bolt Bolt annotation(
    Placement(visible = true, transformation(origin = {7.10543e-15, 26}, extent = {{-22, -22}, {22, 22}}, rotation = 0)));
  EVLibrary.Road.RBolt RBolt annotation(
    Placement(visible = true, transformation(origin = {52, 30}, extent = {{-18, -18}, {18, 18}}, rotation = 0)));
  Modelica.SIunits.Force fa, fr, fg;
  Modelica.Blocks.Interfaces.RealOutput ff annotation(
      Placement(visible = true, transformation(origin = {-62, 6}, extent = {{-16, -16}, {16, 16}}, rotation = 0), iconTransformation(origin = {110, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput Vel annotation(
      Placement(visible = true, transformation(origin = {-78, 70}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-119, 81}, extent = {{-21, -21}, {21, 21}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput Accel annotation(
      Placement(visible = true, transformation(origin = {-78, 42}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, 20}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));  equation
    cr=(0.000001*Vel^2)+(0.000005*Vel)+0.0056;
    fa = 1 / 2 *(RBolt.ro) *(Bolt.cda)* Vel ^ 2;
    fr = cr*(Bolt.Mv)*(RBolt.g) * cos(RBolt.angle);
    fg = (Bolt.Mv) *(RBolt.g) * sin(RBolt.angle);
    //ft = (tr/(Bolt.Rw) *(Bolt.Te))- (tr ^ 2 / (Bolt.Rw^2) * (Bolt.Je) + (1 /(Bolt.Rw^2)) * (Bolt.Jw)) * Accel;
   // ft = (tr ^ 2 / (Bolt.Rw^2) * (Bolt.Je) +Bolt.Mv + (1 /(Bolt.Rw^2)) * (Bolt.Jw))* Accel;
    ff = (fa + fr + fg)*Vel*k;//In watts
   annotation(
      Icon(graphics = {Rectangle(origin = {-1, 0}, extent = {{-99, 100}, {101, -100}}), Ellipse(origin = {-36, -41}, lineThickness = 0.75, extent = {{32, -31}, {-32, 31}}, endAngle = 360), Line(origin = {-1, -63}, points = {{-99, -35}, {99, 35}}), Line(origin = {160, 6}, points = {{0, 0}}), Line(origin = {-42.06, -1.14}, points = {{36.06, -28.855}, {52.06, -22.855}, {58.06, -10.855}, {54.06, 1.145}, {26.06, 19.145}, {-29.94, 29.145}, {-57.94, 27.145}, {-57.94, 27.145}, {-57.94, 27.145}}, thickness = 0.75), Line(origin = {-10, 62}, points = {{-38, -12}, {38, 12}}, thickness = 1.5), Polygon(origin = {-50, 51}, fillPattern = FillPattern.Solid, points = {{-8, -3}, {2, 9}, {2, -1}, {8, -9}, {-8, -3}}), Line(origin = {34.4207, 36.9534}, points = {{-44, -14}, {38, 12}}, thickness = 1.5), Polygon(origin = {-8, 25}, fillPattern = FillPattern.Solid, points = {{-8, -3}, {2, 9}, {2, -1}, {8, -9}, {-8, -3}}), Line(origin = {7.97227, -26.6444}, points = {{-44, -14}, {38, 12}}, thickness = 1.5), Polygon(origin = {48, -15}, rotation = 180, fillPattern = FillPattern.Solid, points = {{-8, -3}, {2, 9}, {2, -1}, {8, -9}, {-8, -3}}), Line(origin = {-54, -23}, points = {{-18, 19}, {18, -19}}), Polygon(origin = {-55, -23}, fillPattern = FillPattern.Solid, points = {{-3, -1}, {3, -3}, {3, -1}, {3, 3}, {-3, -1}}), Text(origin = {31, 89}, extent = {{-15, -13}, {7, 3}}, textString = "Fd", textStyle = {TextStyle.Italic}), Text(origin = {65, 65}, extent = {{-15, -13}, {7, 3}}, textString = "Fa", textStyle = {TextStyle.Italic}), Text(origin = {65, 9}, extent = {{-15, -13}, {7, 3}}, textString = "Ft", textStyle = {TextStyle.Italic})}, coordinateSystem(initialScale = 0.1)));
 
 
end Kinematics;


