// CSC220F19DemoA_SetupDraw Parson's csc120 recap
// modified by Schwesinger
int SIZE = 10;
Avatar[] avatars = new Avatar[SIZE];

void setup() {
    size(500, 500);
    frameRate(60);

    for (int i = 0; i < avatars.length/2; i++) {
        avatars[i] = new E();
    }
    for (int i = avatars.length/2; i < avatars.length; i++) {
        avatars[i] = new R();
    }

    rectMode(CENTER);
    ellipseMode(CENTER);
}

void draw() {
    background(255, 255, 0);
    for (Avatar a : avatars) {
        a.display();
        a.move();
    }
}

interface Avatar {
    void display();
    void move();
}

class E implements Avatar {
    // class attributes
    int x, y;
    int xspeed, yspeed;
    int w, h;

    E() {
        x = (int)random(width);
        y = (int)random(width);
        xspeed = randomSpeed();
        yspeed = randomSpeed();
        w = 75;
        h = 50;
    }

    E(int x, int y, int xspeed, int yspeed, int w, int h) {
        this.x = x;
        this.y = y;
        this.xspeed = xspeed;
        this.yspeed = yspeed;
        this.w = w;
        this.h = h;
    }

    void display() {
        push();
        translate(x, y);
        stroke(0, 0, 255);
        fill(255, 128, 0);
        ellipse(0, 0, w, h);
        stroke(0);
        fill(255);
        rect(0, 0, w/2, h/2);
        pop();
    }

    void move() {
        x += xspeed;
        y += yspeed;
        if (x > width+w || x < 0-w) {
            xspeed = - xspeed;
        }
        if (y < 0-h || y > height+h) {
            yspeed = - yspeed;
        }
    }

    int randomSpeed() {
        int result;
        do {
            result = (int)random(-5, 5);
        } while (result == 0);
        return result;
    }
}

class R implements Avatar {
    // class attributes
    int x, y;
    int xspeed, yspeed;
    int w, h;
    float rotation;

    R() {
        x = (int)random(width);
        y = (int)random(width);
        xspeed = randomSpeed();
        yspeed = randomSpeed();
        w = 100;
        h = 20;
        rotation = random(0, 360);
    }

    void display() {
        push();
        translate(x, y);
        rotate(radians(rotation));
        stroke(0);
        fill(102, 51, 153);
        rect(0, 0, w/2, h/2);
        pop();
    }

    void move() {
        x += xspeed;
        y += yspeed;
        if (x > width+w || x < 0-w) {
            xspeed = - xspeed;
        }
        if (y < 0-h || y > height+h) {
            yspeed = - yspeed;
        }
    }

    int randomSpeed() {
        int result;
        do {
            result = (int)random(-5, 5);
        } while (result == 0);
        return result;
    }
}
