within EVLibrary.Components;


model Engine
  
  Real Efficiency;
  Real Vpu;
  //Perdidas en motor
  Modelica.Blocks.Interfaces.RealInput Gearboxin annotation(
    Placement(visible = true, transformation(origin = {-102, 24}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, 60}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput PowerEngine annotation(
    Placement(visible = true, transformation(origin = {86, 34}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput u annotation(
    Placement(visible = true, transformation(origin = {-90, 66}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {0, 120}, extent = {{-20, -20}, {20, 20}}, rotation = -90)));
equation
  Vpu= u/40.8333;
  Efficiency= if Vpu<0.25 then 0.4  else (2.1036*(Vpu^3))-(5.4963*(Vpu^2))+(4.7997*Vpu)-0.4525;
 //   Efficiency= if Vpu<0.25 then 0.2  else (2.1036*(Vpu^3))-(5.4963*(Vpu^2))+(4.7997*Vpu)-0.4525; // for vpu less than 0.25
// Efficiency= if Vpu<0.25 then 0.1  else (2.1036*(Vpu^3))-(5.4963*(Vpu^2))+(4.7997*Vpu)-0.4525;// for vpu less than 0.25
  PowerEngine = Gearboxin / Efficiency;
  annotation(
    Icon(graphics = {Rectangle(origin = {-1, 0}, extent = {{-99, 100}, {101, -100}}), Rectangle(origin = {0, 9}, fillColor = {115, 111, 106}, fillPattern = FillPattern.Solid, extent = {{-60, 29}, {60, -29}}), Polygon(origin = {0, -30}, points = {{-70, -10}, {-60, 10}, {60, 10}, {70, -10}, {-70, -10}}), Rectangle(origin = {-77, 10}, pattern = LinePattern.Dash, fillPattern = FillPattern.Backward, extent = {{17, 4}, {-17, -4}})}, coordinateSystem(initialScale = 0.1)));
end Engine;
