within EVLibrary.Profiles;

package DriveTests
  model Quart2
    Modelica.Blocks.Sources.CombiTimeTable combiTimeTable(table = [0, 0; 10, 147; 120, 147]) annotation(
      Placement(visible = true, transformation(origin = {-34, 48}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealOutput y annotation(
      Placement(visible = true, transformation(origin = {10, 48}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {10, 48}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
    connect(y, combiTimeTable.y[1]) annotation(
      Line(points = {{10, 48}, {-24, 48}, {-24, 48}, {-22, 48}}, color = {0, 0, 127}));
  end Quart2;











  model Quart3
    Modelica.Blocks.Sources.CombiTimeTable combiTimeTable(table = [0, 0; 13, 147; 120, 147]) annotation(
      Placement(visible = true, transformation(origin = {-34, 48}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealOutput y annotation(
      Placement(visible = true, transformation(origin = {10, 48}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {10, 48}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
    connect(y, combiTimeTable.y[1]) annotation(
      Line(points = {{10, 48}, {-24, 48}, {-24, 48}, {-22, 48}}, color = {0, 0, 127}));
  end Quart3;











  model Quart4
    Modelica.Blocks.Sources.CombiTimeTable combiTimeTable(table = [0, 0; 16, 147; 120, 147]) annotation(
      Placement(visible = true, transformation(origin = {-34, 48}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealOutput y annotation(
      Placement(visible = true, transformation(origin = {10, 48}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {10, 48}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
    connect(y, combiTimeTable.y[1]) annotation(
      Line(points = {{10, 48}, {-24, 48}, {-24, 48}, {-22, 48}}, color = {0, 0, 127}));
  end Quart4;



end DriveTests;
