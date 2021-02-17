require 'rails_helper'

RSpec.describe "Tasks", type: :system do
  let(:user) { create :user }
  before(:each) { sign_in user }

  before do
    driven_by(:rack_test)
  end

  describe "GET /tasks" do
    it 'has a correct title' do
      visit '/tasks'
      expect(page).to have_content 'Listing tasks'
    end
  end

  describe "POST /tasks/new" do
    let!(:category) { create :category }
    it 'has a correct title' do
      visit '/tasks/new'

      fill_in 'task[name]', with: 'Test 34'
      fill_in 'task[description]', with: 'Test'
      fill_in 'task[due_date]', with: Date.today + 5.day
      select category.name, from: 'task_category_id'
    end
  end
end
