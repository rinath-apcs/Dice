ArrayList<Die> dice = new ArrayList();
int sum;

void setup() {
	noLoop();
	size(500, 600);
	textSize(32);
	textAlign(CENTER);

	for (int y = 0; y < 9; y++) {
		for (int x = 0; x < 9; x++) {
			dice.add(new Die(50+50*x, 50+50*y, 20));
		}
	}
}

void draw() {
	background(177);
	sum = 0;
	for (Die die : dice) {
		sum += die.tick();
	}
	text(sum, 250, 550);
}

void mousePressed() {
	redraw();
}

class Die {
	float x, y;
	int num, radius;
	
	public Die(int x, int y, int radius) {
		this.x = x - radius;
		this.y = y - radius;
		this.radius = radius;

		roll();
	}

	private void roll() {
		num = (int) (Math.random() * 6 + 1);
	}

	private void show() {
		roll();

		fill(255 - num * 10, 195 + num * 10, 195 + num * 10);
		rect(x, y, radius * 2, radius * 2, radius / 2.0);

		fill(0);
		switch(num) {
			case 5:
				dot(3,3);
				dot(1,1);
			case 3:
				dot(1,3);
				dot(3,1);
			case 1:
				dot(2,2);
				break;
			case 6:
				dot(1,2);
				dot(3,2);
			case 4:
				dot(3,3);
				dot(1,1);
			case 2:
				dot(1,3);
				dot(3,1);
				break;
		}
	}

	private void dot(int xPos, int yPos) {
		ellipse(x + radius * xPos / 2.0, y + radius * yPos / 2.0, radius / 2.5, radius / 2.5);
	}

	public int tick() {
		show();
		return num;
	}
}

