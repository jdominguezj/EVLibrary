within EVLibrary.Chassis;

record Bolt
//https://cleantechnica.com/2016/02/14/the-chevy-bolt-a-deeper-look/
//http://www.roperld.com/science/chevybolt.htm#packages
//thecartech.com:car permormance formulas

  extends Basic(Mv = 1616, Je = 0.125, Jw = 0.125, Te = 360, Rw = 0.33, cda = 0.6758);
  annotation(
    Icon(graphics = {Bitmap(origin = {-7, 12}, extent = {{-77, 40}, {97, -68}}, imageSource = "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")}, coordinateSystem(initialScale = 0.1)));
end Bolt;
