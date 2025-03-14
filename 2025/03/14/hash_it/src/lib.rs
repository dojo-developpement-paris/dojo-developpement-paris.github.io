pub struct HashTable {
    pub size: usize,
}

#[cfg(test)]
mod test {
    use super::*;
    use speculoos::*;

    #[test]
    fn initially_hash_table_is_empty() {
        let hash_table = HashTable { size: 0 };
        assert_that(&hash_table.size).is_equal_to(0)
    }
}
