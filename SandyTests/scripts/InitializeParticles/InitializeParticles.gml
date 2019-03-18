var part = 0;

//PARTICLES
global.ptstep=part_type_create();
part_type_sprite(global.ptstep,spr_footstep,1,0,0);
part_type_size(global.ptstep,1,1,-0.002,0);
part_type_scale(global.ptstep,0.15,0.15);
part_type_orientation(global.ptstep,0,0,0,0,0);
part_type_direction(global.ptstep,0,0,0,0);
part_type_speed(global.ptstep,0,0,0,0);
part_type_gravity(global.ptstep,0,0);
part_type_color3(global.ptstep,0,0,0);
part_type_alpha3(global.ptstep,0.12,0.06,0);
part_type_blend(global.ptstep,0);
part_type_life(global.ptstep,280,300);


global.ptSnow=part_type_create();
part_type_sprite(global.ptSnow,spr_cloud,0,0,1);
part_type_size(global.ptSnow,0.5,1,0,0);
part_type_scale(global.ptSnow,2,4);
part_type_orientation(global.ptSnow,305,315,0.02,0,0);
part_type_direction(global.ptSnow,295,335,0.05,0);
part_type_speed(global.ptSnow,3,8,0,0);
part_type_gravity(global.ptSnow,0,0);
part_type_color3(global.ptSnow,c_white,c_white,c_white);
part_type_alpha3(global.ptSnow,0.06,0.03,0);
part_type_blend(global.ptSnow,0);
part_type_life(global.ptSnow,300,300);

global.ptWindS=part_type_create();
part_type_sprite(global.ptWindS,spr_cloud,0,0,1);
part_type_size(global.ptWindS,0.5,1,0,0);
part_type_scale(global.ptWindS,2,4);
part_type_orientation(global.ptWindS,305,315,0.02,0,0);
part_type_direction(global.ptWindS,295,335,0.05,0);
part_type_speed(global.ptWindS,2,4,0,0);
part_type_gravity(global.ptWindS,0,0);
part_type_color3(global.ptWindS,10864100,10864100,10864100);
part_type_alpha3(global.ptWindS,0.036, 0.018, 0);
part_type_blend(global.ptWindS,0);
part_type_life(global.ptWindS,1000,1000);

global.ptWindS2=part_type_create();
part_type_sprite(global.ptWindS2,spr_cloud,0,0,1);
part_type_size(global.ptWindS2,0.5,1,0,0);
part_type_scale(global.ptWindS2,2,4);
part_type_orientation(global.ptWindS2,305,315,0.02,0,0);
part_type_direction(global.ptWindS2,295,335,0.05,0);
part_type_speed(global.ptWindS2,2,4,0,0);
part_type_gravity(global.ptWindS2,0,0);
part_type_color3(global.ptWindS2,16777215,16777215,16777215);
part_type_alpha3(global.ptWindS2,0.03, 0.018, 0);
part_type_blend(global.ptWindS2,0);
part_type_life(global.ptWindS2,1000,1000);

global.ptFireStrike = part_type_create();
part_type_shape(global.ptFireStrike,pt_shape_explosion);
part_type_size(global.ptFireStrike,0.20,1,-0.01,0);
part_type_scale(global.ptFireStrike,0.5,0.5);
part_type_color3(global.ptFireStrike,15138815,37887,64);
part_type_alpha3(global.ptFireStrike,1,0.80,0);
part_type_speed(global.ptFireStrike,0.50,1,-0.01,0);
part_type_direction(global.ptFireStrike,0,359,0,0);
part_type_gravity(global.ptFireStrike,0,270);
part_type_orientation(global.ptFireStrike,0,0,0,0,1);
part_type_blend(global.ptFireStrike,1);
part_type_life(global.ptFireStrike,15,90);

global.ptFireStrikeExplosion = part_type_create();
part_type_shape(global.ptFireStrikeExplosion,pt_shape_explosion);
part_type_size(global.ptFireStrikeExplosion,0.20,1,-0.01,0);
part_type_scale(global.ptFireStrikeExplosion,1,1);
part_type_color3(global.ptFireStrikeExplosion,15138815,37887,64);
part_type_alpha3(global.ptFireStrikeExplosion,1,0.80,0);
part_type_speed(global.ptFireStrikeExplosion,0.50,1,-0.01,0);
part_type_direction(global.ptFireStrikeExplosion,0,359,0,0);
part_type_gravity(global.ptFireStrikeExplosion,0,270);
part_type_orientation(global.ptFireStrikeExplosion,0,0,0,0,1);
part_type_blend(global.ptFireStrikeExplosion,1);
part_type_life(global.ptFireStrikeExplosion,15,90);

global.ptNosferatu = part_type_create();
part_type_shape(global.ptNosferatu,pt_shape_explosion);
part_type_size(global.ptNosferatu,0.20,1,-0.01,0);
part_type_scale(global.ptNosferatu,0.5,0.5);
part_type_color3(global.ptNosferatu,16733118,11275665,8388688);
part_type_alpha3(global.ptNosferatu,1,0.80,0);
part_type_speed(global.ptNosferatu,0.50,1,-0.01,0);
part_type_direction(global.ptNosferatu,0,359,0,0);
part_type_gravity(global.ptNosferatu,0,270);
part_type_orientation(global.ptNosferatu,0,0,0,0,1);
part_type_blend(global.ptNosferatu,1);
part_type_life(global.ptNosferatu,15,90);

global.ptNosferatuExplosion = part_type_create();
part_type_shape(global.ptNosferatuExplosion,pt_shape_explosion);
part_type_size(global.ptNosferatuExplosion,0.20,1,-0.01,0);
part_type_scale(global.ptNosferatuExplosion,1,1);
part_type_color3(global.ptNosferatuExplosion,16733118,11275665,8388688);
part_type_alpha3(global.ptNosferatuExplosion,1,0.80,0);
part_type_speed(global.ptNosferatuExplosion,0.50,1,-0.01,0);
part_type_direction(global.ptNosferatuExplosion,0,359,0,0);
part_type_gravity(global.ptNosferatuExplosion,0,270);
part_type_orientation(global.ptNosferatuExplosion,0,0,0,0,1);
part_type_blend(global.ptNosferatuExplosion,1);
part_type_life(global.ptNosferatuExplosion,15,90);


global.ptApocalypse = part_type_create();
part_type_sprite(global.ptApocalypse,spr_sol,1,1,0);
part_type_size(global.ptApocalypse,1,1,0,0);
part_type_scale(global.ptApocalypse,1,1);
part_type_color3(global.ptApocalypse,16743903,8388736,4194368);
part_type_alpha3(global.ptApocalypse,1,0.80,0);
part_type_speed(global.ptApocalypse,6,8,-0.01,0);
part_type_direction(global.ptApocalypse,0,359,1,1);
part_type_gravity(global.ptApocalypse,0,270);
part_type_orientation(global.ptApocalypse,0,0,0,0,1);
part_type_blend(global.ptApocalypse,1);
part_type_life(global.ptApocalypse,20,40);


global.ptSparkle = part_type_create();
part_type_shape(global.ptSparkle,pt_shape_spark);
part_type_size(global.ptSparkle,0.05,0.30,0,0);
part_type_scale(global.ptSparkle,1,1);
part_type_color3(global.ptSparkle,7463679,4636415,46079);
part_type_alpha3(global.ptSparkle,0,1,0);
part_type_speed(global.ptSparkle,1,1.5,0,0);
part_type_direction(global.ptSparkle,90,90,0,0);
part_type_orientation(global.ptSparkle,0,0,0,0,1);
part_type_blend(global.ptSparkle,1);
part_type_life(global.ptSparkle,15,20);

global.ptGoetia = part_type_create();
part_type_sprite(global.ptGoetia,spr_goetia,0,0,0);
part_type_size(global.ptGoetia,1,1,0,0);
part_type_scale(global.ptGoetia,1,1);
part_type_color3(global.ptGoetia,10964991,8388736,8388736);
part_type_alpha3(global.ptGoetia,1,1,0);
part_type_speed(global.ptGoetia,1,1,0,0);
part_type_direction(global.ptGoetia,0,359,0,0);
part_type_gravity(global.ptGoetia,0,270);
part_type_orientation(global.ptGoetia,0,0,0,0,1);
part_type_blend(global.ptGoetia,1);
part_type_life(global.ptGoetia,60,60);

global.ptWind = part_type_create();
part = global.ptWind;
part_type_shape(part,pt_shape_explosion);
part_type_size(part,0.20,1,-0.01,0);
part_type_scale(part,0.1,1);
part_type_color3(part,13303754,13303754,14680031);
part_type_alpha3(part,1,0.80,0);
part_type_speed(part,0.50,1,-0.01,0);
part_type_direction(part,0,359,0,0);
part_type_gravity(part,0,270);
part_type_orientation(part,0,0,0,0,1);
part_type_blend(part,1);
part_type_life(part,15,90);

global.ptWindExplosion = part_type_create();
part = global.ptWindExplosion;
part_type_shape(part,pt_shape_explosion);
part_type_size(part,0.20,1,1,0);
part_type_scale(part,0.2,2);
part_type_color3(part,13303754,13303754,14680031);
part_type_alpha3(part,1,0.80,0);
part_type_speed(part,0.50,1,-0.01,0);
part_type_direction(part,0,359,0,0);
part_type_gravity(part,0,270);
part_type_orientation(part,0,0,0,0,1);
part_type_blend(part,1);
part_type_life(part,15,90);

global.ptThunder = part_type_create();
part_type_sprite(global.ptThunder,spr_sol,0,0,0);
part_type_size(global.ptThunder,0.20,1,-0.01,0);
part_type_scale(global.ptThunder,1,0.1);
part_type_color3(global.ptThunder,16733118,11275665,8388688);
part_type_alpha3(global.ptThunder,1,0.80,0);
part_type_speed(global.ptThunder,0.50,1,-0.01,0);
part_type_direction(global.ptThunder,0,359,0,0);
part_type_gravity(global.ptThunder,0,270);
part_type_orientation(global.ptThunder,0,0,0,0,1);
part_type_blend(global.ptThunder,1);
part_type_life(global.ptThunder,15,90);

global.ptThunderExplosion = part_type_create();
part_type_sprite(global.ptThunderExplosion,spr_sol,0,0,0);
part_type_size(global.ptThunderExplosion,0.20,1,-0.01,0);
part_type_scale(global.ptThunderExplosion,0.2,2);
part_type_color3(global.ptThunderExplosion,16733118,11275665,8388688);
part_type_alpha3(global.ptThunderExplosion,1,0.80,0);
part_type_speed(global.ptThunderExplosion,0.50,1,-0.01,0);
part_type_direction(global.ptThunderExplosion,0,359,0,0);
part_type_gravity(global.ptThunderExplosion,0,270);
part_type_orientation(global.ptThunderExplosion,0,0,0,0,1);
part_type_blend(global.ptThunderExplosion,1);
part_type_life(global.ptThunderExplosion,15,90);

//particle info
part = 0;
global.PART[0, 0] = global.ptFireStrike;
global.PART[0, 1] = global.ptFireStrikeExplosion;
global.PART[0, 2] = sfx_fireMissile;
global.PART[0, 3] = sfx_fireExplosion;

part = 1;
global.PART[part, 0] = global.ptNosferatu;
global.PART[part, 1] = global.ptNosferatuExplosion;
global.PART[part, 2] = sfx_nosferatuMissile;
global.PART[part, 3] = sfx_nosferatuExplosion;

part = 2;
global.PART[part, 0] = global.ptApocalypse;
global.PART[part, 1] = -1;
global.PART[part, 2] = sfx_apocalypse;
global.PART[part, 3] = -1;

part = 3;
global.PART[part, 0] = global.ptGoetia;
global.PART[part, 1] = -1;
global.PART[part, 2] = sfx_apocalypse;
global.PART[part, 3] = -1;

part = 4;
global.PART[part, 0] = global.ptWind;
global.PART[part, 1] = global.ptWindExplosion;
global.PART[part, 2] = sfx_thunderP;
global.PART[part, 3] = sfx_thunderExplosion;

part = 5;
global.PART[part, 0] = global.ptThunder;
global.PART[part, 1] = global.ptThunderExplosion;
global.PART[part, 2] = sfx_wind;
global.PART[part, 3] = sfx_windExplosion;



part = 0;
global.FX[part, 0] = spr_damage1;
global.FX[part, 1] = 1; //size

part = 1;
global.FX[part, 0] = spr_damage2;
global.FX[part, 1] = 1; //size

part = 2;
global.FX[part, 0] = spr_damage3;
global.FX[part, 1] = 1; //size

part = 3;
global.FX[part, 0] = spr_damage4;
global.FX[part, 1] = 1; //size

part = 4;
global.FX[part, 0] = spr_damage5;
global.FX[part, 1] = 1; //size

part = 5;
global.FX[part, 0] = spr_fire;
global.FX[part, 1] = 1; //size

part = 6;
global.FX[part, 0] = spr_heal;
global.FX[part, 1] = 1; //size

part = 7;
global.FX[part, 0] = spr_heal2;
global.FX[part, 1] = 1; //size

part = 8;
global.FX[part, 0] = spr_electricshock;
global.FX[part, 1] = 1; //size

part = 9;
global.FX[part, 0] = spr_iceSpell;
global.FX[part, 1] = 1; //size




part = 0;
global.TRA[part, 0] = spr_kitsune;

part = 1;
global.TRA[part, 0] = spr_ninetails;

part = 2;
global.TRA[part, 0] = spr_dragon;