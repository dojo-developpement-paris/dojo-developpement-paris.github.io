(ns sokoban.core
  (:gen-class))



;;; # = mur
;;; $ = caisses
;;; . = objectifs
;;; * = caisse sur son objectif
;;; @ = bonhomme
;;; + = bonhomme qui marche sur un objectif
;;; <espace> = vide

"#" = mur
"$" = caisses
"." = objectifs
"*" = caisse sur son objectif
"@" = bonhomme
"+" = bonhomme qui marche sur un objectif
" " = vide

(use '[clojure.string :only (join split)])

(defn success [grid]
  (->> grid
       (join)
       (seq)
       (every? #(not= \$ %))))


(defn position
  [grid]
  (.indexOf (vec (join grid)) \@))

(defn near [grid d p]
  (let [go (cond
             (= d :east) inc
             (= d :west) dec)]
    (nth (join grid) (go p))))

(defn can-go? [grid d]
  (let [pos (position grid)
        e (near grid d pos)]
    (= \space e)))

(defn move-worker [grid origin dest]
  (-> (->> grid
         (join)
         (vec))
    (update-in [dest] (fn [x] \@))
    (update-in [origin] (fn [x] \space))))

(defn move [grid direction]
  (cond
    (and
     (= direction :east)
     (can-go? grid :east)) ["#####"
                           "#* @#"
                           "#####"]
    (and
     (= direction :west)
     (can-go? grid :west)) ["#####"
                           "#*@ #"
                           "#####"]
    :else grid))


(and
 (= (move (move ["#####"
                 "#*@ #"
                 "#####"] :east) :west)
   ["#####"
    "#*@ #"
    "#####"])
 (= (move ["#####"
          "#*@ #"
          "#####"] :east)
   ["#####"
    "#* @#"
    "#####"])
 (= (move ["#####"
           "#*@ #"
           "#####"] :south)
    ["#####"
     "#*@ #"
     "#####"])
 (= (success ["#####"
              "#*@ #"
              "#####"]) true)
 (= (success ["#####"
              "#.$@#"
              "#####"]) false)
 (= (success ["######"
              "#.$@ #"
              "######"]) false))
