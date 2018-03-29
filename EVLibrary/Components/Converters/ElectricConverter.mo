within EVLibrary.Components.Converters;

model ElectricConverter
  import SI = Modelica.SIunits;
  extends Interfaces.Base;
  parameter SI.ElectricalTorqueConstant k=0.4 "Transformation coefficient";
  Modelica.Electrical.Analog.Basic.EMF eMF(k=k)
    annotation (Placement(transformation(extent={{50,-10},{70,10}})));
  Modelica.Mechanics.Rotational.Sources.Torque torque1 annotation(
    Placement(visible = true, transformation(origin = {28, -32}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput u annotation(
    Placement(visible = true, transformation(origin = {-30, -32}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-30, -32}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
equation
  torque1.tau=u;
  connect(torque1.flange, eMF.flange) annotation(
    Line(points = {{38, -32}, {80, -32}, {80, 0}, {70, 0}, {70, 0}}));
  connect(u, torque1.tau) annotation(
    Line(points = {{-30, -32}, {16, -32}}, color = {0, 0, 127}));
  connect(eMF.p, pin_p) annotation(
    Line(points = {{60, 10}, {60, 10}, {60, 100}, {60, 100}}, color = {0, 0, 255}));
  connect(pin_n, eMF.n) annotation(
    Line(points = {{-60, 100}, {-60, 100}, {-60, -10}, {60, -10}, {60, -10}}, color = {0, 0, 255}));


end ElectricConverter;
