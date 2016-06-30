# frozen_string_literal: true
require 'rails_helper'

RSpec.describe 'events/index', type: :view do
  before(:each) do
    assign(:events, [
             Event.create!(
               title: 'Title',
               description: 'Description',
               user: FactoryGirl.create(:user)
             ),
             Event.create!(
               title: 'Title',
               description: 'Description',
               user: FactoryGirl.create(:another_user)
             )
           ])
  end

  it 'renders a list of events' do
    render
    assert_select 'tr>td', text: 'Title'.to_s, count: 2
    assert_select 'tr>td', text: 'Description'.to_s, count: 2
    assert_select 'tr>td', text: nil.to_s, count: 2
  end
end
