within EVLibrary.Storage.Components;

model RSeries
  Real y;
Modelica.Blocks.Interfaces.RealInput u annotation(
    Placement(visible = true, transformation(origin = {-26, 74}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {0, 58}, extent = {{-20, -20}, {20, 20}}, rotation = -90)));
  Modelica.Blocks.Interfaces.RealOutput Rseries_Soc annotation(
    Placement(visible = true, transformation(origin = {2, 6}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {0, -50}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
equation
  y = 0.1562 * exp(-24.37 * u) + 0.07446;
  Rseries_Soc = y;
end RSeries;
