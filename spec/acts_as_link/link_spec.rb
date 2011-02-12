require 'spec_helper'

describe Link do
  
  describe 'initialize' do
    
    it 'should initialize with uri variable defined' do
      link = Link.new('http://google.com')
      link.instance_variable_get('@uri').should_not be_nil
    end
    
    it 'should return an exception when try to initialize with an empty string' do
      lambda{Link.new('')}.should raise_error(RuntimeError,/Link is not an url/)
    end
    
    it 'should return an exception when try to initialize with a number' do
      lambda{Link.new('123')}.should raise_error(RuntimeError,/Link is not an url/)
    end
    
  end
  
  describe 'is_broken?' do
    
    it 'should return false when link is live' do
      link = Link.new('http://google.com')
      link.is_broken?.should be_false
    end
    
    it 'should return true when link is broken' do
      link = Link.new('http://www.vizir.com.br/not_exists_page')
      link.is_broken?.should be_true
    end
    
  end
end
