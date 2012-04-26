require 'spec_helper'

describe Homura::LayoutHelper do
  describe '#controller_action_full_name' do
    it 'should be "controller#action"' do
      controller.params[:controller] = 'controller'
      controller.params[:action] = 'action'
      helper.controller_action_full_name.should == 'controller#action'
    end
  end

  describe '#page_classes' do
    it 'should be "controller action"' do
      controller.params[:controller] = 'controller'
      controller.params[:action] = 'action'
      helper.page_classes.should == 'controller action'
    end

    context 'when nesting' do
      it 'should be "namespace_controller action"' do
        controller.params[:controller] = 'namespace/controller'
        controller.params[:action] = 'action'
        helper.page_classes.should == 'namespace_controller action'
      end
    end
  end

  describe '#page_title' do
    it 'should default to nil' do
      helper.page_title.should be_nil
    end

    it 'should access page title' do
      helper.page_title 'title'
      helper.page_title.should == 'title'
    end
  end

  describe '#page_description' do
    it 'should default to nil' do
      helper.page_description.should be_nil
    end

    it 'should access page description' do
      helper.page_description 'description'
      helper.page_description.should == 'description'
    end
  end

  describe '#canonical_link' do
    it 'should default to nil' do
      helper.canonical_link.should be_nil
    end

    it 'should access canonical link' do
      helper.canonical_link 'http://example.com'
      helper.canonical_link.should == 'http://example.com'
    end

    it 'should raise error if not a url' do
      -> {
        helper.canonical_link 'not a url'
      }.should raise_error
    end
  end

  describe '#og_properties' do
    it 'should default to hash that contains site name' do
      helper.stub(:t).with('homura.layout.site_name').and_return('site name')
      helper.og_properties.should == {:site_name => 'site name'}
    end

    it 'should access og_properties' do
      helper.og_properties type: 'website'
      helper.og_properties[:type].should == 'website'
    end
  end
end
