within EVLibrary.Interfaces.Connectors;

connector NegativePin
Modelica.SIunits.Voltage v "Electric Potential";
   flow Modelica.SIunits.Current i "Current Flow";
   annotation (defaultComponentName="pin_n",
    Documentation(info="<html>
<p>Connectors PositivePin and NegativePin are nearly identical. The only difference is that the icons are different in order to identify more easily the pins of a component. Usually, connector PositivePin is used for the positive and connector NegativePin for the negative pin of an electrical component.</p>
</html>", revisions="<html>
<dl>
<dt><i>1998</i></dt>
<dd>by Christoph Clauss initially implemented
</dd>
</dl>
</html>"),
    Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,
            100}}), graphics={Rectangle(
          extent={{-100,100},{100,-100}},
          lineColor={0,0,255},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid)}),
    Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
            100,100}}), graphics={Rectangle(
          extent={{-40,40},{40,-40}},
          lineColor={0,0,255},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid), Text(
          extent={{-40,110},{160,50}},
          textString="%name",
          lineColor={0,0,255})}));

end NegativePin;