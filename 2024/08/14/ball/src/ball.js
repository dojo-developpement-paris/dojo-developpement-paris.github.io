const canvas = document.querySelector("canvas");
const ctx = canvas.getContext("2d");
canvas.style.border = "1px solid black";
canvas.width = 500;
canvas.height = 500;

const balle = { x: 250, y: 250, rayon: 20, couleur: "gold" };
const direction = { x: Math.random() > 0.5 ? 1 : -1, y: 0 };

const Mouvement = {
  MONTE: 1,
  IMMOBILE: 0,
  DESCEND: -1,
};

const raquette = { largeur: 10, hauteur: 100 };

const raquetteGauche = {
  ...raquette,
  x: 25,
  y: 200,
  mouvement: Mouvement.IMMOBILE,
  couleur: "red",
  toucheLeBord() {
    return balle.x < this.x + this.largeur + balle.rayon;
  },
};

const raquetteDroite = {
  ...raquette,
  x: canvas.width - 25,
  y: 200,
  mouvement: Mouvement.IMMOBILE,
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
  dessineRaquette(raquetteGauche);
  dessineRaquette(raquetteDroite);
  if (toucheLeMur()) {
    clearInterval(animation);
  }
  if (collision(raquetteGauche)) {
    direction.x = -direction.x;
    balle.x += 1;
    if (raquetteGauche.mouvement === Mouvement.MONTE) {
      direction.y -= 0.25;
    }
    if (raquetteGauche.mouvement === Mouvement.DESCEND) {
      direction.y += 0.25;
    }
  }

  if (collision(raquetteDroite)) {
    direction.x = -direction.x;
    balle.x -= 1;
    if (raquetteDroite.mouvement === Mouvement.MONTE) {
      direction.y -= 0.25;
    }
    if (raquetteDroite.mouvement === Mouvement.DESCEND) {
      direction.y += 0.25;
    }
  }

  if (balle.y > canvas.width - balle.rayon || balle.y < balle.rayon) {
    direction.y = -direction.y;
  }
  balle.x += direction.x;
  balle.y += direction.y;
};
const animation = setInterval(boucleDeJeu, 6);

window.addEventListener(
  "keydown",
  (event) => {
    switch (event.key) {
      case "z":
        raquetteGauche.mouvement = Mouvement.MONTE;
        monteRaquette(raquetteGauche);
        break;
      case "s":
        baisseRaquette(raquetteGauche);
        raquetteGauche.mouvement = Mouvement.DESCEND;
        break;
      case "ArrowUp":
        raquetteDroite.mouvement = Mouvement.MONTE;
        monteRaquette(raquetteDroite);
        break;
      case "ArrowDown":
        raquetteDroite.mouvement = Mouvement.DESCEND;
        baisseRaquette(raquetteDroite);
        break;
    }
  },
  true
);

window.addEventListener(
  "keyup",
  (event) => {
    switch (event.key) {
      case "z":
      case "s":
        raquetteGauche.mouvement = Mouvement.IMMOBILE;
        break;
      case "ArrowUp":
      case "ArrowDown":
        raquetteDroite.mouvement = Mouvement.IMMOBILE;
        break;
    }
  },
  true
);

const monteRaquette = (raquette) => {
  if (neTouchePasLeHaut(raquette)) {
    raquette.y -= 5;
  }
};

const neTouchePasLeHaut = (raquette) => raquette.y > 0;

const baisseRaquette = (raquette) => {
  if (neTouchePasLeBas(raquette)) {
    raquette.y += 5;
  }
};

const neTouchePasLeBas = (raquette) =>
  raquette.y + raquette.hauteur < canvas.height;
