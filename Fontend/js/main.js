"use strict";
/*les tableaux (cache) */
let film = [];
let livre = [];
let indicelivre = 0;
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
    for (indicelivre in livre)
    {
        tabLivre +="<tr class=" +  indicelivre  +"><td>" + livre[indicelivre].titrelivre +"</td>"
            + "<td>" + livre[indicelivre].auteur + "</td>"
            + "<td>"+ livre[indicelivre].tomes + "</td>"
            + "<td>" + livre[indicelivre].pages + "</td>"
            + "<td>" + livre[indicelivre].suite + "</td>";
        if (livre[indicelivre].suite === "oui")
        {
            tabLivre += "<td>" + livre[indicelivre].pages_suite + "</td>"
                + "<td>" + livre[indicelivre].tomes_suite + "</td>";
        } else
        {
            tabLivre += "<td>" + " " + "</td>"
                + "<td>" + " " + "</td>";
        }
        tabLivre+= "<td><button id=" +  indicelivre  +" value='like' onclick='recupId(this)'>aime</button>"
            + "<button id=" +  (indicelivre +1)  +" value='dislike' onclick='recupId(this)' >aime pas</button></td>"
            + "</tr>";
    }
    tabLivre+="</table>";
    document.getElementById('listelivre').innerHTML = tabLivre;
}

function recupId(a){
    let choix = document.getElementsByClassName(a);
    if (document.getElementById(a).value === 'aime'){
        choix.style.backgroundColor = # 73FF3E;
    }else {
        choix = choix-1;
        choix.style.backgroundColor = # FF0202;
    }
}

function listeFilm(){
    let tabFilm = "";
    tabFilm+="<table id='film'><tr id='titre'><td>titre</td><td>auteur</td><td>duree " + "en " + "minutes</td><td>suite?</td><td>film " + "suite</td><td>duree " + "des " + "films " + "en " + "minutes</td><td>avis</td></tr>";
    for (let id in film)
    {
        tabFilm += "<tr>"
            +"<td>" + film[id].titrefilm +"</td>"
            +"<td>" + film[id].auteur + "</td>"
            +"<td>" + film[id].duree + "</td>"
            +"<td>" + film[id].suite +"</td>"
            +"<td>" + film[id].film_suite + "</td>"
            +"<td>" + film[id].duree_suite +"</td>"
            + "<td><button id=" +  id  +" type='button' onclick=''>aime</button>"
            + "<button id=" +  id  +" type='button' onclick=''>aime pas</button></td>"
            + "</tr>";
    }
    tabFilm+="</table>";
    document.getElementById('listeFilm').innerHTML = tabFilm;
}