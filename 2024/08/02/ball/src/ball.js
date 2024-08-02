const canvas = document.querySelector("canvas");
const ctx = canvas.getContext("2d");
canvas.style.border = "1px solid black";
canvas.width = 500;
canvas.height = 500;

const balle = { x: 250, y: 250, rayon: 20, couleur: "gold" };
const direction = { x: Math.random() > 0.5 ? 1 : -1, y: 0 };
const raquette = { largeur: 10, hauteur: 100 };

const raquetteGauche = {
  ...raquette,
  x: 25,
  y: 300,
  couleur: "red",
  toucheLeBord() {
    return balle.x < this.x + this.largeur + balle.rayon;
  },
};

const raquetteDroite = {
  ...raquette,
  x: 465,
  y: 200,
  couleur: "royalblue",
  toucheLeBord() {
    return balle.x > this.x - balle.rayon;
  },
};

const laBalleEstAuNiveauDeLaRaquette = (raquette) =>
  balle.y > raquette.y && balle.y < raquette.y + raquette.hauteur;

const collision = (raquette) =>
  laBalleEstAuNiveauDeLaRaquette(raquette) && raquette.toucheLeBord();

const dessineRaquette = (raquette) => {
  ctx.beginPath();
  ctx.fillStyle = raquette.couleur;
  ctx.rect(raquette.x, raquette.y, raquette.largeur, raquette.hauteur);
  ctx.fill();
};

const dessineBalle = () => {
  ctx.beginPath();
  ctx.fillStyle = balle.couleur;
  ctx.ellipse(balle.x, balle.y, balle.rayon, balle.rayon, 0, 0, Math.PI * 2);
  ctx.fill();
};

const toucheLeMur = () =>
  balle.x > canvas.width - balle.rayon || balle.x < balle.rayon;
const boucleDeJeu = () => {
  ctx.reset();
  dessineBalle();
  dessineRaquette(raquetteDroite);
  dessineRaquette(raquetteGauche);
  if (toucheLeMur()) {
    clearInterval(animation);
  }
  if (collision(raquetteGauche) || collision(raquetteDroite)) {
    direction.x = -direction.x;
  }

  if (balle.y > canvas.width - balle.rayon || balle.y < balle.rayon) {
    direction.y = -direction.y;
  }
  balle.x += direction.x;
  balle.y += direction.y;
};
const animation = setInterval(boucleDeJeu, 6);

// const animation = setInterval(ball, 60 / 1000);
