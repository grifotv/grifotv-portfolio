var i;
var l = 15;//16
var paths = [];
for(i = 0;i<l;i++){
  var size = 3 + 15 * Math.random();
  if( i / 3 != parseInt( i / 3 ) ){
    paths[i] = new Path.RegularPolygon(new Point(size, size), parseInt( 3 + Math.random() * 6 ), size);
  }else{
    paths[i] = new Path.Rectangle([size * 0.75, size * 0.75], [size, size]);
  }
  
  paths[i].size = size * 2;
  paths[i].selected = true;

  paths[i].rotate( (360/l) * i );

  paths[i].randomX = 3 + Math.random() * 30;
  paths[i].randomY = 3 + Math.random() * 30;
  paths[i].speedX = 0.5 + Math.random() * 2;
  paths[i].speedY = 0.5 + Math.random() * 2;
  paths[i].speedR = 0.1 + Math.random() * 0.4;

  paths[i].posY = 100 + Math.random() * $( window ).height() * 3.5;

  paths[i].offsetY = 0

  if( i / 3 == parseInt( i / 3 ) ){
    paths[i].smooth();
  }
}
var top = 0.0;

function onFrame(event) {

    top+=($( window ).scrollTop() - top) * 0.5;

    for(i = 0;i<l;i++){
      var sin = Math.sin(event.time * paths[i].speedX + i);
      var cos = Math.cos(event.time * paths[i].speedY + i);

      if( i * 0.5 == parseInt( i * 0.5 ) ){
        paths[i].rotate(paths[i].speedR);
      }else{
        paths[i].rotate(-paths[i].speedR);
      }

      paths[i].offsetY -= 0.03 * paths[i].size;

      paths[i].position.x = ( ( $( window ).width() ) / l ) * i + sin * paths[i].randomX;
      paths[i].position.y = paths[i].posY + cos * paths[i].randomY - top + paths[i].offsetY;

      if( paths[i].position.y + $( window ).scrollTop() < -100 ){
        paths[i].offsetY = $( window ).height() + $( window ).scrollTop() + 100
      }
    }
}