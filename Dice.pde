ArrayList<Die> dice = new ArrayList();

void setup() {
	noLoop();

	size(200, 200);
	dice.add(new Die(100, 100, 20));
}

void draw() {
	for (Die die : dice) {
		die.show();
	}

}

void mousePressed() {
	redraw();
}

class Die {
	int x, y, num, radius;
	
	public Die(int x, int y, int radius) {
		this.x = x;
		this.y = y;
		this.radius = radius;

		roll();
	}

	private void roll() {
		num = (int) (Math.random() * 6 + 1);
		println(num);
	}

	public void show() {
		roll();

		fill(255);
		rect(x, y, radius * 2, radius * 2);

		fill(0);
		switch(num) {
			case 1:
				dot(2,2);
				break;
			case 2:
				dot(1,3);
				dot(3,1);
				break;
			case 3:
				dot(1,3);
				dot(3,1);
				dot(2,2);
				break;
			case 4:
				dot(1,1);
				dot(3,1);
				dot(3,3);
				dot(1,3);
				break;
			case 5:
				dot(2,2);
				dot(1,1);
				dot(3,1);
				dot(3,3);
				dot(1,3);
				break;
			case 6:
				dot(1,1);
				dot(3,1);
				dot(3,3);
				dot(1,3);
				dot(1,2);
				dot(3,2);
				break;
		}
	}

	private void dot(int xPos, int yPos) {
		ellipse(x + radius * xPos / 2.0, y + radius * yPos / 2.0, radius / 2.5, radius / 2.5);
	}
}
