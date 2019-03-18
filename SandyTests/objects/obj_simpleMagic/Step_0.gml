/// @description Insert description here
// You can write your code in this editor
x += hspd;
y += vspd;

if(particle != -1)
{
	part_particles_create(global.psmain,x,y,global.PART[particle, 0],2);
}
life++;