void take(int &byRef, int *byPtr) {
	byRef++;
	byPtr++;
}

void give() {
	int x, y;
	take(x, &y);
}
