/// @description Insert description here
// You can write your code in this editor

neighbors = ds_list_create();

occupant = noone;
passable = true;

gridX = 0;
grixY = 0;

type = 0;
cost = 1;

parent = noone;
parent2 = noone;
G = 0;
G2 = 0;
rawG = 0;
moveNode = false;

color = 0;

cellAttack = ds_list_create();
cellHeal = ds_list_create();
willbeoccupied = false;
marked = 0;
marked2 = 0;
marked3 = 0;
marked4 = 0;
spawn = noone;

level = 0;

objectLink = noone;