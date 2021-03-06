within EVLibrary.Storage.Components;

model RtransientL
Real y1;
  Modelica.Blocks.Interfaces.RealInput u annotation(
    Placement(visible = true, transformation(origin = {-26, 74}, extent = {{-20, -20}, {20, 20}}, rotation = -90), iconTransformation(origin = {0, 74}, extent = {{-20, -20}, {20, 20}}, rotation = -90)));
  Modelica.Blocks.Interfaces.RealOutput RTL_Soc annotation(
    Placement(visible = true, transformation(origin = {2, 6}, extent = {{-10, -10}, {10, 10}}, rotation = -90), iconTransformation(origin = {2, 6}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
equation
  y1 = 6.603 * exp(-155.2 * u) + 0.04984;
  RTL_Soc = y1;
end RtransientL;
