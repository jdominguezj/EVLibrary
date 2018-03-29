within EVLibrary.Storage.Components;

model Vsoc
Real y5;
  Modelica.Blocks.Interfaces.RealInput u annotation(
    Placement(visible = true, transformation(origin = {-26, 74}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-26, 74}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput VSOC annotation(
    Placement(visible = true, transformation(origin = {2, 6}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {2, 6}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  y5 = (-1.031 * exp(-35 * u)) + 3.685 + 0.2156 * u - 0.1178 * u ^ 2 + 0.3201 * u ^ 3;
  VSOC = y5;
end Vsoc;
