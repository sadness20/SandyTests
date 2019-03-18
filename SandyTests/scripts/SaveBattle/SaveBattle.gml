var name = argument[0];

var buf;
buf = buffer_create(65536, buffer_grow, 1);

SaveInfo(buf);

buffer_write(buf, buffer_u8, global.currentMap);
buffer_write(buf, buffer_u8, global.currentRegion);
buffer_write(buf, buffer_u8, global.currentStage);

buffer_save(buf, working_directory + "\saves\\" + string(name) + ".battle1");
buffer_delete(buf);




buf = buffer_create(2048, buffer_grow, 1);

buffer_write(buf, buffer_u32, global.seconds);
buffer_write(buf, buffer_u8, global.lastStage);
buffer_write(buf, buffer_u8, global.gameType);

buffer_save(buf, working_directory + "\saves\\" + string(name) + ".combath");
buffer_delete(buf);
