require 'rails_helper'
require 'ruby_jard'

RSpec.describe "Tasks", type: :system do
  let(:user) { create :user }
  before(:each) { sign_in user }

  describe "GET /tasks" do
    it 'has a correct title' do
      visit '/tasks'
      expect(page).to have_content 'Listing tasks'
    end
  end

  describe "POST /tasks/new" do
    let!(:category) { create :category }
    let!(:participant) { create :user }
    it 'has a correct title', js: true do
      visit '/tasks/new'

      fill_in 'task[name]', with: 'Test 34'
      fill_in 'task[description]', with: 'Test'
      fill_in 'task[due_date]', with: Date.today + 5.day
      select category.name, from: 'task_category_id'

      click_link 'Agregar participante'
      xpath = '//*[@id="new_task"]/div[1]/div[6]/div[1]'

      within(:xpath, xpath) do
        select participant.id.to_s, from: 'User'
        select '1', from: 'Role'
      end
      click_botton 'Crear Task'

      expect(page).to have_content('Task was successfully created.')
    end
  end
end
