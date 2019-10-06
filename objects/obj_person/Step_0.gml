switch (state) {
	case PERSONSTATE.WANDER_TRIANGLE:
		personstateFree(grabRadius);
		personstateWanderTriangle();
		break;
	case PERSONSTATE.WANDER_SQUARE:
		personstateFree(grabRadius);
		personstateWanderSquare();
		break;
	case PERSONSTATE.FLEE:
		personstateFree(grabRadius);
		personstateFlee(grabRadius * 100);
		break;
	case PERSONSTATE.TIRED:
		personstateFree(grabRadius);
		personstateTired();
		break;
	case PERSONSTATE.GRABBED:
		personstateGrabbed();
		break;
}

show_debug_message(state)