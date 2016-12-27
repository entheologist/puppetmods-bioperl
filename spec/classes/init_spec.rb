require 'spec_helper'
describe 'bioperl' do
  context 'with default values for all parameters' do
    it { should contain_class('bioperl') }
  end
end
