attachMovie("Info " + _global.selectedGloople,"InfoProfile",1);
with(InfoProfile)
{
   _x -= 170;
   _y -= 150;
}
headerTextFormat = new TextFormat();
headerTextFormat.font = "Cooper Black";
headerTextFormat.color = 39168;
headerTextFormat.size = 24;
headerTextFormat.align = "center";
this.createTextField("headerText",3,-80,-175,200,50);
headerText.embedFonts = true;
headerText.wordWrap = true;
headerText.selectable = false;
headerText.text = _global.selectedGloople;
headerText.setTextFormat(headerTextFormat);
_parent.detailOpen = true;
stop();
