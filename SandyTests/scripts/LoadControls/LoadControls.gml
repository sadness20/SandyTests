//var name = argument[0];
var file = working_directory + "controls.sandy";
//show_message(string(file));
if(file_exists(file))
{
	var buf;
	buf = buffer_load(file);
	
	global.startKey = buffer_read(buf, buffer_u16);
	global.selectKey = buffer_read(buf, buffer_u16);
	
	global.upKey = buffer_read(buf, buffer_u16);
	global.downKey = buffer_read(buf, buffer_u16);
	global.rightKey = buffer_read(buf, buffer_u16);
	global.leftKey = buffer_read(buf, buffer_u16);
	
	global.Akey = buffer_read(buf, buffer_u16);
	global.Bkey = buffer_read(buf, buffer_u16);
	global.Xkey = buffer_read(buf, buffer_u16);
	global.Ykey = buffer_read(buf, buffer_u16);
	
	global.Lshoulder = buffer_read(buf, buffer_u16);
	global.Rshoulder = buffer_read(buf, buffer_u16);
	global.ctrlKey = buffer_read(buf, buffer_u16);
	
	buffer_delete(buf);
}
else
{
	SaveControls();
}