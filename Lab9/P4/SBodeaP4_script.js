function f1() {
    var r = 0,
        g = 0,
        b = 0,
        i=0;
    displayer = [];
    displayer.push(document.getElementById("d0"));
    displayer.push(document.getElementById("d1"));
    displayer.push(document.getElementById("d2"));
    displayer.push(document.getElementById("d3"));
    displayer.push(document.getElementById("d4"));
    displayer.push(document.getElementById("d5"));
    displayer.push(document.getElementById("d6"));
    displayer.push(document.getElementById("d7"));
    displayer[i].style.backgroundColor = "rgb(" + r + "," + g + "," + b + ")";
    i++;
    r=255;g=0;b=0;
    displayer[i].style.backgroundColor = "rgb(" + r + "," + g + "," + b + ")";
    i++;
    r=0;g=255;b=0;
    displayer[i].style.backgroundColor = "rgb(" + r + "," + g + "," + b + ")";
    i++;
    r=0;g=0;b=255;
    displayer[i].style.backgroundColor = "rgb(" + r + "," + g + "," + b + ")";
    i++;
    r=255;g=255;b=0;
    displayer[i].style.backgroundColor = "rgb(" + r + "," + g + "," + b + ")";
    i++;
    r=255;g=0;b=255;
    displayer[i].style.backgroundColor = "rgb(" + r + "," + g + "," + b + ")";
    i++;
    r=0;g=255;b=255;
    displayer[i].style.backgroundColor = "rgb(" + r + "," + g + "," + b + ")";
    i++;
    r=255;g=255;b=255;
    displayer[i].style.backgroundColor = "rgb(" + r + "," + g + "," + b + ")";
    i++;
}
