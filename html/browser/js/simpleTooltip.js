ToolTip.offsetX=20; //СЃРјРµС‰РµРЅРёСЏ РїРѕРґСЃРєР°Р·РєРё РѕС‚ РєСѓСЂСЃРѕСЂР°
ToolTip.offsetY=10; //
function ToolTip(obj, text) {
  if(!obj||obj.nodeType!=1) throw "Illigal argument exception"; //РѕР±СЊРµРєС‚ Рє РєРѕРјСѓ РїСЂРёРІСЏР·С‹РІР°РµРј РїРѕРґСЃРєР°Р·РєСѓ
  //-- Р Р°Р·РјРµС‚РєР° РїРѕРґСЃРєР°Р·РєРё ---
  var tip=document.createElement("DIV");
  tip.className="tool_tip";
  tip.innerHTML=text;
  tip.style.left =" 0px";
  tip.style.top = "0px";
  document.body.appendChild(tip);
  //-- СЃРѕР±С‹С‚РёСЏ --
  obj.onmouseout=function (ev) {
      tip.style.visibility="hidden";
  };
  obj.onmousemove=function(ev) { //РµСЃР»Рё РЅРµ РЅСѓР¶РЅРѕ С‡С‚Рѕ Р±С‹ РїРѕРґСЃРєР°СЃР·РєР° Р±РµРіР°Р»Р°, С‚Рѕ onmouseover
      tip.style.visibility="visible";
      if(window.event) ev=window.event;
if(tip.offsetWidth+ev.clientX+10>document.body.clientWidth) //РµСЃР»Рё РїРѕРґСЃРєР°Р·РєР° РІС‹С…РѕРґРёС‚ Р·Р° РІРёРґРёРјСѓСЋ 
        ToolTip.offsetX=-tip.offsetWidth; //РѕР±Р»Р°С‚СЊ, С‚Рѕ РїРѕРІРѕСЂР°С‡РёРІР°РµРј РµС‘
else
        ToolTip.offsetX=20;
if(tip.offsetHeight+ev.clientY+15>document.body.clientHeight)// С‚РѕР¶Рµ СЃР°РјРѕРµ, РЅРѕ РїРѕ РІРµСЂС‚РёРєР°Р»Рё
       ToolTip.offsetY=-tip.offsetHeight;
else
      ToolTip.offsetY=10;
      tip.style.left=ev.clientX + document.documentElement.scrollLeft + ToolTip.offsetX + "px";
      tip.style.top=ev.clientY + document.documentElement.scrollTop + ToolTip.offsetY + "px";
  };
}
//РїРµСЂРµР±РµСЂРµРј Р·Р°РґР°РЅРЅС‹Рµ СЌР»РµРјРµРЅС‚С‹, РґР°РґРёРј РїРѕРґРєР°Р·РєСѓ С‚РµРј Сѓ РєРѕРіРѕ РµСЃС‚СЊ Р°С‚С‚СЂРёР±СѓС‚ tooltip
//Р’ Р°СЂРіСѓРјРµРЅС‚Р°С… РїРµСЂРµРґР°РµРј РёРјРµРЅР° СЂР°СЃСЃРјР°С‚СЂРёРІР°РµРјС‹С… С‚РµРіРѕРІ, * РІСЃРµ С‚РµРіРё
function initToolTips() {
//   return;
    var tags, tooltext;
    for(var i=0; i<arguments.length; i++) {
       tags=document.body.getElementsByTagName(arguments[i]);
       for(var j=0; j<tags.length; j++)
            if((tooltext=tags[j].getAttribute("data-tooltip"))) ToolTip(tags[j], tooltext);
   }
}