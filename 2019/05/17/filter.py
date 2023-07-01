from dataclasses import dataclass


@dataclass
class FilterMetadataDto:
    "The front end provides this data about the requested filters"

    column_header: str
    value: object
