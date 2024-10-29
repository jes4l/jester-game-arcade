function mouseOver(xx,yy,width,height){

xx = (xx - width/2);
yy = (yy - height/2);

if(mouse_x > xx && mouse_x < xx + width){
	if(mouse_y > yy && mouse_y < yy + height){
		return true;
	}else return false;
}else return false;

}