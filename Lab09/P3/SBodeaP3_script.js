class Student {
    constructor(nume, prenume, datan, foaiaMatricola) {
        this.setNume(nume);
        this.setPrenume(prenume);
        this.setDataN(datan);
        this.foaiaMatricola = foaiaMatricola;
    }

    afiseazaVarsta = () => {
        var date1 = new Date()
        return Math.ceil(Math.abs(date1 - this.datan) / (1000 * 60 * 60 * 24 * 365));
    }

    afiseazaNotele = () => {
        var string1 = this.foaiaMatricola[0];
        for (var i = 1; i < this.foaiaMatricola.length; i++)
            string1 += ", " + this.foaiaMatricola[i];
        return string1;
    }

    calculeazaMedia = () => (this.foaiaMatricola.reduce((a, b) => a + b, 0) / this.foaiaMatricola.length);

    adaugaNota = (nota_noua) => {
        this.foaiaMatricola.push(nota_noua);
    }

    setNume(n) {
        if (n.length < 2) {
            alert("Parametru invalid! Lungime prea mica!");
            return 0;
        }
        for (var i = 0; i < n.length; i++)
            if (n.charAt(i) >= '0' && n.charAt(i) <= '9') {
                alert("Parametru invalid! Numele contine cifre!")
                return 0;
            }
        this.nume = n;
    }
    setPrenume(n) {
        if (n.length < 2) {
            alert("Parametru invalid! Lungime prea mica!");
            return 0;
        }
        for (var i = 0; i < n.length; i++)
            if (n.charAt(i) >= '0' && n.charAt(i) <= '9') {
                alert("Parametru invalid! Prenumele contine cifre!")
                return 0;
            }
        this.prenume = n;
    }
    setDataN(d) {
        var date1 = new Date()
        if (Math.ceil(Math.abs(date1 - d) / (1000 * 60 * 60 * 24 * 365) < 18)) {
            alert("Varsta este sub 18 ani!")
            return 0;
        }
        this.datan = d;
    }
}  

textAfisat = "";

function ordineAlfabetica(grupa) {
    textAfisat += "<br>Studentii in ordine alfabetica: ";
    for (var i = 0; i < grupa.length; i++)
        for (var j = i + 1; j < grupa.length; j++)
            if ((grupa[i].nume + grupa[i].prenume).localeCompare(grupa[j].nume + grupa[j].prenume) == 1) {
                var temp = grupa[i];
                grupa[i] = grupa[j];
                grupa[j] = temp;
            }
    for (var i = 0; i < grupa.length; i++)
        textAfisat += grupa[i].nume + " " + grupa[i].prenume + ' ; ';
}

function ordineMedii(grupa) {
    textAfisat += "<br>Studentii in ordinea mediilor: ";
    for (var i = 0; i < grupa.length; i++)
        for (var j = i + 1; j < grupa.length; j++)
            if (grupa[i].calculeazaMedia() > grupa[j].calculeazaMedia()) {
                var temp = grupa[i];
                grupa[i] = grupa[j];
                grupa[j] = temp;
            }
    for (var i = 0; i < grupa.length; i++)
        textAfisat += grupa[i].nume + " " + grupa[i].prenume + ' cu media ' + grupa[i].calculeazaMedia().toPrecision(3) + ' ; ';
}

function ordineVarsta(grupa) {
    textAfisat += "<br>Studentii in ordinea varstei: ";
    for (var i = 0; i < grupa.length; i++)
        for (var j = i + 1; j < grupa.length; j++)
            if (grupa[i].afiseazaVarsta() > grupa[j].afiseazaVarsta()) {
                var temp = grupa[i];
                grupa[i] = grupa[j];
                grupa[j] = temp;
            }
    for (var i = 0; i < grupa.length; i++)
        textAfisat += grupa[i].nume + " " + grupa[i].prenume + ' cu varsta ' + grupa[i].afiseazaVarsta() + ' ; ';
}

function f1() {
    displayer = document.getElementById("displayer");

    grupa = [];
    grupa.push(new Student("Ana", "Schmidt", new Date('2010-12-11'), [1, 9, 8, 5, 2]));
    grupa.push(new Student("Ion", "Ilie", new Date('2010-10-11'), [10, 9, 8, 5, 2]));
    grupa.push(new Student("Benjamin", "Ion", new Date('2010-01-11'), [3, 9, 8, 5, 2]));

    ordineAlfabetica(grupa);
    ordineMedii(grupa);
    ordineVarsta(grupa);

    grupa.push(new Student("Cineva", "Altcineva", new Date('2002-01-13'), [3, 9, 8, 5, 2, 7, 9, 5]));
    grupa.push(new Student("Connect", "R", new Date('2002-01-13'), [3, 9, 8, 5, 2, 7, 9, 5]));
    grupa.splice(2, 1);
    grupa[2].adaugaNota(5);
    grupa[2].adaugaNota(5);
    grupa[2].adaugaNota(3);
    grupa[1].setNume("Nume2");

    textAfisat += '<br><br>S-au efectuat modificari<br>';
    ordineAlfabetica(grupa);
    ordineMedii(grupa);
    ordineVarsta(grupa);

    displayer.innerHTML = textAfisat;
}
