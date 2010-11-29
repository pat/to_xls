module ToXls::Array
  def to_xls(options = {})
    data = StringIO.new ToXls::Writer.new(self, options).to_s
    data.string
  end
end
