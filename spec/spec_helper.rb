$:.unshift File.dirname(__FILE__) + '/../lib'

require 'rubygems'
require 'bundler'
 
Bundler.require :default, :development

require 'to_xls'
