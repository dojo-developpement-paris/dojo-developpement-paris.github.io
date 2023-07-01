
from filter import FilterMetadataDto
from sort import SortMetadataDto
from paginate import PaginatedTableDto, PaginationMetadataDto


def filter_sort_paginate_table(table_headers: list,
                               table_data: list,
                               filter_metadata: FilterMetadataDto,
                               sort_metadata: SortMetadataDto,
                               pagination_metadata: PaginationMetadataDto) -> PaginatedTableDto:
    """This method is called by the front end when it wants to display a page of horse data. """
    if sort_metadata :
        data = sorted(table_data,key=lambda horse: horse[2], reverse=True)
    else:
        data = table_data

    return PaginatedTableDto(totalRows = len(data),
                             headers = table_headers[:],
                             rowData = stringify(data))

def stringify(rows: list):
    return [ [str(column) for column in row] for row in rows ]

