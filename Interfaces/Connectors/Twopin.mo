within EVLibrary.Interfaces.Connectors;

partial model Twopin
Modelica.SIunits.Voltage v;
Modelica.SIunits.Current i;
  EVLibrary.Interfaces.Connectors.PositivePin pin_p annotation(
    Placement(visible = true, transformation(origin = {-96, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-90, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  EVLibrary.Interfaces.Connectors.NegativePin pin_n annotation(
    Placement(visible = true, transformation(origin = {96, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {90, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0))); 
equation
v = pin_p.v - pin_n.v;
0 = pin_p.i + pin_n.i;
i = pin_p.i;
end Twopin;