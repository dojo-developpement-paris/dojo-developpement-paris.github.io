from horse_backend import filter_sort_paginate_table
from sample_horse_data import sample_headers, sample_horse_data, sample_filter_metadata, sample_sort_metadata, sample_pagination_metadata
from sort import SortMetadataDto

import json

def test_given_no_horses_I_expect_no_result():
  headers = []
  horse_data = []
  filter_metadata = None
  sort_metadata = None
  pagination_metadata = None
  result = filter_sort_paginate_table(headers, horse_data, filter_metadata,
                                        sort_metadata, pagination_metadata)

  assert result.totalRows == 0

def test_given_horses_I_expect_the_same_horse_back():
  headers = sample_headers()
  horse_data = sample_horse_data()
  filter_metadata = None
  sort_metadata = None
  pagination_metadata = None
  result = filter_sort_paginate_table(headers, horse_data, filter_metadata,
                                        sort_metadata, pagination_metadata)

  expected = [  ["Thoroughbred", "Bay", '1.6', '3', 'True'],
                ["Thoroughbred", "Grey", '1.55', '3', 'True'],
                ["Arabian horse", "Bay", '1.51', '5', 'True'],
                ["Shetland Pony", "Black", '1.01', '2', 'False'],
                ["Shire horse", "Black", '1.71', '4', 'True'],
            ]

  assert result.totalRows == len(horse_data)
  assert expected == result.rowData

def test_sort_data_by_height_descending():
  headers = sample_headers()
  horse_data = sample_horse_data()
  filter_metadata = None
  sort_metadata = SortMetadataDto(column_header="Height", order="DESCENDING")
  pagination_metadata = None

  result = filter_sort_paginate_table(headers, horse_data, filter_metadata,
                                        sort_metadata, pagination_metadata)

  expected = [  ["Shire horse", "Black", '1.71', '4', 'True'],
                ["Thoroughbred", "Bay", '1.6', '3', 'True'],
                ["Thoroughbred", "Grey", '1.55', '3', 'True'],
                ["Arabian horse", "Bay", '1.51', '5', 'True'],
                ["Shetland Pony", "Black", '1.01', '2', 'False'],
            ]

  assert expected == result.rowData        
  
  headers = sample_headers()
  horse_data = [["Thoroughbred", "Bay", 1.60, 3, True],
                  ["Shire horse", "Black", 1.71, 4, True],
                  ]
  filter_metadata = None
  sort_metadata = SortMetadataDto(column_header="Height", order="DESCENDING")
  pagination_metadata = None

  result = filter_sort_paginate_table(headers, horse_data, filter_metadata,
                                        sort_metadata, pagination_metadata)

  expected = [  
                 ["Shire horse", "Black", '1.71', '4', 'True'],
                ["Thoroughbred", "Bay", '1.6', '3', 'True'],
            ]

  assert expected == result.rowData   


