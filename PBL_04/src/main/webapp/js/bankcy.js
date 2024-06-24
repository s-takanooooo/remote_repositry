var startPos;
var endPos;
var bullets = [];
var flowers = [];
var showVector = false;
var splatterPane;
var flowerCount = 20;
var dripCount = 4;
var maxSpeed = 50;
var girlW = 100;
var girlH = girlW * 1.72;
var buttonW = Math.max(window.innerWidth * .1, 80);
var buttonH = Math.max(window.innerHeight * .05, 20);

// BULLET CLASS
function Bullet(x, y) {
	this.pos = createVector(girlW, height - girlH);
	this.vel = createVector(x, y);
	this.grav = createVector(0, .25);
	this.maxSpeed = 20;

	this.vel.setMag(map(this.vel.mag(), 0, 500, 0, this.maxSpeed))

	this.update = function() {
		this.vel.add(this.grav);
		this.pos.add(this.vel);
	}

	this.show = function() {
		noStroke();
		ellipse(this.pos.x, this.pos.y, 10, 10);
	}
}

// FLOWER CLASS
function Flower(pos, vel, chance) {
	this.chance = chance;
	this.pos = pos;
	this.vel = vel;
	this.acc = createVector(0, 0);
	this.lifetimeStart = 20;
	this.lifetime = this.lifetimeStart;
	this.grav = createVector(0, .25);
	this.dead = false;
	this.size = 10;
	this.prevPos;

	this.update = function() {
		if (!this.dead) {
			//save
			this.prevPos = this.pos.copy();

			// accumulate
			this.acc.add(this.grav);
			this.vel.add(this.acc);
			this.pos.add(this.vel);

			// reset
			this.acc = createVector(0, 0);

			// increment
			this.lifetime--;
			if (this.lifetime == 0) {
				this.dead = true;
			}
		}
	}

	this.show = function() {
		var size = this.size * (this.lifetime / this.lifetimeStart);
		var lightness = floor(random(42, 50));

		if (random() < this.chance) {
			splatterPane.stroke(color("hsl(120,60%," + lightness + "%)")); // 変更点: 色相を 0 から 120 に変更
			splatterPane.strokeWeight(size);
			splatterPane.noFill();
			splatterPane.line(this.pos.x, this.pos.y, this.prevPos.x, this.prevPos.y);
		}
	}
}

// P5 setup
function preload() {
	girl = loadImage('https://s3-us-west-2.amazonaws.com/s.cdpn.io/5946/banksy.png');

	chelsea = loadFont('https://s3-us-west-2.amazonaws.com/s.cdpn.io/5946/ChelseaMarket-Regular.ttf');

}
function setup() {
	createCanvas(windowWidth, windowHeight);
	splatterPane = createGraphics(width, height);

	button = createButton('RESET');
	button.position(width - (buttonW + 20), height - (buttonH + 40));
	button.mousePressed(reset);

	button.size(buttonW, buttonH);
	
	window.onresize = function(){
		location.reload();
	}
}
function draw() {
	background(204);
	drawInstructions();
	image(girl, 0, height - girlH, girlW, girlH);
	image(splatterPane, 0, 0, width, height);

	fill(0)

	// VECTOR
	if (showVector) {
		var d = dist(startPos.x, startPos.y, mouseX, mouseY);
		var m = createVector(mouseX, mouseY);
		var angle = startPos.angleBetween(m);
		var hue = min(map(d, 0, height / 3, 0, 100), 100);
		var col = color('hsl(' + floor(map(hue, 0, 100, 0, 120)) + ',50%,50%)'); // 変更点: 色相を 0-100 から 0-120 にマップ
		stroke(col);

		strokeWeight(10);
		line(startPos.x, startPos.y, mouseX, mouseY);
	}


	// BULLETS
	for (let i = bullets.length - 1; i >= 0; i--) {
		var b = bullets[i];
		b.update();
		b.show();
		if (b.pos.y > height) {
			bullets.splice(i, 1);
		}
	}

	// FLOWERS
	for (let i = flowers.length - 1; i >= 0; i--) {
		var f = flowers[i];
		f.update();
		f.show();
		if (f.dead) {
			flowers.splice(i, 1);
		}
	}
}

// BULLET TO FLOWERS
function burst() {
	for (var j = 0; j < bullets.length; j++) {
		var b = bullets[j];
		var mag = b.vel.mag();
		var magPower = 1.2

		for (var i = 0; i < (mag * magPower); i++) {
			var pos = createVector(b.pos.x, b.pos.y);
			var vel = createVector(b.vel.x, b.vel.y);

			var angle = (TAU / (mag * magPower)) * i;

			newVel = createVector(vel.x, vel.y).rotate(angle);
			var angle = vel.angleBetween(newVel);
			var angleDiff = PI - abs(angle) + .5;

			var chanceOfShowing = map(angleDiff, 0, PI, 0, .9);
			newVel.mult(map(angleDiff, 0, PI, 0, .5))

			var f = new Flower(pos, newVel, chanceOfShowing);
			flowers.push(f);
		}
		for (var i = 0; i < dripCount; i++) {

			var pos = createVector(b.pos.x + (random(-mag, mag)), b.pos.y);
			var vel = createVector(0, 1).setMag(mag * .3);
			var f = new Flower(pos, vel, .8);
			flowers.push(f);
		}
	}
	console.log(flowers)
	bullets = new Array;
}

// FIRE A BULLET
function fire() {
	var d = dist(startPos.x, startPos.y, endPos.x, endPos.y);

	if (d < 10) {
		burst();
	} else {
		var b = new Bullet(startPos.x - endPos.x, startPos.y - endPos.y);
		bullets.push(b);
	}
}

// EVENTS
function start() {
	startPos = createVector(mouseX, mouseY);
	showVector = true;
}
function end() {
	endPos = createVector(mouseX, mouseY);
	showVector = false;
	fire();
}
function mousePressed() {
	start()
}
function touchStarted() {
	start()
}
function mouseReleased() {
	end()
}
function touchEnded() {
	end()
}

// RESET
function reset() {
	splatterPane.clear();
}

// DRAW INSTRUCTIONS
function drawInstructions() {
	noStroke();
	fill(70);
	textFont(chelsea);
	textSize(32);
	textAlign(CENTER);
	var topAlign = max(height * .1)
	text('drag to aim', width / 2, topAlign);
	text('tap to burst', width / 2, topAlign * 2);
}

// NO WEIRDNESS ON MOBILE
document.ontouchmove = function(event) {
	event.preventDefault();
}