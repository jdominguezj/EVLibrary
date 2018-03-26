within EVLibrary.Storage.Components;

model RtransientS
 Real y2;
  Modelica.Blocks.Interfaces.RealInput u annotation(
    Placement(visible = true, transformation(origin = {-26, 74}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {0, 74}, extent = {{-20, -20}, {20, 20}}, rotation = -90)));
  Modelica.Blocks.Interfaces.RealOutput RTS_Soc annotation(
    Placement(visible = true, transformation(origin = {2, 6}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {2, 6}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
equation
  y2 = 0.1562 * exp(-24.37 * u) + 0.07446;
  RTS_Soc = y2;
end RtransientS;
