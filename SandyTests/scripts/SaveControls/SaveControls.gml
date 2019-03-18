var buf;
buf = buffer_create(2048, buffer_grow, 1);
	
buffer_write(buf, buffer_u16, global.startKey);
buffer_write(buf, buffer_u16, global.selectKey);

buffer_write(buf, buffer_u16, global.upKey);
buffer_write(buf, buffer_u16, global.downKey);
buffer_write(buf, buffer_u16, global.rightKey);
buffer_write(buf, buffer_u16, global.leftKey);

buffer_write(buf, buffer_u16, global.Akey);
buffer_write(buf, buffer_u16, global.Bkey);
buffer_write(buf, buffer_u16, global.Xkey);
buffer_write(buf, buffer_u16, global.Ykey);

buffer_write(buf, buffer_u16, global.Lshoulder);
buffer_write(buf, buffer_u16, global.Rshoulder);
buffer_write(buf, buffer_u16, global.ctrlKey);

buffer_save(buf, working_directory + "controls.sandy");
buffer_delete(buf);

