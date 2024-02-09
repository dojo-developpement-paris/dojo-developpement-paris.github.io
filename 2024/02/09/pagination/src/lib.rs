/*
++ remplacer current sur les string qui sont en fake +1
+ la meme chose poiur le match si c'est 1 ça sera 1
map en tuple de (jesaispas, jesaispas), si le premier élément == current, on fait (jesaispas), sinon jesaispas, et join avec un espace
++ map de la séquence de chiffre en une séquence de mots "x" "(x)" et join avec un espace +1+1+1+1
+++ faire des petits pas +1
++ reduce d'une chaine vide, et on ajoute le "x" ou "(x)" sur l'accumulateur +1+1
++ reduce d'une chaine vide, et on ajoute le " x" ou " (x)" sur l'accumulateur et supprimer le premier espace
faire en fonctionnel avec un map (sans galérer avec Rust)
*/

pub fn paginate_state(current: i32, total: i32) -> String {
    // (1..total+1).into_iter().map(|jesaispas|
    //     match  {

    //     }
    // );
    if current == 2 {
        let mut result = "".to_string();
        let mut page = 1;
        let mut format = if page == current {
            selected
        } else {
            not_selected
        };
        result += &format(page);
        page += 1;
        result += " ";
        format = if page == current {
            selected
        } else {
            not_selected
        };
        result += &format(page);
        result
    } else if total == 2 {
        selected(current) + " " + &not_selected(2)
    } else {
        selected(current)
    }
}

pub fn selected(page: i32) -> String {
    format!("({})", page)
}

fn not_selected(page: i32) -> String {
    page.to_string()
}

#[cfg(test)]
mod test {
    use super::*;
    use speculoos::*;

    #[test]
    fn only_one_page() {
        assert_that(&paginate_state(1, 1)).is_equal_to("(1)".to_string())
    }

    #[test]
    fn first_of_two_pages() {
        assert_that(&paginate_state(1, 2)).is_equal_to("(1) 2".to_string())
    }

    #[test]
    fn second_of_two_pages() {
        assert_that(&paginate_state(2, 2)).is_equal_to("1 (2)".to_string())
    }
}
