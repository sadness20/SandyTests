//  Utility function to pass (vec4) RGBA values to shaders
//  
//  shader_set_uniform_rgba(r,g,b,a)
//      r,g,b   given in [0,255] range
//      alpha   given in [0,1] range
{
    shader_set_uniform_f(argument0, argument1/255, argument2/255, argument3/255, argument4);
}