from filter import FilterMetadataDto
from sort import SortMetadataDto
from paginate import PaginationMetadataDto

def sample_headers():
    return ["Breed", "Colour", "Height", "Age", "Shoes"]

def sample_horse_data():
    """Sample Horse data which you could adapt for your tests. Horses
    may have more or less parameters than this and there may be more or less rows
    in the table."""

    horse_data = [["Thoroughbred", "Bay", 1.60, 3, True],
                  ["Thoroughbred", "Grey", 1.55, 3, True],
                  ["Arabian horse", "Bay", 1.51, 5, True],
                  ["Shetland Pony", "Black", 1.01, 2, False],
                  ["Shire horse", "Black", 1.71, 4, True],
                  ]

    return horse_data


def sample_filter_metadata():
    """Sample filter metadata that filters on two fields
    Breed must equal 'Thoroughbred' and age must equal 3"""
    return [FilterMetadataDto(column_header="Breed", value="Thoroughbred"),
            FilterMetadataDto(column_header="Age", value=3)]


def sample_sort_metadata():
    """Sample sort metadata. You only ever sort on one field.
    In this example you should sort by horse height descending"""
    return SortMetadataDto(column_header="Height", order="DESCENDING")


def sample_pagination_metadata():
    """Sample pagination metadata. In this example, each page of data should have 3 rows and
    the first record that should be shown on the page is the one at index 4."""
    return PaginationMetadataDto(first_record_index=4, page_size=3)
