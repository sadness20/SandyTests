/// @description Insert description here
// You can write your code in this editor
/// @description Insert description here
// You can write your code in this editor


if(global.debug == false && gamestate != "menu" && gamestate != "unitshop")
{
	audio_stop_all();
	game_restart();
}
