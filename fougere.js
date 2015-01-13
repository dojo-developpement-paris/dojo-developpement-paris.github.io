
function show() {
    var canvas = document.getElementById("canvas");
    
    var createLine = function(x1,y1,x2,y2) {
        var myLine = { x1:x1, x2:x2, y1:y1, y2:y2 };
        return myLine;
    }
    
    var drawLine = function(line) {
        var graphicLine = document.createElementNS('http://www.w3.org/2000/svg','line');
        graphicLine.setAttribute('x1', line.x1);
        graphicLine.setAttribute('y1', line.y1);
        graphicLine.setAttribute('x2', line.x2);
        graphicLine.setAttribute('y2', line.y2);
        graphicLine.setAttribute('stroke', 'green');
        canvas.appendChild(graphicLine);
   
    }

    var copyLine = function(line){
        return createLine(line.x1,
                                line.y1,
                                line.x2,
                                line.y2);
    }

    var translate = function(line, dx, dy) {
      var newLine = copyLine(line);
      newLine.x1 += dx;
      newLine.x2 += dx;
      newLine.y1 += dy;
      newLine.y2 += dy;
      return newLine;
    }

    var rotate = function(line, angle) {
        var newline = translate(line,-line.x1,-line.y1);
        var x2 = Math.cos(angle) * newline.x2 - Math.sin(angle) * newline.y2;
        var y2 = Math.sin(angle) * newline.x2 + Math.cos(angle) * newline.y2;
        newline.x2 = x2;
        newline.y2 = y2;
        return translate(newline, line.x1, line.y1);
    }

    var scale = function(line, scale) {
        var newline = translate(line,-line.x1,-line.y1);
        var x2 = newline.x2 * scale;
        var y2 = newline.y2 * scale;
        newline.x2 = x2;
        newline.y2 = y2;
        return translate(newline, line.x1, line.y1);
    }
    var l1 = createLine(10,20,30,40);
    drawLine(l1);
    var l2 = translate(l1,15,45);
    drawLine(l2);
    var l3 = rotate(l2,Math.PI / 2);
    drawLine(l3);
    var l4 = translate(scale(l3, 0.5), 100, 100);
    drawLine(l4);
}
