require 'rails_helper'

RSpec.describe 'Schedules' do
  let(:user) { create(:user) }
  let(:schedule) { create(:schedule, user:) }

  describe 'Event CRUD' do
    describe 'イベント新規作成' do
      it 'イベント新規作成ができる', js: true do
        login_as(user)
        visit schedule_path(schedule)
        click_on 'イベント作成'
        fill_in '開始時間（必須）', with: Time.zone.local(2000, 1, 1, 12, 00, 00)
        fill_in '終了時間', with: Time.zone.local(2000, 1, 1, 12, 00, 00)
        fill_in 'タイトル（必須）', with: 'イベント投稿テスト'
        fill_in '価格', with: '500'
        fill_in 'コメント', with: 'コメントのテストをしています'
        click_button '作成'
        expect(page).to have_content 'イベント投稿テスト'
        expect(page).to have_current_path schedule_path(schedule), ignore_query: true
      end
    end
  end
end
