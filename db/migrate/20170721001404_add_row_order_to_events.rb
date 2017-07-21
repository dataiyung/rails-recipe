class AddRowOrderToEvents < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :row_order, :integer

    # 因為要改用這個 row_order 來做排序， 而數據庫已經有的events 默認是nil
    # 因此這裡要設定 row_order 的值，其中 ':last' 是 ranked-model
    Event.find_each do |e|
      e.update( :row_order_position => :last)
    end
      add_index :events, :row_order
  end
end
