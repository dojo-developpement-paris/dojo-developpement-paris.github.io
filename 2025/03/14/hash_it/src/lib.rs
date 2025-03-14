pub struct HashTable {
    pub size: usize,
}

impl Default for HashTable {
    fn default() -> Self {
        Self::new()
    }
}

impl HashTable {
    pub fn new() -> HashTable {
        HashTable { size: 0 }
    }
}

#[cfg(test)]
mod test {
    use super::*;
    use speculoos::*;

    #[test]
    fn initially_hash_table_is_empty() {
        let hash_table = HashTable::new();
        assert_that(&hash_table.size).is_equal_to(0)
    }
}
