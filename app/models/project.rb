class Project < ApplicationRecord
  belongs_to :user
  belongs_to :category, optional: true
  SORT_OPTION = [
    [ "Recent Projects", "recent" ],
    [ "Category Name", "category" ],
    [ "Username", "username" ],
    [ "Project Title", "title" ]
  ]
  SORTING_TYPE = [ [ "Ascending", "ASC" ], [ "Descending", "DESC" ] ]
end
