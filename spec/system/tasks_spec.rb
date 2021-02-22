require 'rails_helper'
require 'ruby_jard'

RSpec.describe "Tasks", type: :system do
  let(:user) { create :user }
  before(:each) { sign_in user }

  describe "GET /tasks" do
    it 'Aplication list all tasks for a user' do
      visit '/tasks'
      expect(page).to have_content 'Lista de Tareas'
    end
  end

  describe "POST /tasks/new" do
    let!(:category) { create :category }
    let!(:participant) { create :user }
    it 'User create a new tasks', js: true do
      visit '/tasks/new'

      fill_in 'task[name]', with: 'Test 34'
      fill_in 'task[description]', with: 'Test'
      fill_in 'task[due_date]', with: Date.today + 5.day
      # select category.name, from: 'task_category_id'
      page.execute_script(
        "document.getElementById('task_category_id').selectize.setValue('#{category.id}')"
      )

      click_link 'Agregar un participante'
      # xpath = '//*[@id="new_task"]/div[1]/div[4]/div[1]'
      # within(:xpath, xpath) do
      #   select participant.email, from: 'Usuario'
      #   select 'responsible', from: 'Rol'
      # end
      page.execute_script(
        "document.querySelector('.selectize.responsible').selectize.setValue('#{participant.id}')"
      )
      page.execute_script(
        "document.querySelector('.selectize.role').selectize.setValue('1')"
      )
      click_button 'Crear Task'

      expect(page).to have_content('Task was successfully created.')
    end
  end
end
