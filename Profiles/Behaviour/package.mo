within EVLibrary.Profiles;

package Behaviour




  model Lubridate
      //
      Modelica.Blocks.Continuous.Derivative derivative1(T = 0.01) annotation(
        Placement(visible = true, transformation(origin = {-20, 16}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Blocks.Logical.Less less1 annotation(
        Placement(visible = true, transformation(origin = {20, -22}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Blocks.Logical.Not not1 annotation(
        Placement(visible = true, transformation(origin = {58, -62}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Blocks.Sources.Constant const(k = -0.01) annotation(
        Placement(visible = true, transformation(origin = {-22, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Blocks.Interfaces.RealOutput Vel annotation(
        Placement(visible = true, transformation(origin = {88, 64}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Blocks.Interfaces.RealOutput Accel annotation(
        Placement(visible = true, transformation(origin = {88, 16}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Blocks.Interfaces.BooleanOutput BoolAcce annotation(
        Placement(visible = true, transformation(origin = {86, -62}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-40, 110}, extent = {{10, -10}, {-10, 10}}, rotation = -90)));
      Modelica.Blocks.Math.Product product1 annotation(
        Placement(visible = true, transformation(origin = {-48, 64}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Blocks.Sources.Constant toms(k = 0.2777777778) annotation(
        Placement(visible = true, transformation(origin = {-82, 36}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Blocks.Interfaces.BooleanOutput BoolDec annotation(
        Placement(visible = true, transformation(origin = {88, -22}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-80, 110}, extent = {{10, -10}, {-10, 10}}, rotation = -90)));
  DriveTests.Lubridat lubridat1 annotation(
      Placement(visible = true, transformation(origin = {-80, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    equation
    connect(lubridat1.y, product1.u1) annotation(
      Line(points = {{-78, 74}, {-60, 74}, {-60, 70}, {-60, 70}}, color = {0, 0, 127}));
    connect(less1.y, BoolDec) annotation(
      Line(points = {{32, -22}, {78, -22}, {78, -22}, {88, -22}}, color = {255, 0, 255}));
    connect(product1.y, derivative1.u) annotation(
      Line(points = {{-36, 64}, {-34, 64}, {-34, 16}, {-32, 16}}, color = {0, 0, 127}));
    connect(less1.y, not1.u) annotation(
      Line(points = {{31, -22}, {33, -22}, {33, -22}, {37, -22}, {37, -62}, {47, -62}, {47, -62}, {45, -62}, {45, -62}}, color = {255, 0, 255}));
    connect(not1.y, BoolAcce) annotation(
      Line(points = {{67, -62}, {83, -62}}, color = {255, 0, 255}));
    connect(derivative1.y, less1.u1) annotation(
      Line(points = {{-9, 16}, {-3, 16}, {-3, -22}, {9, -22}, {9, -22}, {7, -22}, {7, -22}}, color = {0, 0, 127}));
    connect(const.y, less1.u2) annotation(
      Line(points = {{-11, -30}, {7, -30}, {7, -30}, {7, -30}}, color = {0, 0, 127}));
    connect(derivative1.y, Accel) annotation(
      Line(points = {{-11, 16}, {87, 16}}, color = {0, 0, 127}));
    connect(product1.y, Vel) annotation(
      Line(points = {{-36, 64}, {82, 64}, {82, 66}, {88, 66}}, color = {0, 0, 127}));
    connect(toms.y, product1.u2) annotation(
      Line(points = {{-70, 36}, {-68, 36}, {-68, 58}, {-60, 58}, {-60, 58}}, color = {0, 0, 127}));
//
    annotation(
        Icon(graphics = {Rectangle(extent = {{-100, 100}, {100, -100}}), Text(origin = {-8, 6}, extent = {{-30, 22}, {30, -22}}, textString = "LUBRIDATE")}, coordinateSystem(initialScale = 0.1)));
    end Lubridate;
  

end Behaviour;
