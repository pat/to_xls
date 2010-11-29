require 'spec_helper'

Person = Struct.new :name

describe ToXls do
  let(:stream) {
    [
      Person.new('John'),   Person.new('Paul'),
      Person.new('George'), Person.new('Ringo')
    ].to_xls(:columns => [:name])
  }
  let(:workbook) { Spreadsheet::ParseExcel.parse stream }
  
  describe 'workbook' do
    it "has a single worksheet" do
      workbook.worksheets.length.should == 1
    end
  end
    
  describe 'worksheet' do
    let(:worksheet) { workbook.worksheets.first }
    
    it "sets the name" do
      worksheet.name.should == 'Sheet 1'
    end
    
    it "has a name heading" do
      worksheet.row(0).first.should == 'name'
    end
    
    it "has each of the names of the objects" do
      worksheet.row(1).first.should == 'John'
      worksheet.row(1).first.should == 'Paul'
      worksheet.row(1).first.should == 'George'
      worksheet.row(1).first.should == 'Ringo'
    end
  end
end
