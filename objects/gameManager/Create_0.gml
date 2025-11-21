global.get_origin_pos = function(_inst) 
{
    return 
    {
        x: _inst.x - sprite_get_xoffset(_inst.sprite_index) * _inst.image_xscale,
        y: _inst.y - sprite_get_yoffset(_inst.sprite_index) * _inst.image_yscale
    };
};


global.enemy_data = [];