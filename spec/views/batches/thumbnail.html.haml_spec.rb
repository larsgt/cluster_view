require 'spec_helper'

describe 'batches/_thumbnail' do
  context 'with an image' do
    before(:each) do
      render(
        :partial => 'batches/thumbnail', 
        :locals => {
          :sample => mock('sample', :lane => 3),
          :side => 'SIDE',
          :image => mock_model(Image, :id => 1234, :batch_id => 5678, :filename => 'filename foo'),
          :body => 'BODY'
        }
      )
    end

    it 'has a root level element of the right class' do
      response.should have_tag('.thumbnail.SIDE')
    end

    it 'displays a thumbnail' do
      response.should have_tag(:img, :src => batch_thumbnail_path(:id => 5678, :image_id => 1234), :alt => 'filename foo')
    end

    it 'displays a link to the full image' do
      response.should have_link_to(batch_image_path(:id => 5678, :image_id => 1234))
    end

    it 'displays a file upload field' do
      response.should have_file_field(:name => 'batch[images][4][data]')
    end
  end

  context 'without an image' do
    before(:each) do
      render(
        :partial => 'batches/thumbnail', 
        :locals => {
          :sample => mock('sample', :lane => 3),
          :side => 'SIDE',
          :image => nil,
          :body => 'BODY'
        }
      )
    end

    it 'does not display a thumbnail' do
      response.should_not have_tag(:img, :src => batch_thumbnail_path(:id => 5678, :image_id => 1234), :alt => 'filename foo')
    end

    it 'does not display a link to the full image' do
      response.should_not have_link_to(batch_image_path(:id => 5678, :image_id => 1234))
    end

    it 'displays a file upload field' do
      response.should have_file_field(:name => 'batch[images][4][data]')
    end
  end
end