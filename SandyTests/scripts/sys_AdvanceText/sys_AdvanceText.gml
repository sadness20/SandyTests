var currentActor = global.step[global.currentStep, 0];

sys_RunEvents();
global.currentStep++;

if(currentActor != global.step[global.currentStep, 0])global.backgroundcharPos = 0;
global.textY = 1;
