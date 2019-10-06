switch (state) {
	case SHOOTERSTATE.PATROL:
		shooterstateFree(grabRadius);
		shooterstatePatrol();
		break;
	case SHOOTERSTATE.ATTACK:
		shooterstateFree(grabRadius);
		shooterstateAttack();
		break;
	case SHOOTERSTATE.GRABBED:
		shooterstateGrabbed();
		break;
	case SHOOTERSTATE.FLEE:
		shooterstateFree(grabRadius);
		shooterstateFlee(3);
		break;
	case SHOOTERSTATE.TIRED:
		shooterstateFree(grabRadius);
		shooterstateTired();
		break;
}