const canvas = document.querySelector("canvas");
const ctx = canvas.getContext("2d");
canvas.style.border = "1px solid black";
canvas.width = "500";
canvas.height = "500";

let balle = { x: 250, y: 250, rayon: 20, couleur: "gold" };
let direction = { x: Math.random() > 0.5 ? 1 : -1, y: 0 };
const raquette = { largeur: 10, hauteur: 100 };

const raquetteGauche = { ...raquette, x: 25, y: 200, couleur: "red" };
const raquetteDroite = { ...raquette, x: 465, y: 200, couleur: "royalblue" };

const collisionRaquetteGauche = () =>
  laBalleEstPlusBasseQueLeHautDeLaRaquette() &&
  laBalleEstPlusHauteQueLeBasDeLaRaquette() &&
  laBalleEstPlusADroiteQueLaDroiteDeLaRaquette();
const laBalleEstPlusADroiteQueLaDroiteDeLaRaquette = () =>
  balle.x < raquetteGauche.x + raquette.largeur + balle.rayon;
const laBalleEstPlusHauteQueLeBasDeLaRaquette = () =>
  balle.y < raquetteGauche.y + raquette.hauteur;
const laBalleEstPlusBasseQueLeHautDeLaRaquette = () =>
  balle.y > raquetteGauche.y;

const collisionRaquetteDroite = () =>
  laBalleEstPlusBasseQueLeHautDeLaRaquetteDroite() &&
  laBalleEstPlusAGaucheQueLaGaucheDeLaRaquette() &&
  laBalleEstPlusHauteQueLeBasDeLaRaquetteDroite();
const laBalleEstPlusAGaucheQueLaGaucheDeLaRaquette = () =>
  balle.x > raquetteDroite.x - balle.rayon;
const laBalleEstPlusHauteQueLeBasDeLaRaquetteDroite = () =>
  balle.y < raquetteDroite.y + raquette.hauteur;
const laBalleEstPlusBasseQueLeHautDeLaRaquetteDroite = () =>
  balle.y > raquetteDroite.y;

const ball = () => {
  ctx.reset();
  ctx.beginPath();
  ctx.fillStyle = balle.couleur;
  ctx.ellipse(balle.x, balle.y, balle.rayon, balle.rayon, 0, 0, Math.PI * 2);
  ctx.fill();
  if (balle.x > canvas.width - balle.rayon || balle.x < balle.rayon) {
    clearInterval(animation);
  }
  if (collisionRaquetteGauche() || collisionRaquetteDroite()) {
    direction.x = -direction.x;
  }

  if (balle.y > canvas.width - balle.rayon || balle.y < balle.rayon) {
    direction.y = -direction.y;
  }
  balle.x += direction.x;
  balle.y += direction.y;

  const dessineRaquette = (raquette) => {
    ctx.beginPath();
    ctx.fillStyle = raquette.couleur;
    ctx.rect(raquette.x, raquette.y, raquette.largeur, raquette.hauteur);
    ctx.fill();
  };
  dessineRaquette(raquetteDroite);
  dessineRaquette(raquetteGauche);
};
const animation = setInterval(ball, 10);

// const animation = setInterval(ball, 60 / 1000);
