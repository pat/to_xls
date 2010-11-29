require 'spreadsheet/excel'
require 'stringio'

module ToXls
  #
end

require 'to_xls/array'
require 'to_xls/writer'

class Array
  include ToXls::Array
end
