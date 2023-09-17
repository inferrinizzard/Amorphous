onClipEvent(load){
   mySparks = int(Math.random() * 4) + 5;
   x = 1;
   while(x <= mySparks)
   {
      sparkName = _parent._name + "Spark" + x;
      _root.attachMovie("Spark",sparkName,_global.capDepth++);
      with(eval("_root." + sparkName))
      {
         _x = this._parent._x;
         _y = this._parent._y;
         _rotation = this._parent._rotation + int(Math.random() * 100) - 50;
      }
      sparkColor = new Color(eval("_root." + sparkName));
      sparkColor.setRGB(16436339);
      x++;
   }
}
