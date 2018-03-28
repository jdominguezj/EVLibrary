within EVLibrary.Interfaces.Connectors;

connector PositivePin
  Modelica.SIunits.Voltage v "Electric Potential";
  flow Modelica.SIunits.Current i "Current Flow";
  annotation (defaultComponentName="pin_p",
    Documentation(info="<html>
<p>Connectors PositivePin and NegativePin are nearly identical. The only difference is that the icons are different in order to identify more easily the pins of a component. Usually, connector PositivePin is used for the positive and connector NegativePin for the negative pin of an electrical component.</p>
</html>",               revisions="<html>
<ul>
<li><i> 1998   </i>
     by Christoph Clauss<br> initially implemented<br>
     </li>
</ul>
</html>"),
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
          textString="%name")}));
end PositivePin;