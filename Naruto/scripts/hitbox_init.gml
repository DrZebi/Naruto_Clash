//hitbox_init.gml

// init Rasengan projectile
if (attack != AT_NSPECIAL || hit_priority == 1) exit;

// store charge on creation then clear player charge
proj_nspecial_charge = player_id.naruto_nspecial_charge;
player_id.naruto_nspecial_charge = 0;

exit;


