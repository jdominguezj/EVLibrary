within EVLibrary.Components;

model Resistor
extends Interfaces.Connectors.Twopin;
parameter Modelica.SIunits.Resistance R "Resistance in Ohmns";
equation
v = R*i;
annotation(
    Icon(graphics = {Text(origin = {1, 0}, extent = {{-79, 40}, {79, -40}}, textString = "R")}));
end Resistor;