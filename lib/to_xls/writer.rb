class ToXls::Writer
  attr_accessor :array, :options
  
  def initialize(array, options = {})
    @array   = array
    @options = options
  end
  
  def to_s
    generate
    workbook.close
    stream.string
  end
  
  private
  
  def array_type
    array.first.class
  end
  
  def columns
    @columns ||= options[:columns] || array_type.column_names.collect(&:to_sym)
  end
  
  def headers
    @headers ||= options[:headers] || columns.collect(&:to_s)
  end
  
  def headers?
    options[:headers] || options[:headers].nil?
  end
  
  def stream
    @stream ||= StringIO.new ''
  end
  
  def workbook
    @workbook ||= Spreadsheet::Excel::Workbook.new stream
  end
  
  def worksheet
    @worksheet ||= workbook.add_worksheet options[:name] || 'Sheet 1'
  end
  
  def generate
    add_headers if headers?
    add_rows
  end
  
  def add_headers
    worksheet.write_row 0, 0, headers
  end
  
  def add_rows
    offset = headers? ? 1 : 0
    array.each_with_index do |item, index|
      worksheet.write_row index + offset, 0, columns_for_item(item)
    end
  end
  
  def columns_for_item(item)
    columns.collect { |col| column_value item.send(col) }
  end
  
  def column_value(value)
    case value
    when Symbol
      value.to_s
    when Array
      value.join(', ')
    when Hash
      value.keys.collect { |key| "#{key}: #{value[key]}" }.join(', ')
    else
      value
    end
  end
end
