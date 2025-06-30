class DropActiveStorageTables < ActiveRecord::Migration[8.0]
  def change
    def up
      drop_table :active_storage_attachments
      drop_table :active_storage_blobs
      drop_table :active_storage_variant_records
    end
    
    # マイグレーションの処理を自動もしくは手動で戻せないことを明示する
    def down
      raise ActiveRecord::IrreversibleMigration
    end
  end
end
