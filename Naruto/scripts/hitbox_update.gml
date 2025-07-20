

switch (attack) {
	case AT_EXTRA_1:
		//clone hurtbox 'projectiles'.
		//do a place-meeting check for opponent projectiles.
		//this check is -not- perfectly accurate, and compromises for speed by checking for only one collision. 
		//it is only needed to check for hitboxes that don't normally break projectiles.
		//for an accurate check, use 'instance_place_array()' and check every instance that comes up in the array.
		
		if (instance_number(pHitBox) <= 1) break;
		var detect_hbox = instance_place(x, y, pHitBox);
		if (!instance_exists(detect_hbox)) break;
		
		//check if this hitbox is able to do damage. if it can, destroy this projectile.
		var damaging_hbox;
		with (detect_hbox) {
			//print("hbox detected - damage=" + string(damage) + " kb=" +string(kb_value) + " priority=" + string(hit_priority));
			damaging_hbox = (
				//don't hit your own clones
				player != other.player 
				//make sure the hitbox can actually deal damage or knockback
				&& (damage >= 1 || kb_value != 0) && hit_priority > 0
				//ignore teammate attacks unless team attack is on
				&& (get_match_setting(SET_TEAMATTACK) || get_player_team(player) != get_player_team(other.player) ) 
			);
		}
		
		if (damaging_hbox) destroyed = true;
		
	break;
		
		
	case AT_DAIR:
	case AT_DSPECIAL_AIR:
	case 47:
		//kunai. destroy it when it hits a floor or wall.
		if (vsp == 0 || hsp == 0) destroyed = true;
	break;
	
        case AT_NSPECIAL:
                if (hit_priority == 1) break;
                break;
}