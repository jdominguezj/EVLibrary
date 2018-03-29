within EVLibrary.Interfaces.Connectors;

connector Pin
  Modelica.SIunits.Voltage v "Electric Potential";
  flow Modelica.SIunits.Current i "Current Flow";
   annotation (defaultComponentName="pin",
    Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,
            100}}), graphics={Rectangle(
          extent={{-100,100},{100,-100}},
          lineColor={0,0,255},
          fillColor={0,0,255},
          fillPattern=FillPattern.Solid)}),
    Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
            100,100}}), graphics={Rectangle(
          extent={{-40,40},{40,-40}},
          lineColor={0,0,255},
          fillColor={0,0,255},
          fillPattern=FillPattern.Solid), Text(
          extent={{-160,110},{40,50}},
          lineColor={0,0,255},
          textString="%name")}),
    Documentation(revisions="<html>
<ul>
<li><i> 1998   </i>
     by Christoph Clauss<br> initially implemented<br>
     </li>
</ul>
</html>", info="<html>
<p>Pin is the basic electric connector. It includes the voltage which consists between the pin and the ground node. The ground node is the node of (any) ground device (Modelica.Electrical.Basic.Ground). Furthermore, the pin includes the current, which is considered to be <b>positive</b> if it is flowing at the pin <b>into the device</b>.</p>
</html>"));

end Pin;