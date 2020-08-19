"use strict";
/*les tableaux (cache) */
let film = [];
let livre = [];
let indicefilm = 0;

/* requetes pour créer une mémoire cache */
let filmTable = new XMLHttpRequest();
filmTable.open("get", "/film", true);
filmTable.onload = function(){
    film = JSON.parse(filmTable.responseText);
};
filmTable.send();

let livreTable = new XMLHttpRequest();
livreTable.open("get", "/livre", true);
livreTable.onload = function(){
    livre = JSON.parse(livreTable.responseText);
};
livreTable.send();

function listeLivre()
{
    let tabLivre = "";
    tabLivre+="<table id='livre'><tr id='titre'><td>titre</td><td>auteur</td><td>tomes</td><td>pages " + "série</td><td>suite</td><td>pages "+ "suite</td><td>tomes " + "suite</td><td>avis</td>";
    for (let id in livre)
    {
        tabLivre +="<tr class=" + livre[id].livreId +"><td>" + livre[id].titrelivre +"</td>"
            + "<td>" + livre[id].auteur + "</td>"
            + "<td>"+ livre[id].tomes + "</td>"
            + "<td>" + livre[id].pages + "</td>"
            + "<td>" + livre[id].suite + "</td>";
        if (livre[id].suite === "oui")
        {
            tabLivre += "<td>" + livre[id].pages_suite + "</td>"
                + "<td>" + livre[id].tomes_suite
                + "</td>";
        } else
        {
            tabLivre += "<td>" + " " + "</td>"
                + "<td>" + " " + "</td>";
        }
        tabLivre+= "<td><button id=" +  livre[id].livreId  + " value = 'like' onclick='recupId(this)'>aime</button>"
            + "<button id=" +  livre[id].livreId  + " value = 'dislike' onclick='recupId(this)' >aime pas</button></td>"
            + "</tr>";
        console.log('' + livre[id].livreId + '');
    }
    tabLivre+="</table>";
    document.getElementById('listelivre').innerHTML = tabLivre;
}

function recupId(bouton){
    let choix = document.getElementsByClassName(bouton.id)[0];
    let avis = bouton.value;
    if (avis === 'dislike')
    {
        choix.classList.add('non')
    }else
        {
        choix.classList.add('ok')
    }
}

function listeFilm(){
    let tabFilm = "";
    tabFilm+="<table id='film'><tr id='titre'><td>titre</td><td>auteur</td><td>duree " + "en " + "minutes</td><td>suite?</td><td>film " + "suite</td><td>duree " + "des " + "films " + "en " + "minutes</td><td>avis</td></tr>";
    for (let id in film)
    {
        tabFilm += "<tr class=" + film[id].filmid + ">"
            + "<td>" + film[id].titrefilm + "</td>"
            + "<td>" + film[id].auteur + "</td>"
            + "<td>" + film[id].duree + "</td>"
            + "<td>" + film[id].suite +"</td>"
            + "<td>" + film[id].film_suite + "</td>"
            + "<td>" + film[id].duree_suite +"</td>"
            + "<td><button id=" +  film[id].filmid  + " value = 'like' onclick='recupId(this)'>aime</button>"
            + "<button id=" +  film[id].filmid  + " value = 'dislike' onclick='recupId(this)'>aime pas</button></td>"
            + "</tr>";
    }
    tabFilm+="</table>";
    document.getElementById('listeFilm').innerHTML = tabFilm;
}