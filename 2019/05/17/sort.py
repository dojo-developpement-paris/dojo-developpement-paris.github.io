from dataclasses import dataclass


@dataclass
class SortMetadataDto:
    "the front end provides this data about the requested sort order"

    column_header: str
    order: str

