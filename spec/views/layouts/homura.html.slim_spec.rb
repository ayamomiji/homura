require 'spec_helper'

describe 'layouts/homura' do
  it 'should have title' do
    view.should_receive(:page_title_tag)
    render
  end

  it 'should have description' do
    view.should_receive(:page_description_tag)
    render
  end

  it 'should have canonical link' do
    view.should_receive(:canonical_link_tag)
    render
  end

  it 'should have og properties' do
    view.should_receive(:og_properties_tags)
    render
  end
end
