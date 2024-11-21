class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|
      t.string "title"
      t.string "body"
      t.integer "user_id"
      t.timestamps
    end
  end
end

# マイグレーションファイル自体は削除したり編集したりしてもOK
# ただし「rails db:migrate:status」でステータス確認したときにUpになっていたら
# 一度DOWNに変更しないといけない。DOWNにしてから再度UPにするとマイグレーションファイルに反映される
# DOWNにするためにのコードは「rails db:migrate:reset」
# リセットすると保存されていたデータが全て消えるので、テスト段階ならリセットし放題
# 今どんなカラムが追加されているのかは「schema.rb」で確認する