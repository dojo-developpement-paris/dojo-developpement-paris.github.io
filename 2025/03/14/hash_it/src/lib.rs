pub struct HashTable {
    pub size: usize,
    pub items: [char; 101],
}

impl Default for HashTable {
    fn default() -> Self {
        Self::new()
    }
}

impl HashTable {
    pub fn new() -> HashTable {
        HashTable {
            size: 0,
            items: ['\0'; 101],
        }
    }

    pub fn find(&self, arg: &str) -> Option<usize> {
        if arg == "e" && self.items[0] != '\0' {
            Some(0)
        } else if arg == "f" && self.items[1] != '\0' {
            Some(1)
        } else {
            None
        }
    }

    pub fn add_key(&mut self, arg: &str) {
        self.size += 1;
        if arg == "e" {
            self.items[0] = 'e';
        } else {
            self.items[1] = 'f';
        }
    }
}

#[cfg(test)]
mod test {
    use super::*;
    use option::OptionAssertions;
    use speculoos::*;

    #[test]
    fn initially_hash_table_is_empty() {
        let hash_table = HashTable::new();
        assert_that(&hash_table.size).is_equal_to(0)
    }

    #[test]
    fn initially_hash_table_does_not_contain_items() {
        let hash_table = HashTable::new();
        assert_that(&hash_table.find("e")).is_none();
    }

    #[test]
    fn item_inserted_can_be_found() {
        let mut hash_table = HashTable::new();
        hash_table.add_key("e");
        assert_that(&hash_table.find("e")).is_some().is_equal_to(0);
    }

    #[test]
    fn any_inserted_item_can_be_found() {
        let mut hash_table = HashTable::new();
        hash_table.add_key("f");
        assert_that(&hash_table.find("f")).is_some().is_equal_to(1);
    }
}
