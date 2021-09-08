class SearchService
    def self.search_one_result(ele)
      # binding.pry
      ele[:obj].find_by("#{ele[:keyword_column]}": ele[:keyword])
    end
end