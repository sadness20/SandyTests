/// @description Insert description here
// You can write your code in this editor
audio_play_sound(sfx_shatter,0,0);
var ii=instance_create_depth(x+irandom_range(-24,24),y+irandom_range(-24,24), 0, obj_shard);
ii.size=0.5;
ii=instance_create_depth(x+irandom_range(-24,24),y+irandom_range(-24,24), 0, obj_shard);
ii.size=0.5;
ii=instance_create_depth(x+irandom_range(-24,24),y+irandom_range(-24,24), 0, obj_shard);
ii.size=0.5;
ii=instance_create_depth(x+irandom_range(-24,24),y+irandom_range(-24,24), 0, obj_shard);
ii.size=0.5;
instance_destroy();