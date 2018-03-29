within EVLibrary.Storage.Components;

model CtransientL
Real y3;
  Modelica.Blocks.Interfaces.RealInput u annotation(
    Placement(visible = true, transformation(origin = {-26, 74}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-26, 74}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput CTL_Soc annotation(
    Placement(visible = true, transformation(origin = {2, 6}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {2, 6}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  y3 = (-6056.9 * exp(-27.12 * u)) + 4475;
  CTL_Soc = y3;
end CtransientL;
