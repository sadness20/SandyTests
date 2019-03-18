var num = argument[0];

var minutes = (num div 60) mod 60;
var mstring = string(minutes);
if(minutes < 10)mstring = "0" + string(minutes);
var hours = num div 3600;
var hstring = string(hours);
if(hours < 10)hstring = "0" + string(hours);

var str = string(hstring)+":"+string(mstring);

return str;