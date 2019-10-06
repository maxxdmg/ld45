switch (state) {
	case CAPTAINSTATE.GENERATE_SQUAD:
		captainstateGenerateSquad();
		break;
	case CAPTAINSTATE.GENERATE_PATH:
		captainstateFree(grabRadius);
		captainstateGeneratePath();
		break;
	case CAPTAINSTATE.LEAD:
		captainstateFree(grabRadius);
		image_speed = 0;
		captainstateLead();
		break;
	case CAPTAINSTATE.ATTACK:
		captainstateFree(grabRadius);
		captainstateAttack();
		break;
	case CAPTAINSTATE.GRABBED:
		shooterstateGrabbed();
		break;
}