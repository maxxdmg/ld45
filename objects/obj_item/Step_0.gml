switch (state) {
	case ITEMSTATE.FREE:
		itemstateFree(3);
		break;
	case ITEMSTATE.GRABBED:
		itemstateGrabbed();
		break;
}