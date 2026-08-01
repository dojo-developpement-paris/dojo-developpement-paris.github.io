use std::sync::Arc;

type Item = u16;

#[derive(Clone)]
pub struct Predicate {
    pub function: Arc<dyn Fn(Item) -> bool>,
}

#[allow(dead_code)]
impl Predicate {
    pub fn new<T: Fn(Item) -> bool + 'static>(function: T) -> Self {
        Predicate {
            function: Arc::new(function),
        }
    }
}

#[allow(dead_code)]
pub struct Dispenser {
    items: Vec<Item>,
    predicate: Option<Predicate>,
    position: Option<usize>,
}

#[allow(dead_code)]
impl Dispenser {
    pub fn new(items: Vec<Item>) -> Self {
        Dispenser {
            items: items.clone(),
            predicate: None,
            position: None,
        }
    }

#[allow(dead_code)]
    pub fn find_first(&mut self, predicate: Predicate) -> Option<Item> {
        self.predicate = Some(predicate.clone());
        if let Some((next_position, value))= find_item(&self.items, &predicate, 0) {
            self.position = Some(next_position);
            Some(value)
        } else {
            self.position = None;
            None
        }
    }

    pub fn find_next(&mut self) -> Option<Item> {
        let predicate = match &self.predicate {
            Some(predicate) => predicate,
            None => panic!("no predicate; call find_first first"),
        };
        let position = match self.position {
            Some(position) => position,
            None => return None,
        };
        if let Some((next_position, value)) = find_item(&self.items, predicate, position) {
            self.position = Some(next_position);
            Some(value)
        } else {
            self.position = None;
            None
        }
    }
}

#[allow(dead_code)]
fn find_item(items: &Vec<Item>, predicate: &Predicate, position: usize) -> Option<(usize, Item)> {
    let function = predicate.function.clone();
    let start_position = position;
    let index = items[position..]
        .iter()
        .position(|item| function(*item))
        .map(|i| position + i)?;
    let position = index+1;
    if position == start_position {
        None
    } else {
        Some((position, items[index]))
    }
}
#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn a_dispenser_can_find_the_items_matching_a_predicate() {
        let mut dispenser = Dispenser::new(vec![23, 17, 42, 4807, 3, 12, 256, 100, 1017 ]);
        let predicate = Predicate::new(|n| n >= 100);
        let result = dispenser.find_first(predicate);
        assert_eq!(result, Some(4807));
        let result = dispenser.find_next();
        assert_eq!(result, Some(256));
        let result = dispenser.find_next();
        assert_eq!(result, Some(100));
        let result = dispenser.find_next();
        assert_eq!(result, Some(1017));
        let result = dispenser.find_next();
        assert_eq!(result, None);
    }
}
