require 'spec_helper'

describe ActsAsLink::Link do
  
  describe 'initialize' do
    
    it 'should initialize with uri variable defined' do
      link = ActsAsLink::Link.new('http://google.com')
      link.instance_variable_get('@uri').should_not be_nil
    end
    
    it 'should initialize with uri variable defined when link has https' do
      link = ActsAsLink::Link.new('https://rubygems.org/gems/acts_as_link')
      link.instance_variable_get('@uri').should_not be_nil
    end
    
    it 'should return an exception when try to initialize with an empty string' do
      lambda{ActsAsLink::Link.new('')}.should raise_error(RuntimeError,/Link is not an url/)
    end
    
    it 'should return an exception when try to initialize with a string is not a link' do
      lambda{ActsAsLink::Link.new('test.com.br')}.should raise_error(RuntimeError,/Link is not an url/)
    end
    
  end
  
  describe 'is_broken?' do
    
    it 'should return false when link is live' do
      link = ActsAsLink::Link.new('http://google.com')
      link.is_broken?.should be_false
    end
    
    it 'should return true when link is broken' do
      link = ActsAsLink::Link.new('http://www.vizir.com.br/not_exists_page')
      link.is_broken?.should be_true
    end
    
  end
  
  describe 'is_an_image?' do
    
    it 'should return true when url links to an image' do
      link = ActsAsLink::Link.new('http://www.google.com/images/srpr/nav_logo35.png')
      link.is_an_image?.should be_true
    end
    
    it 'should return false when url does not link to an image' do
      link = ActsAsLink::Link.new('http://www.google.com')
      link.is_an_image?.should be_false
    end
    
    it 'should return false when url links to a pdf file' do
      link = ActsAsLink::Link.new('http://qualidadebr.files.wordpress.com/2009/06/livro-qualidadebr.pdf')
      link.is_an_image?.should be_false
    end
    
    it 'should return false when url extension image is not in the end' do
      link = ActsAsLink::Link.new('http://www.google.com/images/srpr/nav_.pnglogo35')
      link.is_an_image?.should be_false
    end
    
    it 'should return true for all image extensions defined' do
      ActsAsLink::Link::IMAGE_EXTENSIONS.each do |ext|
        link = ActsAsLink::Link.new("http://www.google.com/images/srpr/nav_logo35#{ext}")
        link.is_an_image?.should be_true
      end
    end
    
  end
  
  describe 'shorten' do
    
    it 'should return shortened link' do
      link = ActsAsLink::Link.new('http://www.google.com')
      link.shorten.include?('bit.ly').should be_true
    end
    
  end
end
