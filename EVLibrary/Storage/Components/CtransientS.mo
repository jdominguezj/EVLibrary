within EVLibrary.Storage.Components;

model CtransientS
  Real y3;
  Modelica.Blocks.Interfaces.RealInput u annotation(
    Placement(visible = true, transformation(origin = {-26, 74}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-26, 74}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput CTS_Soc annotation(
    Placement(visible = true, transformation(origin = {2, 6}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {2, 6}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  y3 = (-752.9 * exp(-13.51 * u)) + 703.6;
  CTS_Soc = y3;
end CtransientS;
