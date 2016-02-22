private double fractionLength = .8; 
private int smallestBranch = 10; 
private double branchAngle = .2;  
public void setup() 
{   
	size(600, 500);
	// noLoop();
} 
public void draw() 
{   
	background(210, 255, 255);
	line(301, 496, 301, 396);
	drawBranches(301, 396, 100, 3 * Math.PI / 2, 0, 0);
	line(300, 495, 300, 395);   
	drawBranches(300, 395, 100, 3 * Math.PI / 2, 0, 255);
	fill(100, 50, 0);
	rect(0, 400, 600, 100);
}
public void lightning()
{
	int timer = 0;
	for(int i = 0; i < 30; i++)
	{
	if(timer < 15)
	{
		timer++;
	}
	else if(timer == 15)
	{
		stroke(0);
		fill(255, 255, 0);
		beginShape();
		vertex(10, 0);
		vertex(320, 350);
		vertex(0, 10);
		endShape();
		timer++;
	}
	else
	{
		timer=0;
	}
}
	println(timer);
}
public void drawBranches(int x, int y, double branchLength, double angle, int colorRB, int colorG) 
{   
	double angle1 = angle + branchAngle;
	double angle2 = angle - branchAngle;
	branchLength = branchLength * fractionLength;
	int endX1 = (int)(branchLength * Math.cos(angle1) + x);
	int endY1 = (int)(branchLength * Math.sin(angle1) + y);
	int endX2 = (int)(branchLength * Math.cos(angle2) + x);
	int endY2 = (int)(branchLength * Math.sin(angle2) + y);
	stroke(colorRB, colorG, colorRB);
	line(x, y, endX1, endY1);
	line(x, y, endX2, endY2);
	if(branchLength > smallestBranch)
	{
		drawBranches(endX1, endY1, branchLength, angle1, colorRB + 15, colorG);
		drawBranches(endX2, endY2, branchLength, angle2, colorRB + 15, colorG);
	}
} 
