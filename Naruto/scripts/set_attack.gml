//set_attack.gml

//use the index of this attack specific to this clone. this fixes bugs with overlapping attacks.
user_event(7);

if (is_master_player) {
    
    //special taunt
    if (attack == AT_TAUNT && (down_down || down_stick_down)) {
        attack = AT_TAUNT_2;
    }
    

switch(attack) {
    // ... autres cases existants ...
    
    case AT_NSPECIAL:
        // Réinitialiser les variables de beam clash au début de l'attaque
        naruto_rasengan_juice = 0;
        naruto_rasengan_length = 0;
        naruto_has_updated_beam_kb = false;
        naruto_beam_clash_buddy = noone;
        naruto_beam_clash_timer = 0;
        naruto_clash_started = false;
        naruto_dash_collision = false;
        
        // Marquer qu'on peut potentiellement faire un beam
        has_goku_beam = false; // Sera activé plus tard dans attack_update
        doing_goku_beam = false;
        beam_newest_hbox = noone;
        
        // Réinitialiser l'angle du rasengan (droit devant)
        naruto_rasengan_angle = 0;
        
        break;
        
    // ... autres cases existants ...
}
}
else {
    //for some reason clone attacks don't reset has_hit variables by themselves, so do that here.
    has_hit = false;
    has_hit_player = false;
    was_parried = false;
}