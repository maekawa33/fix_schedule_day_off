require 'rails_helper'

RSpec.describe 'Schedules' do
  let(:user) { create(:user) }

  describe 'Schedule CRUD' do
    describe 'スケジュール新規作成' do
      it 'スケジュール新規作成ができる' do
        login_as(user)
        visit new_schedule_path
        fill_in 'スケジュール名', with: '投稿テスト'
        select '1人', from: '人数'
        fill_in '起床時間', with: '00:00'
        fill_in '就寝時間', with: '00:00'
        click_button '作成'
        expect(page).to have_content '投稿テスト'
        expect(page).to have_current_path schedules_path, ignore_query: true
      end
    end

    describe 'スケジュール投稿の一覧表示' do
      it 'スケジュール投稿一覧を表示できること' do
        login_as(user)
        create(:schedule)
        visit schedules_path
        expect(page).to have_content 'スケジュール'
      end
    end
  end
end
