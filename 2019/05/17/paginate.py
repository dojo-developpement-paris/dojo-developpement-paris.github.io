from dataclasses import dataclass, field


@dataclass
class PaginatedTableDto:
    "instances of this class can be returned to the front end for display"

    "the total number of rows, including those rows not shown on the current page"
    totalRows: int
    "the headers for the table, should be a list of strings"
    headers: list = field(default_factory=list)
    "The data to show in the current page of the table, should be a list of strings"
    rowData: list = field(default_factory=list)


@dataclass
class PaginationMetadataDto:
    "The front end provides this data about the requested pagination"

    first_record_index: int
    page_size: int

