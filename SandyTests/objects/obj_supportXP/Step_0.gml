/// @description Insert description here
// You can write your code in this editor

powerMult = size;

if(alpha < 1 && step == 0)
{
    alpha += 1 / 5;
    size += 1 / 5;
}
if(alpha >= 1 && step == 0)step = 1;
if(step >= 1 && step < 25)
{
    step ++;
    part_particles_create(global.psmain, x + irandom_range(-8, 8), y + irandom_range(-2, 10),global.ptSparkle, 1);
}
if(step >= 25)
{
    alpha -= 1 / 5;
    size += 1 / 5;
}
if(step >= 25 && alpha < 0)instance_destroy();